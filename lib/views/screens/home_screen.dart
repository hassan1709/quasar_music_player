import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/search_widget.dart';
import '../widgets/track_widget.dart';
import '../widgets/player_widget.dart';

import '../../models/tracks.dart';
import '../../models/track.dart';
import '../../models/player.dart';
import '../helpers/app_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Track> tracks = Provider.of<Tracks>(context, listen: true).tracks;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        appBar: appBar,
        body: Column(
          children: [
            SearchWidget(),
            //Playlist
            Expanded(
              child: ListView.builder(
                itemCount: tracks.length,
                itemBuilder: (_, index) => TrackWidget(tracks[index]),
              ),
            ),
            //Player
            if (Provider.of<Player>(context, listen: true).playerVisibility)
              PlayerWidget(),
          ],
        ),
      ),
    );
  }
}
