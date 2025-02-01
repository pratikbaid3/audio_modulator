import 'dart:io';

import 'package:audio_modulator_example/voice_type.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:audio_modulator/audio_modulator.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isPlaying = false;
  final _audioModulatorPlugin = AudioModulator();

  Future<String> moveAssetToTempDirectory(String assetPath) async {
    final byteData = await rootBundle.load(assetPath);
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/${assetPath.split('/').last}');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    return file.path;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Audio Modulator Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      IconButton(
                        onPressed: isPlaying
                            ? () {
                                setState(() {
                                  isPlaying = false;
                                });
                                _audioModulatorPlugin.stopAudio();
                              }
                            : () async {
                                setState(() {
                                  isPlaying = true;
                                });
                                final path = await moveAssetToTempDirectory(
                                    "assets/audio/audio.mp3");
                                _audioModulatorPlugin.playAudio(
                                    path: path,
                                    pitch: VoiceType.devil,
                                    speed: 1);
                              },
                        icon: isPlaying
                            ? const Icon(
                                Icons.stop,
                                size: 50,
                              )
                            : const Icon(
                                Icons.play_arrow_rounded,
                                size: 50,
                              ),
                      ),
                      const Text("Devil"),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: isPlaying
                            ? () {
                                setState(() {
                                  isPlaying = false;
                                });
                                _audioModulatorPlugin.stopAudio();
                              }
                            : () async {
                                setState(() {
                                  isPlaying = true;
                                });
                                final path = await moveAssetToTempDirectory(
                                    "assets/audio/audio.mp3");
                                _audioModulatorPlugin.playAudio(
                                    path: path, pitch: 1, speed: 1);
                              },
                        icon: isPlaying
                            ? const Icon(
                                Icons.stop,
                                size: 50,
                              )
                            : const Icon(
                                Icons.play_arrow_rounded,
                                size: 50,
                              ),
                      ),
                      const Text("Normal"),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: isPlaying
                            ? () {
                                setState(() {
                                  isPlaying = false;
                                });
                                _audioModulatorPlugin.stopAudio();
                              }
                            : () async {
                                setState(() {
                                  isPlaying = true;
                                });
                                final path = await moveAssetToTempDirectory(
                                    "assets/audio/audio.mp3");
                                _audioModulatorPlugin.playAudio(
                                    path: path,
                                    pitch: VoiceType.chipmunk,
                                    speed: 1);
                              },
                        icon: isPlaying
                            ? const Icon(
                                Icons.stop,
                                size: 50,
                              )
                            : const Icon(
                                Icons.play_arrow_rounded,
                                size: 50,
                              ),
                      ),
                      const Text("Chipmunk"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
