#ifndef FLUTTER_PLUGIN_AUDIO_MODULATOR_PLUGIN_H_
#define FLUTTER_PLUGIN_AUDIO_MODULATOR_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace audio_modulator {

class AudioModulatorPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  AudioModulatorPlugin();

  virtual ~AudioModulatorPlugin();

  // Disallow copy and assign.
  AudioModulatorPlugin(const AudioModulatorPlugin&) = delete;
  AudioModulatorPlugin& operator=(const AudioModulatorPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace audio_modulator

#endif  // FLUTTER_PLUGIN_AUDIO_MODULATOR_PLUGIN_H_
