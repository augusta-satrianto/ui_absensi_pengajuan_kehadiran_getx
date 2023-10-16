import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_absensi_pengajuan_kehadiran_getx/config/theme.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        timePickerTheme: TimePickerThemeData(
          hourMinuteTextColor: neutral600,
          hourMinuteShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          dialBackgroundColor: const Color(0xFFD9D9D9),
          helpTextStyle: plusJakartaSansTextStyle.copyWith(
              fontWeight: bold, color: neutral600),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle?>(
              plusJakartaSansTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
            foregroundColor:
                MaterialStateColor.resolveWith((states) => neutral600),
            overlayColor:
                MaterialStateColor.resolveWith((states) => Colors.transparent),
          ),
        ),
      ),
    ),
  );
}
