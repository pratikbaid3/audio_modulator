#include "include/audio_modulator/audio_modulator_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "audio_modulator_plugin.h"

void AudioModulatorPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  audio_modulator::AudioModulatorPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
