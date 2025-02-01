import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'audio_modulator_method_channel.dart';

abstract class AudioModulatorPlatform extends PlatformInterface {
  /// Constructs a AudioModulatorPlatform.
  AudioModulatorPlatform() : super(token: _token);

  static final Object _token = Object();

  static AudioModulatorPlatform _instance = MethodChannelAudioModulator();

  /// The default instance of [AudioModulatorPlatform] to use.
  ///
  /// Defaults to [MethodChannelAudioModulator].
  static AudioModulatorPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AudioModulatorPlatform] when
  /// they register themselves.
  static set instance(AudioModulatorPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
