import 'package:flutter/foundation.dart';

class Player extends ChangeNotifier {
  bool _playerVisibility = false;
  bool _isPlaying = false;
  Duration _duration = Duration();
  Duration _position = Duration();

  bool get playerVisibility {
    return _playerVisibility;
  }

  set playerVisibility(bool visibility) {
    _playerVisibility = visibility;
    notifyListeners();
  }

  bool get isPlaying {
    return _isPlaying;
  }

  set isPlaying(bool isPlaying) {
    _isPlaying = isPlaying;
    notifyListeners();
  }

  Duration get duration {
    return _duration;
  }

  set duration(Duration duration) {
    _duration = duration;
    notifyListeners();
  }

  Duration get position {
    return _position;
  }

  set position(Duration position) {
    _position = position;
    notifyListeners();
  }
}
