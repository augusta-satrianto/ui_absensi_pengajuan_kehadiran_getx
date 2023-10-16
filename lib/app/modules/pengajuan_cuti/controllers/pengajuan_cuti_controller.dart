import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PengajuanCutiController extends GetxController {
  TextEditingController fileController = TextEditingController();

  RxBool showFormAlasan = false.obs;
  RxBool showFormDelegasi = false.obs;
  final FocusNode textFocusAlasan = FocusNode();
  final FocusNode textFocusDelegasi = FocusNode();

  RxInt indexActive = 100.obs;
  RxString jenisCuti = ''.obs;
  RxString tanggalMulai = ''.obs;
  RxString tanggalSelesai = ''.obs;
  RxString textAlasan = ''.obs;
  RxString textDelegasi = ''.obs;
  RxString nameFile = ''.obs;

  void changeIndexActive(int index, String catCuti) {
    indexActive.value = index;
    jenisCuti.value = catCuti;
  }

  void changeShowFormAlasan() {
    showFormAlasan.value = true;
  }

  void changeShowFormDelegasi() {
    showFormDelegasi.value = true;
  }

  void changeNameFile(String name) {
    nameFile.value = name;
  }
}
