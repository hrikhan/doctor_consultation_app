import 'package:get/get.dart';

/// ------------------ CONTROLLER ------------------
class BottomNavController extends GetxController {
  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }
}
