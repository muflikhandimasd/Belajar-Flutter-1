import 'package:flutter/material.dart';

class DraftPage extends StatelessWidget {
  final Color backgroundColor;
  final Widget body;
  DraftPage({this.backgroundColor = Colors.pink, this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text('Demo Multi-BLoc in MultiPage'),
      ),
      body: body,
    );
  }
}
