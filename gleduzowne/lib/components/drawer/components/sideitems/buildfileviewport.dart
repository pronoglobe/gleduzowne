// In widgets/file_explorer.dart
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class FileExplorer extends StatefulWidget {
  const FileExplorer({super.key});

  @override
  _FileExplorerState createState() => _FileExplorerState();
}

class _FileExplorerState extends State<FileExplorer> {
  late Directory _currentDirectory;
  List<FileSystemEntity> _files = [];

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
    // Logic to open the file
    // If unable to open, show error overlay
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Unable to open file.'),
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
          );
        },
      ),
    );
  }
}