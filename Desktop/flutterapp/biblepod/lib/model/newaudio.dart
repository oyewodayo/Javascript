import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:biblepod/model/bible_data.dart';
import 'package:biblepod/model/bibleresponse.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BibleAudio extends ChangeNotifier {
  List<BibleResponse> bibles;
  BibleResponse _selectedBible;
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

  playAudio(String url) {
    audioPlayer.play(url);
    // _selectedBible = bibles.firstWhere((element) => element.url == url);
    notifyListeners();
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
