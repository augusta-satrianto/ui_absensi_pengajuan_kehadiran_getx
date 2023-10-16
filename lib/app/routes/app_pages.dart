import 'package:get/get.dart';

import '../modules/base/bindings/base_binding.dart';
import '../modules/base/views/base_view.dart';
import '../modules/pengajuan_cuti/bindings/pengajuan_cuti_binding.dart';
import '../modules/pengajuan_cuti/views/pengajuan_cuti_view.dart';
import '../modules/perubahan_shift/bindings/perubahan_shift_binding.dart';
import '../modules/perubahan_shift/views/perubahan_shift_view.dart';
import '../modules/presensi/bindings/presensi_binding.dart';
import '../modules/presensi/views/presensi_view.dart';
import '../modules/riwayat_presensi/bindings/riwayat_presensi_binding.dart';
import '../modules/riwayat_presensi/views/riwayat_presensi_view.dart';

// import '../modules/pengajuan_kehadiran/bindings/pengajuan_kehadiran_binding.dart';
// import '../modules/pengajuan_kehadiran/views/pengajuan_kehadiran_view.dart';

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
    GetPage(
      name: _Paths.PRESENSI,
      page: () => const PresensiView(),
      binding: PresensiBinding(),
    ),
    GetPage(
      name: _Paths.PENGAJUAN_CUTI,
      page: () => const PengajuanCutiView(),
      binding: PengajuanCutiBinding(),
    ),
    GetPage(
      name: _Paths.PERUBAHAN_SHIFT,
      page: () => const PerubahanShiftView(),
      binding: PerubahanShiftBinding(),
    ),
  ];
}
