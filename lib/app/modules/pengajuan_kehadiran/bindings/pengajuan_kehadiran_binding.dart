import 'package:get/get.dart';

import '../controllers/pengajuan_kehadiran_controller.dart';

class PengajuanKehadiranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengajuanKehadiranController>(
      () => PengajuanKehadiranController(),
    );
  }
}
