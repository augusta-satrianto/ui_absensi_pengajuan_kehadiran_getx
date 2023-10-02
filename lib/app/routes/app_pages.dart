import 'package:get/get.dart';

import '../modules/base/bindings/base_binding.dart';
import '../modules/base/views/base_view.dart';
// import '../modules/pengajuan_kehadiran/bindings/pengajuan_kehadiran_binding.dart';
// import '../modules/pengajuan_kehadiran/views/pengajuan_kehadiran_view.dart';
import '../modules/riwayat_presensi/bindings/riwayat_presensi_binding.dart';
import '../modules/riwayat_presensi/views/riwayat_presensi_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.BASE;

  static final routes = [
    GetPage(
      name: _Paths.RIWAYAT_PRESENSI,
      page: () => const RiwayatPresensiView(),
      binding: RiwayatPresensiBinding(),
    ),
    // GetPage(
    //   name: _Paths.PENGAJUAN_KEHADIRAN,
    //   page: () => const PengajuanKehadiranView(),
    //   binding: PengajuanKehadiranBinding(),
    // ),
    GetPage(
      name: _Paths.BASE,
      page: () => const BaseView(),
      binding: BaseBinding(),
    ),
  ];
}
