import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';

class TabBarViewModel extends GetxController {
  RxString _selectedRoute = 'FirstScreenTab'.obs;

  RxString get selectedRoute => _selectedRoute;

  void setSlectedRoute(String value) {
    _selectedRoute = value.obs;
    update();
  }

  RxString _previousRoute = ''.obs;

  RxString get previousRoute => _previousRoute;

  void SetPreviousRoute(String value) {
    _previousRoute = value.obs;
  }

  RxInt _selectedBottomIndex = 0.obs;

  RxInt get selectedBottomIndex => _selectedBottomIndex;

  void setSelectedBottomIndex(int value) {
    _selectedBottomIndex = value.obs;
  }
}
