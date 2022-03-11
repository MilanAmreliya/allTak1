import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:khanakhjana/Route/screen_tab/first_screnn.dart';
import 'package:khanakhjana/Route/screen_tab/secon_tab.dart';
import 'package:khanakhjana/Route/screen_tab/second_1.dart';
import 'package:khanakhjana/Route/screen_tab/third_1.dart';
import 'package:khanakhjana/Route/screen_tab/third_tab.dart';

Widget thirdScreenAll(String route) {
  switch (route) {
    case 'FirstScreenTab':
      return FirstScreenTab();
      break;
    case 'SecondScreenTab':
      return SecondScreenTab();
      break;
    case 'ThirdScreenTab':
      return ThirdScreenTab();
      break;
    case 'ThirdPartOnecreenTab':
      return ThirdPartOnecreenTab(
        bIndex: 2,
        prev: 'ThirdScreenTab',
      );
      break;
    default:
      return ThirdScreenTab();
  }
}
