import 'dart:io';

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
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () async {
                  final path =
                      await moveAssetToTempDirectory("assets/audio/audio.mp3");
                  _audioModulatorPlugin.playAudio(
                      path: path, pitch: -800, speed: 1);
                },
                child: const Text("Play Audio"),
              ),
              TextButton(
                onPressed: () async {
                  _audioModulatorPlugin.stopAudio();
                },
                child: const Text("Stop Audio"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
