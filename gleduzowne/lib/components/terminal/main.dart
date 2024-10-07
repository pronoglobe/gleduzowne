import 'package:flutter/material.dart';

class Terminal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.black,
      child: Center(
        child: Text(
          'Terminal',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}