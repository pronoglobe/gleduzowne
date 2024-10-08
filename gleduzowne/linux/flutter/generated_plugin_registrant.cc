//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <bitsdojo_window_linux/bitsdojo_window_plugin.h>
#include <contextual_menu/contextual_menu_plugin.h>
#include <desktop_drop/desktop_drop_plugin.h>
#include <desktop_multi_window/desktop_multi_window_plugin.h>
#include <flutter_acrylic/flutter_acrylic_plugin.h>
#include <flutter_window_close/flutter_window_close_plugin.h>
#include <hotkey_manager_linux/hotkey_manager_linux_plugin.h>
#include <record_linux/record_linux_plugin.h>
#include <url_launcher_linux/url_launcher_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) bitsdojo_window_linux_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "BitsdojoWindowPlugin");
  bitsdojo_window_plugin_register_with_registrar(bitsdojo_window_linux_registrar);
  g_autoptr(FlPluginRegistrar) contextual_menu_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "ContextualMenuPlugin");
  contextual_menu_plugin_register_with_registrar(contextual_menu_registrar);
  g_autoptr(FlPluginRegistrar) desktop_drop_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "DesktopDropPlugin");
  desktop_drop_plugin_register_with_registrar(desktop_drop_registrar);
  g_autoptr(FlPluginRegistrar) desktop_multi_window_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "DesktopMultiWindowPlugin");
  desktop_multi_window_plugin_register_with_registrar(desktop_multi_window_registrar);
  g_autoptr(FlPluginRegistrar) flutter_acrylic_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FlutterAcrylicPlugin");
  flutter_acrylic_plugin_register_with_registrar(flutter_acrylic_registrar);
  g_autoptr(FlPluginRegistrar) flutter_window_close_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FlutterWindowClosePlugin");
  flutter_window_close_plugin_register_with_registrar(flutter_window_close_registrar);
  g_autoptr(FlPluginRegistrar) hotkey_manager_linux_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "HotkeyManagerLinuxPlugin");
  hotkey_manager_linux_plugin_register_with_registrar(hotkey_manager_linux_registrar);
  g_autoptr(FlPluginRegistrar) record_linux_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "RecordLinuxPlugin");
  record_linux_plugin_register_with_registrar(record_linux_registrar);
  g_autoptr(FlPluginRegistrar) url_launcher_linux_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "UrlLauncherPlugin");
  url_launcher_plugin_register_with_registrar(url_launcher_linux_registrar);
}
