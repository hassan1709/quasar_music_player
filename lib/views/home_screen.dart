import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'search_widget.dart';
import 'track_widget.dart';
import 'player_widget.dart';

import '../models/tracks.dart';
import '../models/track.dart';
import '../models/player.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Track> tracks = Provider.of<Tracks>(context, listen: true).tracks;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/quasar.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          title: Text(
            'Quasar Music Player',
            style: TextStyle(
              color: Theme.of(context).primaryTextTheme.headline1.color,
            ),
          ),
          elevation: 1.0,
        ),
        body: Column(
          children: [
            SearchWidget(),
            //Playlist
            Expanded(
              child: ListView.builder(
                itemCount: tracks != null ? tracks.length : 0,
                itemBuilder: (_, index) => TrackWidget(tracks[index]),
              ),
            ),
            //Player
            if (Provider.of<Player>(context, listen: true).playerVisibility) PlayerWidget(),
          ],
        ),
      ),
    );
  }
}
