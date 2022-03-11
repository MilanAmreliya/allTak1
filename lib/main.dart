import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:khanakhjana/date_convert/ui.dart';
import 'package:khanakhjana/formValidation/validation_screen.dart';
import 'package:khanakhjana/realtime_database/realtime_database_ui.dart';
import 'package:khanakhjana/realtime_database/show_data_real_time.dart';
import 'package:khanakhjana/stripe_payment_2/stripe_payment_li.dart';
import 'package:khanakhjana/stripe_payment_getway/home.dart';

import 'MvvmStructure_Call_post_api/login_ui_screen.dart';
import 'Route/main_tab_screen.dart';
import 'Route/screen_tab/tab_bar_viewModel.dart';
import 'Slider/slider_screen.dart';
import 'Text_Filed_code/text_filed_screen.dart';
import 'all_validation/text_widget_ui.dart';
import 'apiCallingByGetXXX/screen/getx_Api_callingbyGet_screen.dart';
import 'clippath/clip_oath_widget.dart';
import 'fb_login/FB_LOGIN.dart';
import 'firebase_list_game/register_page_firebase.dart';
import 'google_Map/google_map_screen.dart';
import 'google_Map/google_poly.dart';
import 'imag_pick_gallery_single/image_pick_ui.dart';
import 'octo_image/octo_image_ui.dart';
import 'otp_firebse/home_screen.dart';
import 'otp_firebse/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp());
}
// home: ValidationScreen(),

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeScreen(),
    );
  }

  TabBarViewModel _tabBarViewModel = Get.put(TabBarViewModel());
}
