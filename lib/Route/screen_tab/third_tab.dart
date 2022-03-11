import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khanakhjana/Route/screen_tab/tab_bar_viewModel.dart';

class ThirdScreenTab extends StatefulWidget {
  @override
  _ThirdScreenTabState createState() => _ThirdScreenTabState();
}

class _ThirdScreenTabState extends State<ThirdScreenTab> {
  TabBarViewModel _tabBarViewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _tabBarViewModel.setSelectedBottomIndex(0);
        _tabBarViewModel.setSlectedRoute('FirstScreenTab');
        return Future.value(false);
      },
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                color: Colors.deepOrange,
                child: Text('third 1'),
                onPressed: () {
                  _tabBarViewModel.setSelectedBottomIndex(2);

                  _tabBarViewModel.setSlectedRoute('ThirdPartOnecreenTab');
                },
              ),
              Text('third tab screen'),
            ],
          ),
        ),
      ),
    );
  }
}
