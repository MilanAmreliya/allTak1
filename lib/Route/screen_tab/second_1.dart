import 'package:flutter/material.dart';

class SceondPartOnecreenTab extends StatefulWidget {
  @override
  _SceondPartOnecreenTabState createState() => _SceondPartOnecreenTabState();
}

class _SceondPartOnecreenTabState extends State<SceondPartOnecreenTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Text('second  part one screen'),
        ),
      ),
    );
  }
}
