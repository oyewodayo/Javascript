import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class BibleAudio extends ChangeNotifier {
  Duration totalDuration;
  Duration position;
  String audioState;
  bool isPlaying = false;

  BibleAudio() {
    initAudio();
  }

  AudioPlayer audioPlayer = AudioPlayer();
  initAudio() {
    audioPlayer.onDurationChanged.listen((upDatedDuration) {
      totalDuration = upDatedDuration;
      notifyListeners();
    });
    audioPlayer.onAudioPositionChanged.listen((updatedDuration) {
      position = updatedDuration;
      notifyListeners();
    });

    audioPlayer.onPlayerStateChanged.listen((playerState) {
      if (playerState == AudioPlayerState.STOPPED) audioState = "Stopped";
      if (playerState == AudioPlayerState.PLAYING) audioState = "Playing";
      if (playerState == AudioPlayerState.PAUSED) audioState = "Paused";
      notifyListeners();
    });

    audioPlayer.onPlayerStateChanged.listen((event) {
      if (event == AudioPlayerState.PLAYING) {
        isPlaying = true;
      } else {
        isPlaying = false;
      }
      notifyListeners();
    });
  }

  playAudio() {
    audioPlayer.play(
        "https://naijaloaded.store/wp-content/uploads/2021/04/Diamond-Jimma-Ft.-Dotman-Kokoka.mp3");
  }

  pauseAudio() {
    audioPlayer.pause();
  }

  stopAudio() {
    audioPlayer.stop();
  }

  seekAudio(Duration durationToSeek) {
    audioPlayer.seek(durationToSeek);
  }
}
