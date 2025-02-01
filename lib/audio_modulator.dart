import 'dart:io';

import 'package:audio_modulator/src/messages.g.dart';

class AudioModulator {
  Future<void> playAudio(
      {required String path, required double pitch, required int speed}) async {
    double alteredPitch = pitch;
    if (Platform.isAndroid) {
      if (pitch < 0) {
        alteredPitch *= -1;
        alteredPitch = 1 - (alteredPitch / 2400);
      } else {
        alteredPitch = alteredPitch / 600;
      }
    }
    final ExampleHostApi api = ExampleHostApi();
    api.playAudio(
      path,
      alteredPitch,
      speed,
    );
  }

  Future<void> stopAudio() async {
    final ExampleHostApi api = ExampleHostApi();
    api.stopAudio();
  }
}
