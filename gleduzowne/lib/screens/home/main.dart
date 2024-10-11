import 'package:gleduzowne/components/animator/main.dart';
import 'package:gleduzowne/components/editor/main.dart';
import 'package:gleduzowne/file_asset_paths.dart';
import 'package:gleduzowne/widgets/code_view_dialog.dart';
import 'package:gleduzowne/widgets/nav_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_resizable_container/flutter_resizable_container.dart';
import 'package:gleduzowne/components/sequencer/main.dart' as Video;
import 'package:gleduzowne/components/terminal/main.dart' as Terminal;

class CustomDividerExampleScreen extends StatefulWidget {
  const CustomDividerExampleScreen({super.key});

  @override
  State<CustomDividerExampleScreen> createState() =>
      _CustomDividerExampleScreenState();
}

class _CustomDividerExampleScreenState
    extends State<CustomDividerExampleScreen> {
  var hovered = false;
  var length = 0.5;
  var thickness = 2.0;
  var padding = 5.0;
  var crossAxisAlignment = CrossAxisAlignment.center;
  var mainAxisAlignment = MainAxisAlignment.center;

  @override
  Widget build(BuildContext context) {
    return Scaffold(








      appBar: AppBar(
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(onPressed: () {}, child: const Text('File')),
                    TextButton(onPressed: () {}, child: const Text('Home')),
                    TextButton(onPressed: () {}, child: const Text('Render')),
                    TextButton(onPressed: () {}, child: const Text('Search')),
                    TextButton(onPressed: () {}, child: const Text('Git')),
                    TextButton(onPressed: () {}, child: const Text('Version')),
                    TextButton(onPressed: () {}, child: const Text('Edit')),
                    TextButton(onPressed: () {}, child: const Text('Project')),
                    TextButton(onPressed: () {}, child: const Text('Export')),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.create_new_folder)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.save)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.save_alt)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.print)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),





      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: ResizableContainer(
              direction: Axis.vertical,
              divider: ResizableDivider(
                color: hovered
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.inversePrimary,
                thickness: thickness,
                padding: padding,
                crossAxisAlignment: crossAxisAlignment,
                mainAxisAlignment: mainAxisAlignment,
                length: ResizableSize.ratio(length),
                onHoverEnter: () => setState(() => hovered = true),
                onHoverExit: () => setState(() => hovered = false),
              ),
              children: [
                ResizableChild(
                  child: ColoredBox(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: ResizableContainer(
                      direction: Axis.horizontal,
                      divider: ResizableDivider(
                        color: hovered
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.inversePrimary,
                        thickness: thickness,
                        padding: padding,
                        crossAxisAlignment: crossAxisAlignment,
                        mainAxisAlignment: mainAxisAlignment,
                        length: ResizableSize.ratio(length),
                        onHoverEnter: () => setState(() => hovered = true),
                        onHoverExit: () => setState(() => hovered = false),
                      ),
                      children: [
                        // ResizableChild(
                        //   child: ColoredBox(
                        //     color: Theme.of(context).colorScheme.primaryContainer,
                        //     child: const Video.VideoEditorPane(),
                        //   ),
                        // ),

                        ResizableChild(
                          child: ColoredBox(
                            color: Theme.of(context).colorScheme.primaryContainer,
                            child: const SingleChildScrollView(
                              child: Video.VideoEditorPane(),
                            ),
                          ),
                        ),

                        ResizableChild(
                          child: ColoredBox(
                            color: Theme.of(context).colorScheme.tertiaryContainer,
                            child: const VideoEditorPane(),
                          ),
                        ),
                        ResizableChild(
                          child: ColoredBox(
                            color: Theme.of(context).colorScheme.tertiaryContainer,
                            child: const VideoEditor(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ResizableChild(
                  child: ColoredBox(
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                    child: const Terminal.Home(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}







































// import 'package:gleduzowne/components/animator/main.dart';
// import 'package:gleduzowne/components/editor/main.dart';
// import 'package:gleduzowne/file_asset_paths.dart';
// import 'package:gleduzowne/widgets/code_view_dialog.dart';
// import 'package:gleduzowne/widgets/nav_drawer.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_resizable_container/flutter_resizable_container.dart';
// import 'package:gleduzowne/components/sequencer/main.dart' as Video;
// import 'package:gleduzowne/components/terminal/main.dart' as Terminal;
//
// class CustomDividerExampleScreen extends StatefulWidget {
//   const CustomDividerExampleScreen({super.key});
//
//   @override
//   State<CustomDividerExampleScreen> createState() =>
//       _CustomDividerExampleScreenState();
// }
//
// class _CustomDividerExampleScreenState
//     extends State<CustomDividerExampleScreen> {
//   var hovered = false;
//   var length = 0.5;
//   var thickness = 2.0;
//   var padding = 5.0;
//   var crossAxisAlignment = CrossAxisAlignment.center;
//   var mainAxisAlignment = MainAxisAlignment.center;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: false,
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(2.0),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   TextButton(onPressed: () {}, child: const Text('File')),
//                   TextButton(onPressed: () {}, child: const Text('Home')),
//                   TextButton(onPressed: () {}, child: const Text('Render')),
//                   TextButton(onPressed: () {}, child: const Text('Search')),
//                   TextButton(onPressed: () {}, child: const Text('Git')),
//                   TextButton(onPressed: () {}, child: const Text('Version')),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   IconButton(onPressed: () {}, icon: const Icon(Icons.create_new_folder)),
//                   IconButton(onPressed: () {}, icon: const Icon(Icons.save)),
//                   IconButton(onPressed: () {}, icon: const Icon(Icons.save_alt)),
//                   IconButton(onPressed: () {}, icon: const Icon(Icons.print)),
//                   IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
//                   IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           const SizedBox(height: 10),
//           Expanded(
//             child: ResizableContainer(
//               direction: Axis.vertical,
//               divider: ResizableDivider(
//                 color: hovered
//                     ? Theme.of(context).colorScheme.primary
//                     : Theme.of(context).colorScheme.inversePrimary,
//                 thickness: thickness,
//                 padding: padding,
//                 crossAxisAlignment: crossAxisAlignment,
//                 mainAxisAlignment: mainAxisAlignment,
//                 length: ResizableSize.ratio(length),
//                 onHoverEnter: () => setState(() => hovered = true),
//                 onHoverExit: () => setState(() => hovered = false),
//               ),
//               children: [
//                 ResizableChild(
//                   child: ColoredBox(
//                     color: Theme.of(context).colorScheme.primaryContainer,
//                     child: ResizableContainer(
//                       direction: Axis.vertical,
//                       divider: ResizableDivider(
//                         color: hovered
//                             ? Theme.of(context).colorScheme.primary
//                             : Theme.of(context).colorScheme.inversePrimary,
//                         thickness: thickness,
//                         padding: padding,
//                         crossAxisAlignment: crossAxisAlignment,
//                         mainAxisAlignment: mainAxisAlignment,
//                         length: ResizableSize.ratio(length),
//                         onHoverEnter: () => setState(() => hovered = true),
//                         onHoverExit: () => setState(() => hovered = false),
//                       ),
//                       children: [
//                         ResizableChild(
//                           child: ColoredBox(
//                             color: Theme.of(context).colorScheme.primaryContainer,
//                             child: const Video.VideoEditorPane(),
//                           ),
//                         ),
//                         ResizableChild(
//                           child: ColoredBox(
//                             color: Theme.of(context).colorScheme.tertiaryContainer,
//                             child: const VideoEditorPane(),
//                           ),
//                         ),
//                         ResizableChild(
//                           child: ColoredBox(
//                             color: Theme.of(context).colorScheme.tertiaryContainer,
//                             child: const VideoEditor(),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 ResizableChild(
//                   child: ColoredBox(
//                     color: Theme.of(context).colorScheme.tertiaryContainer,
//                     child: const Terminal.Home(),
//                   ),
//                 ),
//
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//










































// import 'package:gleduzowne/components/animator/main.dart';
// import 'package:gleduzowne/components/editor/main.dart';
// import 'package:gleduzowne/file_asset_paths.dart';
// import 'package:gleduzowne/widgets/code_view_dialog.dart';
// import 'package:gleduzowne/widgets/nav_drawer.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_resizable_container/flutter_resizable_container.dart';
// import 'package:gleduzowne/components/sequencer/main.dart' as Video;
//
// class CustomDividerExampleScreen extends StatefulWidget {
//   const CustomDividerExampleScreen({super.key});
//
//   @override
//   State<CustomDividerExampleScreen> createState() =>
//       _CustomDividerExampleScreenState();
// }
//
// class _CustomDividerExampleScreenState
//     extends State<CustomDividerExampleScreen> {
//   var hovered = false;
//   var length = 0.5;
//   var thickness = 2.0;
//   var padding = 5.0;
//   var crossAxisAlignment = CrossAxisAlignment.center;
//   var mainAxisAlignment = MainAxisAlignment.center;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       appBar: AppBar(
//         // title: const Text('Custom divider example'),
//         centerTitle: false,
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(2.0),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   TextButton(onPressed: () {}, child: const Text('File')),
//                   TextButton(onPressed: () {}, child: const Text('Home')),
//                   TextButton(onPressed: () {}, child: const Text('Render')),
//                   TextButton(onPressed: () {}, child: const Text('Search')),
//                   TextButton(onPressed: () {}, child: const Text('Git')),
//                   TextButton(onPressed: () {}, child: const Text('Version')),
//                 ],
//               ),
//               // Example sub-settings for the 'File' menu
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   IconButton(onPressed: () {}, icon: const Icon(Icons.create_new_folder)),
//                   IconButton(onPressed: () {}, icon: const Icon(Icons.save)),
//                   IconButton(onPressed: () {}, icon: const Icon(Icons.save_alt)),
//                   IconButton(onPressed: () {}, icon: const Icon(Icons.print)),
//                   IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
//                   IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
//                   // Add more icons and buttons as needed
//                 ],
//               ),
//             ],
//           ),
//         ),
//
//       ),
//
//
//       // drawer: const NavDrawer(),
//       body: Column(
//         children: [
//
//           // Row(
//           //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           //   children: [
//           //
//           //   ],
//           // ),
//
//
//           const SizedBox(height: 10),
//
//
//           Expanded(
//
//             child: ResizableContainer(
//
//               direction: Axis.horizontal,
//               divider: ResizableDivider(
//                 color: hovered
//                     ? Theme.of(context).colorScheme.primary
//                     : Theme.of(context).colorScheme.inversePrimary,
//                 thickness: thickness,
//                 padding: padding,
//                 crossAxisAlignment: crossAxisAlignment,
//                 mainAxisAlignment: mainAxisAlignment,
//                 length: ResizableSize.ratio(length),
//                 onHoverEnter: () => setState(() => hovered = true),
//                 onHoverExit: () => setState(() => hovered = false),
//               ),
//
//
//
//               children: [
//                 ResizableChild(
//                   child: ColoredBox(
//                     color: Theme.of(context).colorScheme.primaryContainer,
//                     child: const Video.VideoEditorPane(),
//                   ),
//                 ),
//                 ResizableChild(
//                   child: ColoredBox(
//                     color: Theme.of(context).colorScheme.tertiaryContainer,
//                     child: const VideoEditorPane(),
//                   ),
//                 ),
//
//                 ResizableChild(
//                   child: ColoredBox(
//                     color: Theme.of(context).colorScheme.tertiaryContainer,
//                     child: const VideoEditor(),
//                   ),
//                 ),
//
//               ],
//             ),
//
//
//           ),
//
//
//         ],
//       ),
//     );
//   }
// }
//











































// import 'package:flutter/material.dart';
// import 'package:flutter_resizable_container/flutter_resizable_container.dart';
// import 'package:gleduzowne/components/animator/main.dart';
// import 'package:gleduzowne/components/editor/main.dart';
// import 'package:gleduzowne/components/terminal/main.dart' as Terminal;
// // import 'package:gleduzowne/components/video_editor.dart';
// import 'dart:io';
// import 'package:gleduzowne/components/sequencer/main.dart' as Video;
// // import 'packagee:flutter_resizable_container/'
// import 'package:flutter_resizable_container/flutter_resizable_container.dart';
//
//
//
//
//
// class Home extends StatelessWidget {
//    Home({super.key});
//   // final controller = ResizableController();
//
//   var hovered = false;
//   var length = 0.5;
//   var thickness = 2.0;
//   var padding = 5.0;
//   var crossAxisAlignment = CrossAxisAlignment.center;
//   var mainAxisAlignment = MainAxisAlignment.center;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: <Widget>[
//
//
//
//         // Flexible(
//         //   flex: 1,
//         //   child: NavigationRail(
//         //     selectedIndex: 0,
//         //     onDestinationSelected: (int index) {},
//         //     labelType: NavigationRailLabelType.selected,
//         //     destinations: const [
//         //       NavigationRailDestination(
//         //         icon: Icon(Icons.folder),
//         //         label: Text('Projects'),
//         //       ),
//         //       NavigationRailDestination(
//         //         icon: Icon(Icons.search),
//         //         label: Text('Find'),
//         //       ),
//         //       // Add more NavigationRailDestinations for other panels
//         //       NavigationRailDestination(
//         //         icon: Icon(Icons.folder),
//         //         label: Text('Git'),
//         //       ),
//         //       NavigationRailDestination(
//         //         icon: Icon(Icons.folder),
//         //         label: Text('Bookmarks'),
//         //       ),
//         //       NavigationRailDestination(
//         //         icon: Icon(Icons.folder),
//         //         label: Text('Timeline'),
//         //       ),
//         //       NavigationRailDestination(
//         //         icon: Icon(Icons.folder),
//         //         label: Text('Projects'),
//         //       ),
//         //       NavigationRailDestination(
//         //         icon: Icon(Icons.folder),
//         //         label: Text('Projects'),
//         //       ),
//         //     ],
//         //   ),
//         // ),
//         //
//         //
//
//
//
//
//         Flexible(
//           flex: 4,
//           child: Column(
//             children: <Widget>[
//               Expanded(
//                 child: Row(
//                   children: <Widget>[
//
//                     Flexible(
//                       flex: 1,
//                       child: Container(
//                         color: Colors.grey[200],
//                         child: const Video.VideoEditorPane(),  // Embed VideoEditor widget here
//                       ),
//                     ),
//
//
//                     Flexible(
//                       flex: 1,
//                       child: Container(
//                         color: Colors.grey[200],
//                         child: const VideoEditorPane(),  // Embed VideoEditor widget here
//                       ),
//                     ),
//
//
//                     Flexible(
//                       flex: 1,
//                       child: Container(
//                         color: Colors.grey[200],
//                         child: const VideoEditor(),  // Embed VideoEditor widget here
//                       ),
//                     ),
//
//                   ],
//                 ),
//               ),
//
//
//               const Expanded(
//                 child: Terminal.Home(),  // Ensure Terminal.Home() takes up the remaining space
//               ),
//
//
//             ],
//           ),
//         ),
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//         // Expanded(
//         //   child: ResizableContainer(
//         //     direction: Axis.horizontal,
//         //     divider: ResizableDivider(
//         //       color: hovered
//         //           ? Theme.of(context).colorScheme.primary
//         //           : Theme.of(context).colorScheme.inversePrimary,
//         //       thickness: thickness,
//         //       padding: padding,
//         //       crossAxisAlignment: crossAxisAlignment,
//         //       mainAxisAlignment: mainAxisAlignment,
//         //       length: ResizableSize.ratio(length),
//         //       onHoverEnter: () => setState(() => hovered = true),
//         //       onHoverExit: () => setState(() => hovered = false),
//         //     ),
//         //     children: [
//         //       ResizableChild(
//         //         child: ColoredBox(
//         //           color: Theme.of(context).colorScheme.primaryContainer,
//         //           child: const Center(child: Text('Left')),
//         //         ),
//         //       ),
//         //       ResizableChild(
//         //         child: ColoredBox(
//         //           color: Theme.of(context).colorScheme.tertiaryContainer,
//         //           child: const Center(child: Text('Right')),
//         //         ),
//         //       ),
//         //     ],
//         //   ),
//         // ),
//
//
//
//
//
//
//
//
//
//
//       ],
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// // Flexible(
// //   flex: 1,
// //   child: Container(
// //     color: Colors.grey[300],
// //     child: const Center(child: Text(' Editor')),
// //   ),
// // ),
//
//
//
//
// // import 'package:flutter/material.dart';
// // import 'package:gleduzowne/components/terminal/main.dart' as Terminal;
// //
// // class Home extends StatelessWidget {
// //   const Home({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Row(
// //       children: <Widget>[
// //         Flexible(
// //           flex: 1,
// //           child: NavigationRail(
// //             selectedIndex: 0,
// //             onDestinationSelected: (int index) {},
// //             labelType: NavigationRailLabelType.selected,
// //             destinations: const [
// //               NavigationRailDestination(
// //                 icon: Icon(Icons.folder),
// //                 label: Text('Files'),
// //               ),
// //               NavigationRailDestination(
// //                 icon: Icon(Icons.search),
// //                 label: Text('Search'),
// //               ),
// //               // Add more NavigationRailDestinations for other panels
// //             ],
// //           ),
// //         ),
// //         Flexible(
// //           flex: 4,
// //           child: Column(
// //             children: <Widget>[
// //               Expanded(
// //                 child: Row(
// //                   children: <Widget>[
// //                     Flexible(
// //                       flex: 1,
// //                       child: Container(
// //                         color: Colors.grey[200],
// //                         child: const Center(child: Text('Editor Pane')),
// //                       ),
// //                     ),
// //                     Flexible(
// //                       flex: 1,
// //                       child: Container(
// //                         color: Colors.grey[300],
// //                         child: const Center(child: Text('Render Pane')),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               const Expanded(
// //                 child: Terminal.Home(),  // Ensure Terminal.Home() takes up the remaining space
// //               ),
// //             ],
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }
// //
// //
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// // import 'package:flutter/material.dart';
//
// // import 'package:gleduzowne/components/terminal/main.dart' as Terminal;
//
// // class Home extends StatelessWidget {
// //   const Home({super.key});
//
// //   @override
// //   Widget build(BuildContext context) {
// //     return Row(
// //       children: <Widget>[
// //         Flexible(
// //           flex: 1,
// //           child: NavigationRail(
// //             selectedIndex: 0,
// //             onDestinationSelected: (int index) {},
// //             labelType: NavigationRailLabelType.selected,
// //             destinations: const [
// //               NavigationRailDestination(
// //                 icon: Icon(Icons.folder),
// //                 label: Text('Files'),
// //               ),
// //               NavigationRailDestination(
// //                 icon: Icon(Icons.search),
// //                 label: Text('Search'),
// //               ),
// //               // Add more NavigationRailDestinations for other panels
// //             ],
// //           ),
// //         ),
// //         Flexible(
// //           flex: 4,
// //           child: Column(
// //             children: <Widget>[
// //               Expanded(
// //                 child: Row(
// //                   children: <Widget>[
// //                     Flexible(
// //                       flex: 1,
// //                       child: Container(
// //                         color: Colors.grey[200],
// //                         child: const Center(child: Text('Editor Pane')),
// //                       ),
// //                     ),
// //                     Flexible(
// //                       flex: 1,
// //                       child: Container(
// //                         color: Colors.grey[300],
// //                         child: const Center(child: Text('Render Pane')),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               Terminal.Home(),
// //             ],
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }










// appBar: AppBar(
//   title: const Text('Custom divider example'),
//   centerTitle: false,
//   actions: [
//
//     IconButton(
//       onPressed: () => CodeViewDialog.show(
//         context: context,
//         filePath: FileAssetPaths.dividerScreen,
//       ),
//       icon: const Icon(Icons.code),
//     ),
//
//   ],
// ),








// appBar: AppBar(
//   title: const Text('Custom divider example'),
//   centerTitle: false,
//   actions: [
//     PopupMenuButton<String>(
//       onSelected: (value) {
//         // Handle menu selection
//       },
//       itemBuilder: (BuildContext context) {
//         return [
//           PopupMenuItem<String>(
//             value: 'file',
//             child: Text('File'),
//           ),
//           PopupMenuItem<String>(
//             value: 'home',
//             child: Text('Home'),
//           ),
//           PopupMenuItem<String>(
//             value: 'render',
//             child: Text('Render'),
//           ),
//           PopupMenuItem<String>(
//             value: 'search',
//             child: Text('Search'),
//           ),
//           PopupMenuItem<String>(
//             value: 'git',
//             child: Text('Git'),
//           ),
//           PopupMenuItem<String>(
//             value: 'version',
//             child: Text('Version'),
//           ),
//         ];
//       },
//     ),
//     IconButton(
//       onPressed: () => CodeViewDialog.show(
//         context: context,
//         filePath: FileAssetPaths.dividerScreen,
//       ),
//       icon: const Icon(Icons.code),
//     ),
//   ],
// ),



















// actions: [
//   IconButton(
//     onPressed: () => CodeViewDialog.show(
//       context: context,
//       filePath: FileAssetPaths.dividerScreen,
//     ),
//     icon: const Icon(Icons.code),
//   ),
// ],



// Column(
//   children: [
//     const Text('Length'),
//     Slider(
//       min: 0.01,
//       max: 1.0,
//       value: length,
//       onChanged: (value) => setState(() => length = value),
//     ),
//     Text('Ratio: ${(length * 100).toStringAsFixed((2))}%'),
//   ],
// ),
// Column(
//   children: [
//     const Text('Thickness'),
//     Slider(
//       min: 1,
//       max: 20.0,
//       divisions: 19,
//       value: thickness,
//       onChanged: (value) => setState(() => thickness = value),
//     ),
//     Text('${thickness}px'),
//   ],
// ),
// Column(
//   children: [
//     const Text('Padding'),
//     Slider(
//       min: 0,
//       max: 20,
//       divisions: 20,
//       value: padding,
//       onChanged: (value) => setState(() => padding = value),
//     ),
//     Text('${padding}px'),
//   ],
// ),
// Column(
//   children: [
//     const Text('Cross-Axis Alignment'),
//     DropdownButton(
//       value: crossAxisAlignment,
//       items: const [
//         DropdownMenuItem(
//           value: CrossAxisAlignment.start,
//           child: Text('Start'),
//         ),
//         DropdownMenuItem(
//           value: CrossAxisAlignment.center,
//           child: Text('Center'),
//         ),
//         DropdownMenuItem(
//           value: CrossAxisAlignment.end,
//           child: Text('End'),
//         ),
//       ],
//       onChanged: (value) => setState(
//             () => crossAxisAlignment = value!,
//       ),
//     ),
//   ],
// ),
// Column(
//   children: [
//     const Text('Main-Axis Alignment'),
//     DropdownButton(
//       value: mainAxisAlignment,
//       items: const [
//         DropdownMenuItem(
//           value: MainAxisAlignment.start,
//           child: Text('Start'),
//         ),
//         DropdownMenuItem(
//           value: MainAxisAlignment.center,
//           child: Text('Center'),
//         ),
//         DropdownMenuItem(
//           value: MainAxisAlignment.end,
//           child: Text('End'),
//         ),
//       ],
//       onChanged: (value) => setState(
//             () => mainAxisAlignment = value!,
//       ),
//     ),
//   ],
// ),

