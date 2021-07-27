import 'base_command.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '../models/track.dart';

class SearchTracksCommands extends BaseCommand {
  Future<void> run(String artistName) async {
    try {
      // Call service to get the artists tracks
      Response response = await artistTracksServices.fetchTracks(artistName);

      // Process the response
      final serializedData = json.decode(response.body) as Map<String, dynamic>;

      final List<Track> tracks = [];
      final List extractingTracks = serializedData['results'];

      extractingTracks.forEach((element) {
        if (element['trackId'] != null) {
          tracks.add(Track(
            trackId: element['trackId'],
            url: element['previewUrl'] ?? '',
            trackName: element['trackName'] ?? '',
            artistName: element['artistName'] ?? '',
            albumName: element['collectionName'] ?? '',
            artworkUrl: element['artworkUrl100'] ?? '',
            trackTimeMillis: element['trackTimeMillis'] ?? '',
          ));
        }
      });

      // Inject the model with the tracks obtained
      artistTracks.tracks = tracks;
    } catch (error) {
      throw error;
    }
  }
}
