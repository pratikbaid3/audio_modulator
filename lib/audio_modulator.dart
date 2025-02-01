
import 'audio_modulator_platform_interface.dart';

class AudioModulator {
  Future<String?> getPlatformVersion() {
    return AudioModulatorPlatform.instance.getPlatformVersion();
  }
}
