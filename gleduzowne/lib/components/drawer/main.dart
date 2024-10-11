import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:gleduzowne/components/custom_drawer_header.dart';
import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:gleduzowne/components/drawer/components/custom_drawer_header.dart';

// In your main file
// import 'package:flutter/material.dart';
import 'package:gleduzowne/components/drawer/components/sideitems/buildfileviewport.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isDarkMode = false;
  bool isScriptingMode = false;
  double drawerWidth = 200;
  String selectedItem = 'File';

  void _toggleDarkMode(bool value) {
    setState(() {
      isDarkMode = value;
    });
  }

  void _toggleScriptingMode(bool value) {
    setState(() {
      isScriptingMode = value;
      drawerWidth = value ? MediaQuery.of(context).size.width : 200;
    });
  }

  void _onItemSelected(String item) {
    setState(() {
      selectedItem = item;
    });
  }

  void _detachDrawer() async {
    final window = await DesktopMultiWindow.createWindow(
      jsonEncode({
        'args1': 'value1',
        'args2': 'value2',
      }),
    );
    window
      ..setFrame(const Offset(0, 0) & const Size(800, 600))
      ..setTitle('Detached Drawer')
      ..show();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        body: Row(
          children: <Widget>[
            GestureDetector(
              onHorizontalDragUpdate: (details) {
                setState(() {
                  drawerWidth += details.delta.dx;
                  if (drawerWidth < 200) drawerWidth = 200;
                  if (drawerWidth > MediaQuery.of(context).size.width / 4) {
                    drawerWidth = MediaQuery.of(context).size.width / 4;
                  }
                });
              },
              child: Container(
                width: drawerWidth,
                color: Colors.purple,
                child: Column(
                  children: [
                    CustomDrawerHeader(
                      isDarkMode: isDarkMode,
                      // isScriptingMode: isScriptingMode,
                      isScriptingMode: isScriptingMode,
                      onDarkModeToggle: _toggleDarkMode,
                      onScriptingModeToggle: _toggleScriptingMode,
                      // onScriptingModeToggle: ,

                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          _buildDrawerItem(Icons.folder, 'File'),
                          _buildDrawerItem(Icons.extension, 'Extensions'),
                          _buildDrawerItem(Icons.search, 'Search'),
                          _buildDrawerItem(Icons.movie, 'Sequences'),
                          _buildDrawerItem(Icons.animation, 'Animate'),
                          _buildDrawerItem(Icons.bug_report, 'Debug'),
                          _buildDrawerItem(Icons.smart_toy, 'AI'),
                          _buildDrawerItem(Icons.blender, 'Render'),
                          const Divider(),
                          _buildDrawerItem(Icons.settings, 'Settings'),
                          _buildDrawerItem(Icons.info, 'About'),
                          _buildDrawerItem(Icons.verified, 'Version'),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _detachDrawer,
                      child: const Text('Detach Drawer'),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: _buildViewport(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String label) {
    return ListTile(
      leading: Icon(icon, color: Colors.red),
      title: Text(label, style: const TextStyle(color: Colors.white)),
      selected: selectedItem == label,
      onTap: () => _onItemSelected(label),
    );
  }

  Widget _buildViewport() {
    switch (selectedItem) {
      case 'File':
        return _buildFileViewport();
      case 'Extensions':
        return _buildExtensionsViewport();
      case 'Search':
        return _buildSearchViewport();
      case 'Sequences':
        return _buildSequencesViewport();
      case 'Animate':
        return _buildAnimateViewport();
      case 'Debug':
        return _buildDebugViewport();
      case 'AI':
        return _buildAIVieport();
      case 'Render':
        return _buildRenderViewport();
      case 'Settings':
        return _buildSettingsViewport();
      case 'About':
        return _buildAboutViewport();
      case 'Version':
        return _buildVersionViewport();
      default:
        return Container();
    }
  }

  // Widget _buildFileViewport() {
  //   return const Center(child: Text('File Viewport'));
  // }


  Widget _buildFileViewport() {
    return const FileExplorer();
  }

  Widget _buildExtensionsViewport() {
    return const Center(child: Text('Extensions Viewport'));
  }

  Widget _buildSearchViewport() {
    return const Center(child: Text('Search Viewport'));
  }

  Widget _buildSequencesViewport() {
    return const Center(child: Text('Sequences Viewport'));
  }

  Widget _buildAnimateViewport() {
    return const Center(child: Text('Animate Viewport'));
  }

  Widget _buildDebugViewport() {
    return const Center(child: Text('Debug Viewport'));
  }

  Widget _buildAIVieport() {
    return const Center(child: Text('AI Viewport'));
  }

  Widget _buildRenderViewport() {
    return const Center(child: Text('Render Viewport'));
  }

  Widget _buildSettingsViewport() {
    return const Center(child: Text('Settings Viewport'));
  }

  Widget _buildAboutViewport() {
    return const Center(child: Text('About Viewport'));
  }

  Widget _buildVersionViewport() {
    return const Center(child: Text('Version Viewport'));
  }
}































// import 'package:flutter/material.dart';
// // import 'package:gleduzowne/components/custom_drawer_header.dart';
// import 'package:desktop_multi_window/desktop_multi_window.dart';
// import 'dart:convert';
// import 'dart:ui';
//
// import 'package:gleduzowne/components/drawer/components/custom_drawer_header.dart';
//
// class Home extends StatefulWidget {
//   const Home({super.key});
//
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   bool isDarkMode = false;
//   bool isScriptingMode = false;
//   double drawerWidth = 200;
//   String selectedItem = 'File';
//
//   void _toggleDarkMode(bool value) {
//     setState(() {
//       isDarkMode = value;
//     });
//   }
//
//   void _toggleScriptingMode(bool value) {
//     setState(() {
//       isScriptingMode = value;
//       drawerWidth = value ? MediaQuery.of(context).size.width : 200;
//     });
//   }
//
//   void _onItemSelected(String item) {
//     setState(() {
//       selectedItem = item;
//     });
//   }
//
//   void _detachDrawer() async {
//     final window = await DesktopMultiWindow.createWindow(
//       jsonEncode({
//         'args1': 'value1',
//         'args2': 'value2',
//       }),
//     );
//     window
//       ..setFrame(const Offset(0, 0) & const Size(800, 600))
//       ..setTitle('Detached Drawer')
//       ..show();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
//       home: Scaffold(
//         body: LayoutBuilder(
//           builder: (context, constraints) {
//             final maxDrawerWidth = constraints.maxWidth * 0.5;
//             return Stack(
//               children: [
//                 // Main content blurred out
//                 BackdropFilter(
//                   filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
//                   child: Container(
//                     color: Colors.black.withOpacity(0.5),
//                   ),
//                 ),
//                 // Drawer and viewport
//                 Row(
//                   children: <Widget>[
//                     GestureDetector(
//                       onHorizontalDragUpdate: (details) {
//                         setState(() {
//                           drawerWidth += details.delta.dx;
//                           if (drawerWidth < 200) drawerWidth = 200;
//                           if (drawerWidth > maxDrawerWidth) {
//                             drawerWidth = maxDrawerWidth;
//                           }
//                         });
//                       },
//                       child: Container(
//                         width: drawerWidth,
//                         color: Colors.blue,
//                         child: Column(
//                           children: [
//                             CustomDrawerHeader(
//                               isDarkMode: isDarkMode,
//                               isScriptingMode: isScriptingMode,
//                               onDarkModeToggle: _toggleDarkMode,
//                               onScriptingModeToggle: _toggleScriptingMode,
//                             ),
//                             Expanded(
//                               child: ListView(
//                                 children: [
//                                   _buildDrawerItem(Icons.folder, 'File'),
//                                   _buildDrawerItem(Icons.extension, 'Extensions'),
//                                   _buildDrawerItem(Icons.search, 'Search'),
//                                   _buildDrawerItem(Icons.movie, 'Sequences'),
//                                   _buildDrawerItem(Icons.animation, 'Animate'),
//                                   _buildDrawerItem(Icons.bug_report, 'Debug'),
//                                   _buildDrawerItem(Icons.smart_toy, 'AI'),
//                                   _buildDrawerItem(Icons.blender, 'Render'),
//                                   const Divider(),
//                                   _buildDrawerItem(Icons.settings, 'Settings'),
//                                   _buildDrawerItem(Icons.info, 'About'),
//                                   _buildDrawerItem(Icons.verified, 'Version'),
//
//                                 ],
//                               ),
//                             ),
//                             ElevatedButton(
//                               onPressed: _detachDrawer,
//                               child: const Text('Detach Drawer'),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Container(
//                       width: maxDrawerWidth - drawerWidth,
//                       color: Colors.white,
//                       child: _buildViewport(),
//                     ),
//
//
//
//                     Positioned(
//                       // right: 16.0,
//                       // bottom: 16.0,
//                       child: FloatingActionButton(
//                         onPressed: () {
//                           Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(builder: (context) => Home()),
//                           );
//                         },
//                         child: Icon(Icons.home),
//                       ),
//                     ),
//
//
//
//
//
//                   ],
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDrawerItem(IconData icon, String label) {
//     return ListTile(
//       leading: Icon(icon, color: Colors.white),
//       title: Text(label, style: const TextStyle(color: Colors.white)),
//       selected: selectedItem == label,
//       onTap: () => _onItemSelected(label),
//     );
//   }
//
//   Widget _buildViewport() {
//     switch (selectedItem) {
//       case 'File':
//         return _buildFileViewport();
//       case 'Extensions':
//         return _buildExtensionsViewport();
//       case 'Search':
//         return _buildSearchViewport();
//       case 'Sequences':
//         return _buildSequencesViewport();
//       case 'Animate':
//         return _buildAnimateViewport();
//       case 'Debug':
//         return _buildDebugViewport();
//       case 'AI':
//         return _buildAIVieport();
//       case 'Render':
//         return _buildRenderViewport();
//       case 'Settings':
//         return _buildSettingsViewport();
//       case 'About':
//         return _buildAboutViewport();
//       case 'Version':
//         return _buildVersionViewport();
//       default:
//         return Container();
//     }
//   }
//
//   Widget _buildFileViewport() {
//     return Center(child: Text('File Viewport'));
//   }
//
//   Widget _buildExtensionsViewport() {
//     return Center(child: Text('Extensions Viewport'));
//   }
//
//   Widget _buildSearchViewport() {
//     return Center(child: Text('Search Viewport'));
//   }
//
//   Widget _buildSequencesViewport() {
//     return Center(child: Text('Sequences Viewport'));
//   }
//
//   Widget _buildAnimateViewport() {
//     return Center(child: Text('Animate Viewport'));
//   }
//
//   Widget _buildDebugViewport() {
//     return Center(child: Text('Debug Viewport'));
//   }
//
//   Widget _buildAIVieport() {
//     return Center(child: Text('AI Viewport'));
//   }
//
//   Widget _buildRenderViewport() {
//     return Center(child: Text('Render Viewport'));
//   }
//
//   Widget _buildSettingsViewport() {
//     return Center(child: Text('Settings Viewport'));
//   }
//
//   Widget _buildAboutViewport() {
//     return Center(child: Text('About Viewport'));
//   }
//
//   Widget _buildVersionViewport() {
//     return Center(child: Text('Version Viewport'));
//   }
// }