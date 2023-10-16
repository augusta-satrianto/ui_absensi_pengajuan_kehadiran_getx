import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ui_absensi_pengajuan_kehadiran_getx/app/routes/app_pages.dart';

import '../../../../config/theme.dart';
import '../controllers/presensi_controller.dart';

class PresensiView extends GetView<PresensiController> {
  const PresensiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TextButton(
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    width: double.infinity,
                    height: 235,
                    padding: const EdgeInsets.only(
                        top: 16, right: 26, left: 26, bottom: 35),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(40),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF000000).withOpacity(0.10),
                          offset: const Offset(0, -1),
                          blurRadius: 15,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 4,
                          width: 85,
                          decoration: BoxDecoration(
                            color: neutral200,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(2.5)),
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        CustomListMenu(
                          icon: 'assets/images/ic_kehadiran.png',
                          title: 'Kehadiran',
                          onTap: () {
                            Get.offNamed(Routes.RIWAYAT_PRESENSI);
                          },
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        CustomListMenu(
                          icon: 'assets/images/ic_pengajuan_cuti.png',
                          title: 'Pengajuan Cuti',
                          onTap: () => Get.offNamed(Routes.PENGAJUAN_CUTI),
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        CustomListMenu(
                          icon: 'assets/images/ic_perubahan_shift.png',
                          title: 'Perubahan Shift',
                          onTap: () => Get.offNamed(Routes.PERUBAHAN_SHIFT),
                        ),
                      ],
                    ),
                  ),
                  barrierColor: Colors.transparent,
                );
              },
              child: Text('Open Bottom Sheet'))),
    );
  }
}

class CustomListMenu extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;
  const CustomListMenu(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        color: Colors.white,
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 26,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: plusJakartaSansTextStyle.copyWith(
                  color: neutral600, fontSize: 16),
            ),
            const Spacer(),
            Image.asset(
              'assets/images/ic_arrow_right.png',
              width: 24,
            ),
          ],
        ),
      ),
    );
  }
}
