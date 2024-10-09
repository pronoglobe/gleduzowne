import 'package:flutter/material.dart';
import 'package:flutter_resizable_container/flutter_resizable_container.dart';
import 'package:gleduzowne/components/animator/main.dart';
import 'package:gleduzowne/components/editor/main.dart';
import 'package:gleduzowne/components/terminal/main.dart' as Terminal;
// import 'package:gleduzowne/components/video_editor.dart';
import 'dart:io';
import 'package:gleduzowne/components/sequencer/main.dart' as Video;
// import 'packagee:flutter_resizable_container/'





class Home extends StatelessWidget {
  const Home({super.key});
  // final controller = ResizableController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[



        // Flexible(
        //   flex: 1,
        //   child: NavigationRail(
        //     selectedIndex: 0,
        //     onDestinationSelected: (int index) {},
        //     labelType: NavigationRailLabelType.selected,
        //     destinations: const [
        //       NavigationRailDestination(
        //         icon: Icon(Icons.folder),
        //         label: Text('Projects'),
        //       ),
        //       NavigationRailDestination(
        //         icon: Icon(Icons.search),
        //         label: Text('Find'),
        //       ),
        //       // Add more NavigationRailDestinations for other panels
        //       NavigationRailDestination(
        //         icon: Icon(Icons.folder),
        //         label: Text('Git'),
        //       ),
        //       NavigationRailDestination(
        //         icon: Icon(Icons.folder),
        //         label: Text('Bookmarks'),
        //       ),
        //       NavigationRailDestination(
        //         icon: Icon(Icons.folder),
        //         label: Text('Timeline'),
        //       ),
        //       NavigationRailDestination(
        //         icon: Icon(Icons.folder),
        //         label: Text('Projects'),
        //       ),
        //       NavigationRailDestination(
        //         icon: Icon(Icons.folder),
        //         label: Text('Projects'),
        //       ),
        //     ],
        //   ),
        // ),
        //
        //




        Flexible(
          flex: 4,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[

                    Flexible(
                      flex: 1,
                      child: Container(
                        color: Colors.grey[200],
                        child: const Video.VideoEditorPane(),  // Embed VideoEditor widget here
                      ),
                    ),


                    Flexible(
                      flex: 1,
                      child: Container(
                        color: Colors.grey[200],
                        child: const VideoEditorPane(),  // Embed VideoEditor widget here
                      ),
                    ),


                    Flexible(
                      flex: 1,
                      child: Container(
                        color: Colors.grey[200],
                        child: const VideoEditor(),  // Embed VideoEditor widget here
                      ),
                    ),

                  ],
                ),
              ),




              const Expanded(
                child: Terminal.Home(),  // Ensure Terminal.Home() takes up the remaining space
              ),






            ],
          ),
        ),


















      ],
    );
  }
}























// Flexible(
//   flex: 1,
//   child: Container(
//     color: Colors.grey[300],
//     child: const Center(child: Text(' Editor')),
//   ),
// ),




// import 'package:flutter/material.dart';
// import 'package:gleduzowne/components/terminal/main.dart' as Terminal;
//
// class Home extends StatelessWidget {
//   const Home({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: <Widget>[
//         Flexible(
//           flex: 1,
//           child: NavigationRail(
//             selectedIndex: 0,
//             onDestinationSelected: (int index) {},
//             labelType: NavigationRailLabelType.selected,
//             destinations: const [
//               NavigationRailDestination(
//                 icon: Icon(Icons.folder),
//                 label: Text('Files'),
//               ),
//               NavigationRailDestination(
//                 icon: Icon(Icons.search),
//                 label: Text('Search'),
//               ),
//               // Add more NavigationRailDestinations for other panels
//             ],
//           ),
//         ),
//         Flexible(
//           flex: 4,
//           child: Column(
//             children: <Widget>[
//               Expanded(
//                 child: Row(
//                   children: <Widget>[
//                     Flexible(
//                       flex: 1,
//                       child: Container(
//                         color: Colors.grey[200],
//                         child: const Center(child: Text('Editor Pane')),
//                       ),
//                     ),
//                     Flexible(
//                       flex: 1,
//                       child: Container(
//                         color: Colors.grey[300],
//                         child: const Center(child: Text('Render Pane')),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const Expanded(
//                 child: Terminal.Home(),  // Ensure Terminal.Home() takes up the remaining space
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
//
//






















// import 'package:flutter/material.dart';

// import 'package:gleduzowne/components/terminal/main.dart' as Terminal;

// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: <Widget>[
//         Flexible(
//           flex: 1,
//           child: NavigationRail(
//             selectedIndex: 0,
//             onDestinationSelected: (int index) {},
//             labelType: NavigationRailLabelType.selected,
//             destinations: const [
//               NavigationRailDestination(
//                 icon: Icon(Icons.folder),
//                 label: Text('Files'),
//               ),
//               NavigationRailDestination(
//                 icon: Icon(Icons.search),
//                 label: Text('Search'),
//               ),
//               // Add more NavigationRailDestinations for other panels
//             ],
//           ),
//         ),
//         Flexible(
//           flex: 4,
//           child: Column(
//             children: <Widget>[
//               Expanded(
//                 child: Row(
//                   children: <Widget>[
//                     Flexible(
//                       flex: 1,
//                       child: Container(
//                         color: Colors.grey[200],
//                         child: const Center(child: Text('Editor Pane')),
//                       ),
//                     ),
//                     Flexible(
//                       flex: 1,
//                       child: Container(
//                         color: Colors.grey[300],
//                         child: const Center(child: Text('Render Pane')),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Terminal.Home(),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }