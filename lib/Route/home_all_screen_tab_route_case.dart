import 'package:flutter/cupertino.dart';
import 'package:khanakhjana/Route/screen_tab/first_1_.dart';
import 'package:khanakhjana/Route/screen_tab/first_screnn.dart';
import 'package:khanakhjana/Route/screen_tab/secon_tab.dart';
import 'package:khanakhjana/Route/screen_tab/third_1.dart';
import 'package:khanakhjana/Route/screen_tab/third_tab.dart';

Widget HomeScreenAll(String route) {
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
    case 'FirstSPartOnecreenTab':
      return FirstSPartOnecreenTab();
      break;
    case 'ThirdPartOnecreenTab':
      return ThirdPartOnecreenTab(
        bIndex: 0,
        prev: 'FirstScreenTab',
      );
      break;
    default:
      return FirstScreenTab();
  }
}
