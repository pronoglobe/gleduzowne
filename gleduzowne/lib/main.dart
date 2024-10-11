// import 'dart:convert';
// import 'dart:io';
//
// import 'package:gleduzowne/src/platform_menu.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_pty/flutter_pty.dart';
// import 'package:xterm/xterm.dart';
//
// void main() {
//   runApp(MyApp());
// }
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
//           (_) {
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
//         .transform(Utf8Decoder())
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
//
//
//
//
//































import 'package:flutter/material.dart';
import 'package:gleduzowne/screens/home/main.dart' as Home;
import 'package:gleduzowne/components/terminal/main.dart';
import 'package:gleduzowne/components/drawer/main.dart' as Drawer;

void main() {
  runApp(const MyIDEApp());
}

class MyIDEApp extends StatelessWidget {
  const MyIDEApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter IDE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gleduzowne Animator'),
      ),










      // drawer: Drawer(
      //   child: ListView(
      //     children: <Widget>[
      //       const DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //         ),
      //         child: Text('Gleduzowne'),
      //       ),
      //       ListTile(
      //         title: const Text('File'),
      //         onTap: () {},
      //       ),
      //       // Add more ListTiles for other menu items
      //     ],
      //   ),
      // ),

      // drawer: const Drawer.Home(),


      drawer: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: constraints.maxWidth * 0.5,
            child: const Drawer.Home(
              // child: Home(),
            ),
          );
        },
      ),





      body: Home.CustomDividerExampleScreen(),

      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.terminal),
      //       label: 'Terminal',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.notifications),
      //       label: 'Notifications',
      //     ),
      //     // Add more BottomNavigationBarItems for other items
      //   ],
      //   onTap: (index) {
      //     // Handle bottom navigation bar item taps
      //   },
      // ),
      //



    );
    // debug
  }
}





























// import 'package:flutter/material.dart';
// import 'package:gleduzowne/screens/home/main.dart'

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
