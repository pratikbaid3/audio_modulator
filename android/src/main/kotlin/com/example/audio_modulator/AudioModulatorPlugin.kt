package com.example.audio_modulator

import ExampleHostApi
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import android.media.MediaPlayer
import android.media.SoundPool
import android.media.AudioAttributes
import java.io.IOException

/** AudioModulatorPlugin */
class AudioModulatorPlugin: FlutterPlugin, MethodCallHandler, ExampleHostApi{
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var mediaPlayer: MediaPlayer

  override fun playAudio(path: String, pitch: Double, speed: Long) {
     mediaPlayer = MediaPlayer()
    try {
      mediaPlayer.setDataSource(path)
      mediaPlayer.prepare()
      val playbackParams = mediaPlayer.playbackParams
      playbackParams.pitch = pitch.toFloat()
      playbackParams.speed = speed.toFloat()
      mediaPlayer.playbackParams = playbackParams
      mediaPlayer.start()
    } catch (e: IOException) {
      e.printStackTrace()
    }
  }

  override fun stopAudio() {
    mediaPlayer.stop();
  }
  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "audio_modulator")
    channel.setMethodCallHandler(this)
    ExampleHostApi.setUp(flutterPluginBinding.binaryMessenger, this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
