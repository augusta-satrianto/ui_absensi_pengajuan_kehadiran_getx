import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ui_absensi_pengajuan_kehadiran_getx/config/theme.dart';

import '../../presensi/views/presensi_view.dart';
import '../controllers/base_controller.dart';

class BaseView extends GetView<BaseController> {
  const BaseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BaseController>(
      builder: (_) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          bottom: false,
          child: IndexedStack(
            index: controller.currentIndex,
            children: const [
              Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Beranda Page',
                      ),
                    ],
                  ),
                ),
              ),
              PresensiView(),
              Scaffold(
                body: Center(
                  child: Text('Tugas Page'),
                ),
              ),
              Scaffold(
                body: Center(
                  child: Text('Notifikasi Page'),
                ),
              ),
              Scaffold(
                body: Center(
                  child: Text('Akun Page'),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex,
          type: BottomNavigationBarType.fixed,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          selectedItemColor: primaryMain,
          unselectedItemColor: neutral300,
          selectedLabelStyle:
              interTextStyle.copyWith(fontWeight: medium, fontSize: 10),
          unselectedLabelStyle:
              interTextStyle.copyWith(fontWeight: medium, fontSize: 10),
          items: [
            _mBottomNavItem(
              label: 'Beranda',
              icon: 'assets/images/ic_home.png',
            ),
            _mBottomNavItem(
              label: 'Presensi',
              icon: 'assets/images/ic_presensi.png',
            ),
            _mBottomNavItem(
              label: 'Tugas',
              icon: 'assets/images/ic_task.png',
            ),
            _mBottomNavItem(
              label: 'Notifikasi',
              icon: 'assets/images/ic_notification.png',
            ),
            _mBottomNavItem(
              label: 'Akun',
              icon: 'assets/images/ic_account.png',
            ),
          ],
          onTap: controller.changeScreen,
        ),
      ),
    );
  }

  _mBottomNavItem({required String label, required String icon}) {
    return BottomNavigationBarItem(
      label: label,
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Image.asset(
          icon,
          color: neutral300,
          width: 24,
        ),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Image.asset(
          icon,
          color: primaryMain,
          width: 24,
        ),
      ),
    );
  }
}
