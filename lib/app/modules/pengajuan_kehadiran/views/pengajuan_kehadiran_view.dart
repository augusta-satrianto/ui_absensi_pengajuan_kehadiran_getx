import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ui_absensi_pengajuan_kehadiran_getx/config/theme.dart';

import '../../../components/buttons.dart';
import '../../../components/form.dart';
import '../../../components/switch_button.dart';
import '../controllers/pengajuan_kehadiran_controller.dart';

class PengajuanKehadiranView extends GetView<PengajuanKehadiranController> {
  final DateTime dateTime;
  const PengajuanKehadiranView({Key? key, required this.dateTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pengajuanController = Get.put(PengajuanKehadiranController());
    bool showFab = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengajuan Kehadiran'),
        titleTextStyle: GoogleFonts.plusJakartaSans(
            color: neutral600, fontSize: 20, fontWeight: semiBold),
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 16,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        iconTheme: const IconThemeData(color: Color(0xFF45484F)),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      floatingActionButton: Visibility(
        visible: !showFab,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 50),
          child: CustomFilledButton(
            onPressed: () {
              Get.dialog(Center(
                child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          height: 360,
                          width: MediaQuery.of(context).size.width - 52,
                          decoration: BoxDecoration(
                color: neutral100,
                borderRadius: BorderRadius.circular(4)
                          ),
                          child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        child: Image.asset(
                          'assets/ic_close.png',
                          width: 25,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 42,
                        ),
                        Image.asset(
                          'assets/img_grafis1.png',
                          width: 140,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Pengajuan kehadiran Clock out pada',
                                  style: GoogleFonts.plusJakartaSans(
                                      fontSize: 12, color: neutral600),
                                ),
                                TextSpan(
                                  text: ' 05 Oktober 2023 ',
                                  style: GoogleFonts.plusJakartaSans(
                                      fontSize: 12,
                                      color: neutral600,
                                      fontWeight: bold),
                                ),
                                TextSpan(
                                  text: 'telah terkirim',
                                  style: GoogleFonts.plusJakartaSans(
                                      fontSize: 12, color: neutral600),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomFilledButton(
                          title: 'Kembali',
                          onPressed: () {
                            Get.back();
                          },
                          height: 45,
                        )
                      ],
                    ),
                  )
                ],
                          ),
                        ),
              ),
       );
            },
            title: 'Kirim',
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 19,
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  DateFormat('dd MMMM yyyy').format(dateTime),
                  style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: neutral600),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text('Pagi (07.00 - 12.00)',
                    style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 11,
                        color: const Color(0xFF83858A))),
              ],
            ),
          ),
          const SizedBox(
            height: 5.5,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: const Color(0xFFC1C2C4).withOpacity(0.20), width: 1),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/ic_calendar_colored.png',
                      width: 24,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('Clock in',
                        style: GoogleFonts.plusJakartaSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 11,
                            color: neutral600)),
                    const Spacer(),
                    const SizedBox(
                      width: 10,
                    ),
                    StyledSwitch(
                      clockValue: ((clockValue) {
                        pengajuanController.clockin.value = clockValue;
                      }),
                    ),
                  ],
                ),
                Obx(() {
                  return pengajuanController.clockin.value != ''
                      ? Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 34,
                                ),
                                Text(
                                  'Pada ${pengajuanController.clockin.value}',
                                  style: GoogleFonts.plusJakartaSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF45484F)),
                                ),
                              ],
                            ),
                          ],
                        )
                      : Container();
                }),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              border: Border.symmetric(
                  horizontal: BorderSide(
                      color: const Color(0xFFC1C2C4).withOpacity(0.20),
                      width: 1)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/ic_calendar_colored.png',
                      width: 24,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('Clock out',
                        style: GoogleFonts.plusJakartaSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 11,
                            color: neutral600)),
                    const Spacer(),
                    const SizedBox(
                      width: 10,
                    ),
                    StyledSwitch(
                      clockValue: ((clockValue) {
                        pengajuanController.clockout.value = clockValue;
                      }),
                    ),
                  ],
                ),
                Obx(() {
                  return pengajuanController.clockout.value != ''
                      ? Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 34,
                                ),
                                Text(
                                  'Pada ${pengajuanController.clockout.value}',
                                  style: GoogleFonts.plusJakartaSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF45484F)),
                                ),
                              ],
                            ),
                          ],
                        )
                      : Container();
                }),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          CustomUploadImagePath(
              title: 'Image Path',
              controllerImage: pengajuanController.dokumenController),
          const SizedBox(
            height: 16,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              border: Border.symmetric(
                  horizontal: BorderSide(
                      color: const Color(0xFFC1C2C4).withOpacity(0.20),
                      width: 1)),
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    controller.changeShowFormDes();
                    pengajuanController.textFocus.requestFocus();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/ic_plus_colored.png',
                        width: 24,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('Deskripsi',
                          style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                              color: neutral600)),
                    ],
                  ),
                ),
                Obx(
                  () {
                    return controller.showFormDes.value
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 34),
                            child: TextFormField(
                              focusNode: pengajuanController.textFocus,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: '',
                              ),
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 12,
                                  color: neutral700,
                                  fontWeight: bold),
                            ),
                          )
                        : Container();
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 200,
          )
        ],
      ),
    );
  }
}
