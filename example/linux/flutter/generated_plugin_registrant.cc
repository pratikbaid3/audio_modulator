//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <audio_modulator/audio_modulator_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) audio_modulator_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "AudioModulatorPlugin");
  audio_modulator_plugin_register_with_registrar(audio_modulator_registrar);
}
