import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/player.dart';
import '../commands/player_commands.dart';

class PlayerWidget extends StatelessWidget {
  IconButton _iconButton(
    BuildContext context,
    final IconData iconData,
    final Function() onPressed,
  ) {
    return IconButton(
      icon: Icon(
        iconData,
        size: 50.0,
        color: Theme.of(context).highlightColor,
      ),
      onPressed: onPressed,
    );
  }

  IconData playPauseIcon(BuildContext context) {
    if (context.read<Player>().isPlaying) {
      return Icons.pause_circle_filled_outlined;
    }

    return Icons.play_circle_filled_outlined;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //height: 80.0,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).highlightColor,
            blurRadius: 8.0,
          )
        ],
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFFC8E6C9), //green[100]
            Color(0xFFBBDEFB), //blue[100]
            Color(0xFFFFCDD2), //red[100]
            Color(0xFFE1BEE7), // purple[100]
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _iconButton(
                context,
                Icons.skip_previous,
                () {
                  PlayerCommands().playPreviousTrack();
                },
              ),
              _iconButton(
                context,
                playPauseIcon(context),
                () {
                  // Provider.of<Tracks>(context, listen: false).pauseOrResumeTrack();
                  PlayerCommands().pauseOrResumeTrack();
                },
              ),
              _iconButton(context, Icons.skip_next, () {
                PlayerCommands().playNextTrack();
              }),
            ],
          ),
          Slider.adaptive(
            // value: Provider.of<Player>(context, listen: false).position.inSeconds.toDouble(),
            value: context.read<Player>().position.inSeconds.toDouble(),
            min: 0.0,
            // max: Provider.of<Player>(context, listen: false).duration.inSeconds.toDouble(),
            max: context.read<Player>().duration.inSeconds.toDouble(),
            onChanged: (double value) {
              PlayerCommands().seek(value.toInt());
              // Provider.of<Player>(context, listen: false).seek(value.toInt());
            },
            activeColor: Theme.of(context).highlightColor,
            inactiveColor: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }
}
