import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/tracks.dart';
import '../models/player.dart';
import '../services/search_tracks_service.dart';

BuildContext? _mainContext;

void init(BuildContext c) => _mainContext = c;

class BaseCommand {
  // Models
  Tracks artistTracks = _mainContext!.read();
  Player player = _mainContext!.read();

  // Services
  SearchTracksService artistTracksServices = _mainContext!.read();
}
