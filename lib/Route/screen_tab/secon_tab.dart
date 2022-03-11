import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khanakhjana/Route/screen_tab/tab_bar_viewModel.dart';

class SecondScreenTab extends StatefulWidget {
  @override
  _SecondScreenTabState createState() => _SecondScreenTabState();
}

class _SecondScreenTabState extends State<SecondScreenTab> {
  TabBarViewModel _tabBarViewModel = Get.find();

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
              child: Text('seccond 1'),
              onPressed: () {
                _tabBarViewModel.setSlectedRoute('SceondPartOnecreenTab');
              },
            ),
            Text('First tab screen'),
          ],
        ),
      ),
    );
  }
}
