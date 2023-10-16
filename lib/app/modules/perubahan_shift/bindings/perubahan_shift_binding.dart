import 'package:get/get.dart';

import '../controllers/perubahan_shift_controller.dart';

class PerubahanShiftBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PerubahanShiftController>(
      () => PerubahanShiftController(),
    );
  }
}
