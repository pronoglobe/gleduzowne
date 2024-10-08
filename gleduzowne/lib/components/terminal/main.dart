// // ignore_for_file: unused_local_variable, duplicate_ignore, non_constant_identifier_names
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:terminal_flutter/terminal_flutter.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   Directory app_dir = await getApplicationSupportDirectory();
//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: true,
//       title: "Azka Dev",
//       home: App(app_dir: app_dir),
//     ),
//   );
// }
//
// class App extends StatefulWidget {
//   final Directory app_dir;
//   const App({
//     super.key,
//     required this.app_dir,
//   });
//
//   @override
//   MyApp createState() => MyApp();
// }
//
// class MyApp extends State<App> {
//   @override
//   Widget build(BuildContext context) {
//     return TerminalPage(
//       app_dir: widget.app_dir,
//     );
//   }
// }
//
//
//
















// // ignore_for_file: unused_local_variable, duplicate_ignore, non_constant_identifier_names
// import 'dart:io';
// import "package:terminal_flutter/terminal_flutter.dart";
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   Directory app_dir = await getApplicationSupportDirectory();
//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: true,
//       title: "Azka Dev",
//       home: App(app_dir: app_dir,),
//     ),
//   );
// }
//
// class App extends StatefulWidget {
//   final Directory app_dir;
//   const App({
//     super.key,
//     required this.app_dir,
//   });
//   @override
//   MyApp createState() => MyApp();
// }
//
// class MyApp extends State<App> {
//   @override
//   Widget build(BuildContext context) {
//     return TerminalPage(
//       app_dir: widget.app_dir,
//     );
//   }
// }































import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pty/flutter_pty.dart';
import 'package:xterm/xterm.dart';

bool get isDesktop {
  if (kIsWeb) return false;
  return [
    TargetPlatform.windows,
    TargetPlatform.linux,
    TargetPlatform.macOS,
  ].contains(defaultTargetPlatform);
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final terminal = Terminal(
    maxLines: 10000,
  );

  final terminalController = TerminalController();

  late final Pty pty;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.endOfFrame.then(
          (_) {
        if (mounted) _startPty();
      },
    );
  }

  void _startPty() {
    pty = Pty.start(
      shell,
      columns: terminal.viewWidth,
      rows: terminal.viewHeight,
    );

    pty.output
        .cast<List<int>>()
        .transform(const Utf8Decoder())
        .listen(terminal.write);

    pty.exitCode.then((code) {
      terminal.write('the process exited with exit code $code');
    });

    terminal.onOutput = (data) {
      pty.write(const Utf8Encoder().convert(data));
    };

    terminal.onResize = (w, h, pw, ph) {
      pty.resize(h, w);
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: TerminalView(
                terminal,
                controller: terminalController,
                autofocus: true,
                backgroundOpacity: 0.7,
                onSecondaryTapDown: (details, offset) async {
                  final selection = terminalController.selection;
                  if (selection != null) {
                    final text = terminal.buffer.getText(selection);
                    terminalController.clearSelection();
                    await Clipboard.setData(ClipboardData(text: text));
                  } else {
                    final data = await Clipboard.getData('text/plain');
                    final text = data?.text;
                    if (text != null) {
                      terminal.paste(text);
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String get shell {
  if (Platform.isMacOS || Platform.isLinux) {
    return Platform.environment['SHELL'] ?? 'bash';
  }

  if (Platform.isWindows) {
    return 'cmd.exe';
  }

  return 'sh';
}







































// import 'dart:convert';
// import 'dart:io';
//
// // import 'package:gleduzowne/src/platform_menu.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_pty/flutter_pty.dart';
// import 'package:xterm/xterm.dart';
//
// bool get isDesktop {
//   if (kIsWeb) return false;
//   return [
//     TargetPlatform.windows,
//     TargetPlatform.linux,
//     TargetPlatform.macOS,
//   ].contains(defaultTargetPlatform);
// }
//
// class Home extends StatefulWidget {
//   Home({super.key});
//
//   @override
//   // ignore: library_private_types_in_public_api
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   final terminal = Terminal(
//     maxLines: 10000,
//   );
//
//   final terminalController = TerminalController();
//
//   late final Pty pty;
//
//   @override
//   void initState() {
//     super.initState();
//
//     WidgetsBinding.instance.endOfFrame.then(
//       (_) {
//         if (mounted) _startPty();
//       },
//     );
//   }
//
//   void _startPty() {
//     pty = Pty.start(
//       shell,
//       columns: terminal.viewWidth,
//       rows: terminal.viewHeight,
//     );
//
//     pty.output
//         .cast<List<int>>()
//         .transform(const Utf8Decoder())
//         .listen(terminal.write);
//
//     pty.exitCode.then((code) {
//       terminal.write('the process exited with exit code $code');
//     });
//
//     terminal.onOutput = (data) {
//       pty.write(const Utf8Encoder().convert(data));
//     };
//
//     terminal.onResize = (w, h, pw, ph) {
//       pty.resize(h, w);
//     };
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: SafeArea(
//         child: TerminalView(
//           terminal,
//           controller: terminalController,
//           autofocus: true,
//           backgroundOpacity: 0.7,
//           onSecondaryTapDown: (details, offset) async {
//             final selection = terminalController.selection;
//             if (selection != null) {
//               final text = terminal.buffer.getText(selection);
//               terminalController.clearSelection();
//               await Clipboard.setData(ClipboardData(text: text));
//             } else {
//               final data = await Clipboard.getData('text/plain');
//               final text = data?.text;
//               if (text != null) {
//                 terminal.paste(text);
//               }
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
//
// String get shell {
//   if (Platform.isMacOS || Platform.isLinux) {
//     return Platform.environment['SHELL'] ?? 'bash';
//   }
//
//   if (Platform.isWindows) {
//     return 'cmd.exe';
//   }
//
//   return 'sh';
// }
//










// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'xterm.dart demo',
//       debugShowCheckedModeBanner: false,
//       home: AppPlatformMenu(child: Home()),
//       // shortcuts: ,
//     );
//   }
// }


// void main() {
//   runApp(MyApp());
// }
















// import 'dart:convert';  // Import for Utf8Decoder
// import 'dart:typed_data';  // Import for Uint8List
// import 'package:flutter/material.dart';
// import 'package:flutter_pty/flutter_pty.dart';

// class Terminal extends StatefulWidget {
//   const Terminal({super.key});

//   @override
//   _TerminalState createState() => _TerminalState();
// }

// class _TerminalState extends State<Terminal> {
//   late Pty pty;
//   final TextEditingController _controller = TextEditingController();
//   final List<String> _output = [];

//   @override
//   void initState() {
//     super.initState();
//     pty = Pty.start(
//       'bash -i',  // Pass the command as a single string
//     );

//     pty.output.cast<List<int>>().transform(utf8.decoder).listen((data) {
//       setState(() {
//         _output.add(data);
//       });
//     });
//   }

//   @override
//   void dispose() {
//     pty.kill();  // Use kill instead of close
//     super.dispose();
//   }

//   void _sendCommand(String command) {
//     pty.write(Uint8List.fromList('$command\n'.codeUnits));  // Convert string to Uint8List
//     _controller.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 400,
//       color: Colors.black,
//       child: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               reverse: true,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: _output.map((line) {
//                   return Text(
//                     line,
//                     style: const TextStyle(color: Colors.white),
//                   );
//                 }).toList(),
//               ),
//             ),
//           ),
//           TextField(
//             controller: _controller,
//             style: const TextStyle(color: Colors.white),
//             decoration: const InputDecoration(
//               border: InputBorder.none,
//               hintText: 'Enter command',
//               hintStyle: TextStyle(color: Colors.white54),
//             ),
//             onSubmitted: _sendCommand,
//           ),
//         ],
//       ),
//     );
//   }
// }























// import 'package:flutter/material.dart';

// class Terminal extends StatelessWidget {
//   const Terminal({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200,
//       color: Colors.black,
//       child: const Center(
//         child: Text(
//           'Terminal',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//     );
//   }
// }