import 'package:get/get.dart';

class ValidationController extends GetxController {
  RxBool forgotPasswordFlag = false.obs;
  RxInt forgotPasswordPageIndex = 0.obs;
  RxBool progressVisible = false.obs;
  RxBool termCondition = false.obs;
  RxBool isLoading = false.obs;
  RxBool obscureText = true.obs;
  void updateWidget() {
    update();
  }

  void chnageTC() {
    print("Controllar call");
    termCondition = termCondition.toggle();
    update();
  }

  void toggleText() {
    obscureText = obscureText.toggle();
    update();
  }
}
