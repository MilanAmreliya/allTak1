import 'package:flutter/cupertino.dart';
import 'package:khanakhjana/Route/screen_tab/first_screnn.dart';
import 'package:khanakhjana/Route/screen_tab/secon_tab.dart';
import 'package:khanakhjana/Route/screen_tab/second_1.dart';
import 'package:khanakhjana/Route/screen_tab/third_tab.dart';

Widget secondScreenAll(String route) {
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
    case 'SceondPartOnecreenTab':
      return SceondPartOnecreenTab();
      break;
    default:
      return SecondScreenTab();
  }
}
