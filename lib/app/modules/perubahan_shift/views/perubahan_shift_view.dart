import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../config/theme.dart';
import '../../../components/buttons.dart';
import '../../../components/calendar_header.dart';
import '../controllers/perubahan_shift_controller.dart';

class PerubahanShiftView extends GetView<PerubahanShiftController> {
  const PerubahanShiftView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    late PageController _pageController;
    bool showFab = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perubahan Shift'),
        titleTextStyle: plusJakartaSansTextStyle.copyWith(
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
          child: Obx(() {
            return CustomFilledButton(
              onPressed: () {
                Get.dialog(
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      height: 360,
                      width: MediaQuery.of(context).size.width - 52,
                      decoration: BoxDecoration(
                          color: neutral100,
                          borderRadius: BorderRadius.circular(4)),
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
                                  'assets/images/ic_close.png',
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
                                  'assets/images/img_grafis1.png',
                                  width: 140,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Pengajuan cuti telah terkirim',
                                          style:
                                              plusJakartaSansTextStyle.copyWith(
                                                  fontSize: 12,
                                                  color: neutral600),
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
              isActive: controller.tanggal.value != '' &&
                      controller.shiftLama.value != '' &&
                      controller.shiftBaru.value != '' &&
                      controller.textAlasan.value != ''
                  ? true
                  : false,
            );
          }),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 19,
          ),
          // Tanggal
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Get.dialog(
                    Scaffold(
                      backgroundColor: Colors.transparent,
                      body: Column(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                color: Colors.transparent,
                                height: (MediaQuery.of(context).size.height -
                                        MediaQuery.of(context).padding.top -
                                        400) /
                                    2,
                              )),
                          Center(
                              child: Container(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            width: 308,
                            decoration: BoxDecoration(
                                color: neutral100,
                                borderRadius: BorderRadius.circular(4)),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 6),
                                  child: ValueListenableBuilder<DateTime>(
                                    valueListenable:
                                        ValueNotifier(DateTime.now()),
                                    builder: (context, value, _) {
                                      return CalendarHeader(
                                        focusedDay: value,
                                        onLeftArrowTap: () {
                                          _pageController.previousPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.easeOut,
                                          );
                                        },
                                        onRightArrowTap: () {
                                          _pageController.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.easeOut,
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 40),
                                  child: Divider(
                                    height: 5,
                                    color: Color(0xFFC1C2C4),
                                  ),
                                ),
                                TableCalendar(
                                  onCalendarCreated: (controller) =>
                                      _pageController = controller,
                                  weekendDays: const [6, 7],
                                  daysOfWeekStyle: DaysOfWeekStyle(
                                      weekdayStyle: interTextStyle.copyWith(
                                          fontSize: 13,
                                          fontWeight: medium,
                                          color: const Color(0xFF333333)),
                                      weekendStyle: interTextStyle.copyWith(
                                          fontSize: 13,
                                          fontWeight: medium,
                                          color: const Color(0xFF333333))),
                                  firstDay: DateTime.utc(2010, 10, 16),
                                  lastDay: DateTime.utc(2030, 3, 14),
                                  focusedDay: DateTime.now(),
                                  startingDayOfWeek: StartingDayOfWeek.monday,
                                  headerVisible: false,
                                  calendarStyle: CalendarStyle(
                                    isTodayHighlighted: false,
                                    outsideDaysVisible: false,
                                    cellMargin: const EdgeInsets.all(3),
                                    todayTextStyle: interTextStyle.copyWith(
                                        color: const Color(0xFFFFFFFF),
                                        fontWeight: medium,
                                        fontSize: 13),
                                    todayDecoration: const BoxDecoration(
                                        color: Colors.amber,
                                        shape: BoxShape.circle),
                                    weekendTextStyle: interTextStyle.copyWith(
                                        color: const Color(0xFF666666),
                                        fontWeight: medium,
                                        fontSize: 13),
                                    defaultTextStyle: interTextStyle.copyWith(
                                        color: const Color(0xFF666666),
                                        fontWeight: medium,
                                        fontSize: 13),
                                    tablePadding: const EdgeInsets.fromLTRB(
                                        39, 0, 39, 29),
                                  ),
                                  rowHeight: 40,
                                  daysOfWeekHeight: 20,
                                  onDaySelected: (selectedDay, focusedDay) {
                                    controller.tanggal.value =
                                        DateFormat('E, dd/MM/yyyy')
                                            .format(selectedDay);
                                    Get.back();
                                  },
                                ),
                              ],
                            ),
                          )),
                          GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                color: Colors.transparent,
                                height: (MediaQuery.of(context).size.height -
                                        MediaQuery.of(context).padding.top -
                                        400) /
                                    2,
                              )),
                        ],
                      ),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                        horizontal: BorderSide(
                            color: const Color(0xFFC1C2C4).withOpacity(0.20),
                            width: 1)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/ic_calendar_colored.png',
                            width: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text('Pilih Tanggal',
                              style: plusJakartaSansTextStyle.copyWith(
                                  fontSize: 11, color: neutral600)),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          Obx(() {
                            return controller.tanggal.value != ''
                                ? Text(
                                    controller.tanggal.value,
                                    style: plusJakartaSansTextStyle.copyWith(
                                        fontSize: 12,
                                        fontWeight: bold,
                                        color: neutral600),
                                  )
                                : const SizedBox();
                          }),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          // Shift Lama
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  controller.shiftLama.value = 'Pagi (07.00 - 12.00)';
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                        horizontal: BorderSide(
                            color: const Color(0xFFC1C2C4).withOpacity(0.20),
                            width: 1)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/ic_big_arrow_up.png',
                            width: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text('Pilih Shift',
                              style: plusJakartaSansTextStyle.copyWith(
                                  fontSize: 11, color: neutral600)),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          Obx(() {
                            return controller.shiftLama.value != ''
                                ? Text(
                                    controller.shiftLama.value,
                                    style: plusJakartaSansTextStyle.copyWith(
                                        fontSize: 12,
                                        fontWeight: bold,
                                        color: neutral600),
                                  )
                                : const SizedBox();
                          }),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          // Shift Baru
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  controller.shiftBaru.value = 'Siang (13.00 - 19.00)';
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                        horizontal: BorderSide(
                            color: const Color(0xFFC1C2C4).withOpacity(0.20),
                            width: 1)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/ic_big_arrow_down.png',
                            width: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text('Pilih Shift',
                              style: plusJakartaSansTextStyle.copyWith(
                                  fontSize: 11, color: neutral600)),
                          const Spacer(),
                          Image.asset(
                            'assets/images/ic_arrow_down.png',
                            width: 16,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          Obx(() {
                            return controller.shiftBaru.value != ''
                                ? Text(
                                    controller.shiftBaru.value,
                                    style: plusJakartaSansTextStyle.copyWith(
                                        fontSize: 12,
                                        fontWeight: bold,
                                        color: neutral600),
                                  )
                                : const SizedBox();
                          }),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          // Alasan
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
                    controller.changeShowFormAlasan();
                    controller.textFocusAlasan.requestFocus();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/ic_document_colored.png',
                        width: 24,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('Alasan',
                          style: plusJakartaSansTextStyle.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                              color: neutral600)),
                    ],
                  ),
                ),
                Obx(
                  () {
                    return controller.showFormAlasan.value
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 34),
                            child: TextFormField(
                              onChanged: (value) {
                                controller.textAlasan.value = value;
                              },
                              focusNode: controller.textFocusAlasan,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Masukkan Alasan',
                                hintStyle: plusJakartaSansTextStyle.copyWith(
                                    color: neutral200),
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 0),
                              ),
                              maxLines: 2,
                              style: plusJakartaSansTextStyle.copyWith(
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
            height: 16,
          ),
        ],
      ),
    );
  }
}
