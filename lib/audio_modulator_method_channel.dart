import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'audio_modulator_platform_interface.dart';

/// An implementation of [AudioModulatorPlatform] that uses method channels.
class MethodChannelAudioModulator extends AudioModulatorPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('audio_modulator');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
