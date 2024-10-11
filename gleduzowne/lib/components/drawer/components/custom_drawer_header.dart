import 'package:flutter/material.dart';

class CustomDrawerHeader extends StatelessWidget {
  final bool isDarkMode;
  final bool isScriptingMode;
  final Function(bool) onDarkModeToggle;
  final Function(bool) onScriptingModeToggle;

  const CustomDrawerHeader({
    super.key,
    required this.isDarkMode,
    required this.isScriptingMode,
    required this.onDarkModeToggle,
    required this.onScriptingModeToggle,
  });



  // overrides for the head of the drawer

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Gleduzowne',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          SwitchListTile(
            title: const Text('Dark Mode', style: TextStyle(color: Colors.white)),
            value: isDarkMode,
            onChanged: onDarkModeToggle,
          ),
          // SwitchListTile(
          //   title: const Text('Scripting Mode', style: TextStyle(color: Colors.white)),
          //   value: isScriptingMode,
          //   onChanged: onScriptingModeToggle,
          // ),
        ],
      ),
    );
  }
}