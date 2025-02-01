import 'package:audio_modulator/src/messages.g.dart';

class AudioModulator {
  Future<void> playAudio(
      {required String path, required int pitch, required int speed}) async {
    final ExampleHostApi api = ExampleHostApi();
    api.playAudio(
      path,
      pitch,
      speed,
    );
  }

  Future<void> stopAudio() async {
    final ExampleHostApi api = ExampleHostApi();
    api.stopAudio();
  }
}
