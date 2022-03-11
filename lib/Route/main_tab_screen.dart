import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khanakhjana/Route/screen_tab/first_screnn.dart';
import 'package:khanakhjana/Route/screen_tab/tab_bar_viewModel.dart';
import 'package:khanakhjana/Route/second_screen_all_case.dart';
import 'package:khanakhjana/Route/third_all_tab_case.dart';

import 'home_all_screen_tab_route_case.dart';

class TabScreenRoute extends StatefulWidget {
  @override
  _TabScreenRouteState createState() => _TabScreenRouteState();
}

class _TabScreenRouteState extends State<TabScreenRoute> {
  TabBarViewModel _tabBarViewModel = Get.put(TabBarViewModel());
  List<BottomNavigationBarItem> buildBottomNavBarItems(
      {int bottomSelectedIndex}) {
    return [
      BottomNavigationBarItem(
          icon: bottomSelectedIndex == 0
              ? Icon(
                  Icons.home,
                  color: Colors.deepOrange,
                )
              : Icon(
                  Icons.home,
                  color: Colors.black,
                ),
          label: ''),
      BottomNavigationBarItem(
          icon: bottomSelectedIndex == 1
              ? Icon(
                  Icons.person,
                  color: Colors.deepOrange,
                )
              : Icon(
                  Icons.person,
                  color: Colors.black,
                ),
          label: ''),
      BottomNavigationBarItem(
          icon: bottomSelectedIndex == 2
              ? Icon(
                  Icons.event,
                  color: Colors.deepOrange,
                )
              : Icon(
                  Icons.event,
                  color: Colors.black,
                ),
          label: ''),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TabBarViewModel>(
      builder: (controller) {
        return Scaffold(
            bottomNavigationBar: Container(
              color: Colors.deepOrange,
              height: 80,
              width: double.infinity,
              child: BottomNavigationBar(
                onTap: (int index) {
                  _tabBarViewModel.setSelectedBottomIndex(index);

                  if (index == 0) {
                    print("0000000000000000000");
                    _tabBarViewModel.setSlectedRoute('FirstScreenTab');
                  } else if (index == 1) {
                    print("11111111111111111");
                    _tabBarViewModel.setSlectedRoute('SecondScreenTab');
                  } else {
                    print("22222222222222222222222");
                    _tabBarViewModel.setSlectedRoute('ThirdScreenTab');
                  }
                },
                items: buildBottomNavBarItems(
                    bottomSelectedIndex: controller.selectedBottomIndex.value),
                showSelectedLabels: true,
                currentIndex: controller.selectedBottomIndex.value,
              ),
            ),
            body: controller.selectedBottomIndex.value == 0
                ? HomeScreenAll(controller.selectedRoute.value)
                : controller.selectedBottomIndex.value == 1
                    ? secondScreenAll(controller.selectedRoute.value)
                    : thirdScreenAll(controller.selectedRoute.value));
      },
    );
  }
}
