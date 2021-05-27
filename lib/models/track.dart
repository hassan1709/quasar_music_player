import 'package:flutter/foundation.dart';

class Track {
  final int trackId;
  final String url;
  final String trackName;
  final String artistName;
  final String albumName;
  final String artworkUrl;
  final int trackTimeMillis;

  Track({
    @required this.trackId,
    @required this.url,
    @required this.trackName,
    @required this.artistName,
    @required this.albumName,
    @required this.artworkUrl,
    @required this.trackTimeMillis,
  });

  String toString() {
    return 'trackId = $trackId url = $url trackName = $trackName artistName = $artistName albumName = $albumName artworkUrl = $artworkUrl trackTimeMills = $trackTimeMillis';
  }
}
