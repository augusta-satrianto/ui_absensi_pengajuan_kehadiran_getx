import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PerubahanShiftController extends GetxController {
  RxString tanggal = ''.obs;
  RxString shiftLama = ''.obs;
  RxString shiftBaru = ''.obs;
  RxString textAlasan = ''.obs;
  RxBool showFormAlasan = false.obs;
  final FocusNode textFocusAlasan = FocusNode();

  void changeShowFormAlasan() {
    showFormAlasan.value = true;
  }
}
