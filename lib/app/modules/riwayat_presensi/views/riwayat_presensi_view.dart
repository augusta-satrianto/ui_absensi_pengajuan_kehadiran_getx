import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:ui_absensi_pengajuan_kehadiran_getx/app/modules/pengajuan_kehadiran/views/pengajuan_kehadiran_view.dart';
import 'package:ui_absensi_pengajuan_kehadiran_getx/config/theme.dart';

import '../../../components/buttons.dart';
import '../../../components/calendar_header.dart';
import '../../../components/material_design_indicator.dart';
import '../controllers/riwayat_presensi_controller.dart';

class RiwayatPresensiView extends GetView<RiwayatPresensiController> {
  const RiwayatPresensiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    late PageController _pageController;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Kehadiran'),
        titleTextStyle: plusJakartaSansTextStyle.copyWith(
            color: neutral600, fontSize: 20, fontWeight: semiBold),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: neutral600),
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
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 28.17),
            decoration: BoxDecoration(
                border: Border.all(color: neutral200),
                borderRadius: BorderRadius.circular(6.528)),
            child: Column(
              children: [
                ValueListenableBuilder<DateTime>(
                  valueListenable: ValueNotifier(DateTime.now()),
                  builder: (context, value, _) {
                    return CalendarHeader(
                      focusedDay: value,
                      onLeftArrowTap: () {
                        _pageController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      },
                      onRightArrowTap: () {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      },
                    );
                  },
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
                  // headerStyle: const HeaderStyle(
                  //   formatButtonVisible: false,
                  //   titleTextStyle:
                  //       TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                  // ),
                  calendarStyle: CalendarStyle(
                    isTodayHighlighted: false,
                    cellMargin: const EdgeInsets.all(3),
                    todayTextStyle: interTextStyle.copyWith(
                        color: const Color(0xFFFFFFFF),
                        fontWeight: medium,
                        fontSize: 13),
                    todayDecoration: const BoxDecoration(
                        color: Colors.amber, shape: BoxShape.circle),
                    weekendTextStyle: interTextStyle.copyWith(
                        color: const Color(0xFFE2313D),
                        fontWeight: medium,
                        fontSize: 13),
                    defaultTextStyle: interTextStyle.copyWith(
                        color: const Color(0xFF666666),
                        fontWeight: medium,
                        fontSize: 13),
                    tablePadding: const EdgeInsets.fromLTRB(39, 0, 39, 29),
                  ),
                  rowHeight: 40,
                  daysOfWeekHeight: 20,
                  onDaySelected: (selectedDay, focusedDay) {
                    Get.bottomSheet(
                      Container(
                        width: double.infinity,
                        height: 350,
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
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(2.5)),
                              ),
                            ),
                            const SizedBox(
                              height: 21,
                            ),
                            Container(
                              width: double.infinity,
                              height: 60,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 19, vertical: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: neutral200)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        DateFormat('dd MMMM yyyy')
                                            .format(selectedDay),
                                        style:
                                            plusJakartaSansTextStyle.copyWith(
                                                fontSize: 16,
                                                fontWeight: bold,
                                                color: neutral600),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        DateFormat('EEEE').format(selectedDay),
                                        style:
                                            plusJakartaSansTextStyle.copyWith(
                                                fontSize: 12,
                                                color: neutral600),
                                      )
                                    ],
                                  ),
                                  Image.asset(
                                    'assets/images/ic_calendar.png',
                                    width: 34,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 140,
                              width: double.infinity,
                              child: DefaultTabController(
                                length: 2,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TabBar(
                                        labelPadding: EdgeInsets.zero,
                                        indicatorPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 50),
                                        indicator: MaterialDesignIndicator(
                                            indicatorHeight: 4,
                                            indicatorColor: warning600),
                                        labelColor: neutral600,
                                        labelStyle:
                                            plusJakartaSansTextStyle.copyWith(
                                                fontWeight: bold, fontSize: 12),
                                        unselectedLabelColor: neutral200,
                                        unselectedLabelStyle:
                                            plusJakartaSansTextStyle.copyWith(
                                                fontSize: 12),
                                        tabs: const [
                                          Tab(
                                            text: 'Check in',
                                          ),
                                          Tab(
                                            text: 'Check out',
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 22,
                                      ),
                                      Expanded(
                                        child: TabBarView(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  'Waktu clock in',
                                                  style:
                                                      plusJakartaSansTextStyle
                                                          .copyWith(
                                                              fontSize: 12,
                                                              fontWeight: bold,
                                                              color:
                                                                  neutral600),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text('Tidak ada data',
                                                    style:
                                                        plusJakartaSansTextStyle
                                                            .copyWith(
                                                                fontSize: 11,
                                                                color:
                                                                    danger600)),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                    'Shift Pagi (07.00 - 12.00)',
                                                    style:
                                                        plusJakartaSansTextStyle
                                                            .copyWith(
                                                                fontSize: 11,
                                                                color:
                                                                    neutral600))
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  'Waktu clock out',
                                                  style:
                                                      plusJakartaSansTextStyle
                                                          .copyWith(
                                                              fontSize: 12,
                                                              fontWeight: bold,
                                                              color:
                                                                  neutral600),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text('Tidak ada data',
                                                    style:
                                                        plusJakartaSansTextStyle
                                                            .copyWith(
                                                                fontSize: 11,
                                                                color:
                                                                    danger600)),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                    'Shift Pagi (07.00 - 12.00)',
                                                    style:
                                                        plusJakartaSansTextStyle
                                                            .copyWith(
                                                                fontSize: 11,
                                                                color:
                                                                    neutral600))
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ]),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            CustomFilledButton(
                                title: 'Ajukan Kehadiran',
                                onPressed: () {
                                  Get.back();
                                  Get.to(PengajuanKehadiranView(
                                    dateTime: selectedDay,
                                  ));
                                })
                          ],
                        ),
                      ),
                      barrierColor: Colors.transparent,
                    );
                  },
                  calendarBuilders: CalendarBuilders(
                    markerBuilder: (context, day, events) {
                      if (DateFormat('dd MMMM yyyy').format(day) ==
                              '04 September 2023' ||
                          DateFormat('dd MMMM yyyy').format(day) ==
                              '05 September 2023') {
                        return Center(
                          child: Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                                color: danger600, shape: BoxShape.circle),
                            child: Center(
                              child: Text(
                                DateFormat('d').format(day),
                                style: interTextStyle.copyWith(
                                    color: const Color(0xFFFFFFFF),
                                    fontWeight: medium,
                                    fontSize: 13),
                              ),
                            ),
                          ),
                        );
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
