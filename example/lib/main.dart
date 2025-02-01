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
    // Load the asset file
    final byteData = await rootBundle.load(assetPath);

    // Get the temporary directory
    final tempDir = await getTemporaryDirectory();

    // Create a file in the temporary directory
    final file = File('${tempDir.path}/${assetPath.split('/').last}');

    // Write the asset file to the temporary directory
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    // Return the file path
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
                      path: path, pitch: -700, speed: 1);
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
