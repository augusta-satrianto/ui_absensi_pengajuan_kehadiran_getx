import 'package:get/get.dart';

class BaseController extends GetxController {
  int currentIndex = 0;

  changeScreen(int selectedIndex) {
    currentIndex = selectedIndex;
    update();
  }
}
