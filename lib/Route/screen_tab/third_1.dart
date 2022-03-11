import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

import 'tab_bar_viewModel.dart';

class ThirdPartOnecreenTab extends StatefulWidget {
  final String prev;
  final int bIndex;

  const ThirdPartOnecreenTab({Key key, this.prev, this.bIndex})
      : super(key: key);
  @override
  _ThirdPartOnecreenTabState createState() => _ThirdPartOnecreenTabState();
}

class _ThirdPartOnecreenTabState extends State<ThirdPartOnecreenTab> {
  TabBarViewModel _tabBarViewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _tabBarViewModel.setSlectedRoute(widget.prev);
        _tabBarViewModel.setSelectedBottomIndex(widget.bIndex);
        return Future.value(false);
      },
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Text('third  part one screen'),
          ),
        ),
      ),
    );
  }
}
