import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:khanakhjana/Route/screen_tab/tab_bar_viewModel.dart';
import 'package:get/get.dart';

class FirstScreenTab extends StatefulWidget {
  @override
  _FirstScreenTabState createState() => _FirstScreenTabState();
}

class _FirstScreenTabState extends State<FirstScreenTab> {
  TabBarViewModel _tabBarViewModel = Get.find();
  // TabBarViewModel _tabBarViewModel=Get.put

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.deepOrange,
              child: Text('first 1'),
              onPressed: () {
                _tabBarViewModel.setSlectedRoute('FirstSPartOnecreenTab');
              },
            ),
            Text('First tab screen'),
            MaterialButton(
              color: Colors.deepOrange,
              child: Text('first 1'),
              onPressed: () {
                _tabBarViewModel.setSlectedRoute('ThirdPartOnecreenTab');
                _tabBarViewModel.setSelectedBottomIndex(0);
              },
            ),
          ],
        ),
      ),
    );
  }
}
