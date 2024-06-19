#include "include/simple_gamepads/simple_gamepads_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "simple_gamepads_plugin.h"

void SimpleGamepadsPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  simple_gamepads::SimpleGamepadsPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
