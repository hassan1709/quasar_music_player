import 'base_command.dart';
import 'package:audioplayers/audioplayers.dart';
import '../models/track.dart';

class PlayerCommands extends BaseCommand {
  static final PlayerCommands _playerCommands = PlayerCommands._internal();
  factory PlayerCommands() => _playerCommands;

  AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);

  PlayerCommands._internal();

  void run(int trackId) {
    player.playerVisibility = true;
    _playTrack(trackId);
  }

  void _playTrack(int trackId) async {
    print(artistTracks.tracks.length);
    int result;
    artistTracks.selectedTrackId = trackId;
    Track track = artistTracks.findById(artistTracks.selectedTrackId);

    player.isPlaying = true;
    result = await audioPlayer.play(track.url);
    print(result);

    audioPlayer.onPlayerCompletion.listen((_) {
      player.isPlaying = false;
    });

    audioPlayer.onDurationChanged.listen((event) {
      player.duration = event;
    });

    audioPlayer.onAudioPositionChanged.listen((event) {
      player.position = event;
    });
  }

  void pauseOrResumeTrack() async {
    int result;
    if (player.isPlaying) {
      player.isPlaying = false;
      result = await audioPlayer.pause();
    } else {
      player.isPlaying = true;
      result = await audioPlayer.resume();
    }
    print(result);
  }

  void seek(int second) async {
    int result = await audioPlayer.seek(Duration(seconds: second));

    print(result);
  }

  void playNextTrack() {
    Track track = artistTracks.findById(artistTracks.selectedTrackId);
    int index = artistTracks.tracks.indexOf(track);
    index++;
    if (index >= artistTracks.tracks.length) {
      index = artistTracks.tracks.length - 1;
    }
    run(artistTracks.tracks[index].trackId);
  }

  void playPreviousTrack() {
    Track track = artistTracks.findById(artistTracks.selectedTrackId);
    int index = artistTracks.tracks.indexOf(track);
    index--;
    if (index < 0) {
      index = 0;
    }
    run(artistTracks.tracks[index].trackId);
  }
}
