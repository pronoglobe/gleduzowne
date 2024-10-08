//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <auto_updater_windows/auto_updater_windows_plugin_c_api.h>
#include <bitsdojo_window_windows/bitsdojo_window_plugin.h>
#include <connectivity_plus/connectivity_plus_windows_plugin.h>
#include <contextual_menu/contextual_menu_plugin.h>
#include <desktop_multi_window/desktop_multi_window_plugin.h>
#include <disks_desktop/disks_desktop_plugin.h>
#include <flutter_acrylic/flutter_acrylic_plugin.h>
#include <flutter_window_close/flutter_window_close_plugin.h>
#include <hotkey_manager_windows/hotkey_manager_windows_plugin_c_api.h>
#include <record_windows/record_windows_plugin_c_api.h>
#include <share_plus/share_plus_windows_plugin_c_api.h>
#include <url_launcher_windows/url_launcher_windows.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  AutoUpdaterWindowsPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("AutoUpdaterWindowsPluginCApi"));
  BitsdojoWindowPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("BitsdojoWindowPlugin"));
  ConnectivityPlusWindowsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ConnectivityPlusWindowsPlugin"));
  ContextualMenuPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ContextualMenuPlugin"));
  DesktopMultiWindowPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("DesktopMultiWindowPlugin"));
  DisksDesktopPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("DisksDesktopPlugin"));
  FlutterAcrylicPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FlutterAcrylicPlugin"));
  FlutterWindowClosePluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FlutterWindowClosePlugin"));
  HotkeyManagerWindowsPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("HotkeyManagerWindowsPluginCApi"));
  RecordWindowsPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("RecordWindowsPluginCApi"));
  SharePlusWindowsPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("SharePlusWindowsPluginCApi"));
  UrlLauncherWindowsRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("UrlLauncherWindows"));
}
