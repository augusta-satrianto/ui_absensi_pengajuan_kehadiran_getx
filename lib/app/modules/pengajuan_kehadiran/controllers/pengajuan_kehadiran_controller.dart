import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PengajuanKehadiranController extends GetxController {
  RxString clockin = ''.obs;
  RxString clockout = ''.obs;
  RxString nameDokumen = ''.obs;
  RxString textDeskripsi = ''.obs;

  final dokumenController = TextEditingController();

  RxBool showFormDes = false.obs;
  final FocusNode textFocus = FocusNode();

  void changeShowFormDes() {
    showFormDes.value = true;
  }

  void changeNameDokumen(String name) {
    nameDokumen.value = name;
    print(nameDokumen);
  }
}
