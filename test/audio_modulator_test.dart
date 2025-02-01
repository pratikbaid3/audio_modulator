import 'package:flutter_test/flutter_test.dart';
import 'package:audio_modulator/audio_modulator.dart';
import 'package:audio_modulator/audio_modulator_platform_interface.dart';
import 'package:audio_modulator/audio_modulator_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAudioModulatorPlatform
    with MockPlatformInterfaceMixin
    implements AudioModulatorPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AudioModulatorPlatform initialPlatform = AudioModulatorPlatform.instance;

  test('$MethodChannelAudioModulator is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAudioModulator>());
  });

  test('getPlatformVersion', () async {
    AudioModulator audioModulatorPlugin = AudioModulator();
    MockAudioModulatorPlatform fakePlatform = MockAudioModulatorPlatform();
    AudioModulatorPlatform.instance = fakePlatform;

    expect(await audioModulatorPlugin.getPlatformVersion(), '42');
  });
}
