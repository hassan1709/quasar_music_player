import 'package:flutter/foundation.dart';
import 'track.dart';

class Tracks extends ChangeNotifier {
  List<Track> _tracks = [];
  int _selectedTrackId = -1;

  List<Track> get tracks {
    return _tracks;
  }

  set tracks(List<Track> tracks) {
    _tracks = tracks;
    notifyListeners();
  }

  int get selectedTrackId {
    return _selectedTrackId;
  }

  set selectedTrackId(int selectedTrackId) {
    _selectedTrackId = selectedTrackId;
    notifyListeners();
  }

  Track findById(int trackId) {
    return _tracks.firstWhere((track) => track.trackId == trackId);
  }
}
