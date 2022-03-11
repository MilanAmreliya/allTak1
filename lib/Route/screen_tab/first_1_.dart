import 'package:flutter/material.dart';

class FirstSPartOnecreenTab extends StatefulWidget {
  @override
  _FirstSPartOnecreenTabState createState() => _FirstSPartOnecreenTabState();
}

class _FirstSPartOnecreenTabState extends State<FirstSPartOnecreenTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Text('First part one screen'),
        ),
      ),
    );
  }
}
