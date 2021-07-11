import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/track.dart';
import '../../models/tracks.dart';
import '../../commands/player_commands.dart';

class TrackWidget extends StatelessWidget {
  final Track track;

  TrackWidget(this.track);

  bool isSelectedTrack(int trackId, BuildContext context) {
    int selectedTrackId = context.read<Tracks>().selectedTrackId;

    if (selectedTrackId == trackId) {
      return true;
    }

    return false;
  }

  void playTrack() {
    PlayerCommands().run(track.trackId);
  }

  @override
  Widget build(BuildContext context) {
    final double trackTime = track.trackTimeMillis / 60000;

    return Card(
      elevation: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          title: Text(
            track.trackName,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.headline2!.fontSize,
              color: Theme.of(context).textTheme.headline2!.color,
            ),
          ),
          subtitle: Text(
            track.artistName + '\n${track.albumName}',
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.headline3!.fontSize,
              color: Theme.of(context).textTheme.headline3!.color,
            ),
          ),
          isThreeLine: true,
          leading: CircleAvatar(
            backgroundImage: NetworkImage(track.artworkUrl),
          ),
          trailing: Column(
            children: <Widget>[
              Text(
                trackTime.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headline4!.fontSize,
                  color: Theme.of(context).textTheme.headline4!.color,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              if (isSelectedTrack(track.trackId, context))
                Icon(
                  Icons.multitrack_audio_sharp,
                  color: Theme.of(context).textTheme.headline4!.color,
                ),
            ],
          ),
          onTap: () {
            playTrack();
          },
        ),
      ),
    );
  }
}
