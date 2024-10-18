// In widgets/file_explorer.dart
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:video_player/video_player.dart';

class FileExplorer extends StatefulWidget {
  const FileExplorer({super.key});

  @override
  _FileExplorerState createState() => _FileExplorerState();
}

class _FileExplorerState extends State<FileExplorer> {
  late Directory _currentDirectory;
  List<FileSystemEntity> _files = [];
  VideoPlayerController? _videoController;

  @override
  void initState() {
    super.initState();
    _loadLastDirectory();
  }

  Future<void> _loadLastDirectory() async {
    // Load the last directory from local storage
    final directory = await getApplicationDocumentsDirectory();
    setState(() {
      _currentDirectory = directory;
      _files = directory.listSync();
    });
  }

  void _reloadFiles() {
    setState(() {
      _files = _currentDirectory.listSync();
    });
  }

  void _openFile(FileSystemEntity file) {
    if (file is File) {
      final extension = file.path.split('.').last.toLowerCase();
      if (['jpg', 'jpeg', 'png', 'gif'].contains(extension)) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              child: Image.file(file),
            );
          },
        );
      } else if (['mp4', 'mov', 'avi'].contains(extension)) {
        _videoController = VideoPlayerController.file(file)
          ..initialize().then((_) {
            setState(() {});
            _videoController!.play();
          });
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              child: _videoController!.value.isInitialized
                  ? AspectRatio(
                aspectRatio: _videoController!.value.aspectRatio,
                child: VideoPlayer(_videoController!),
              )
                  : const Center(child: CircularProgressIndicator()),
            );
          },
        );
      } else {
        _showErrorDialog('Unable to open file.');
      }
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _createNewFolder() {
    // Logic to create a new folder
  }

  void _createNewFile() {
    // Logic to create a new file
  }

  void _deleteFileOrFolder(FileSystemEntity entity) {
    // Logic to delete a file or folder
  }

  void _renameFileOrFolder(FileSystemEntity entity) {
    // Logic to rename a file or folder
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Explorer'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _reloadFiles,
          ),
          IconButton(
            icon: const Icon(Icons.create_new_folder),
            onPressed: _createNewFolder,
          ),
        ],
      ),
      body: _files.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Logic to open project file
              },
              child: const Text('Open Project File'),
            ),
            ElevatedButton(
              onPressed: () {
                // Logic to open project from remote
              },
              child: const Text('Open Project from Remote'),
            ),
            ElevatedButton(
              onPressed: () {
                // Logic to open project directory
              },
              child: const Text('Open Project Directory'),
            ),
          ],
        ),
      )
          : ListView.builder(
        itemCount: _files.length,
        itemBuilder: (context, index) {
          final file = _files[index];
          return ListTile(
            title: Text(file.path.split('/').last),
            onTap: () => _openFile(file),
            onLongPress: () {
              showMenu(
                context: context,
                position: const RelativeRect.fromLTRB(100, 100, 100, 100),
                items: [
                  PopupMenuItem(
                    child: const Text('New Folder'),
                    onTap: _createNewFolder,
                  ),
                  PopupMenuItem(
                    child: const Text('New File'),
                    onTap: _createNewFile,
                  ),
                  PopupMenuItem(
                    child: const Text('Delete'),
                    onTap: () => _deleteFileOrFolder(file),
                  ),
                  PopupMenuItem(
                    child: const Text('Add to Project Assets'),
                    onTap: () {},
                  ),
                  PopupMenuItem(
                    child: const Text('Copy'),
                    onTap: () {},
                  ),
                  PopupMenuItem(
                    child: const Text('Paste'),
                    onTap: () {},
                  ),
                  PopupMenuItem(
                    child: const Text('Rename'),
                    onTap: () => _renameFileOrFolder(file),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}