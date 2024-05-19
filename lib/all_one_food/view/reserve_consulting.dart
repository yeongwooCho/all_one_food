import 'package:all_one_food/common/component/custom_drop_down_single.dart';
import 'package:all_one_food/common/component/main_calendar.dart';
import 'package:all_one_food/common/const/text_styles.dart';
import 'package:all_one_food/common/layout/default_app_bar.dart';
import 'package:all_one_food/common/layout/default_layout.dart';
import 'package:all_one_food/common/utils/data_utils.dart';
import 'package:flutter/material.dart';

class ReserveConsultingScreen extends StatefulWidget {
  static String get routeName => 'reserve_consulting';

  const ReserveConsultingScreen({super.key});

  @override
  State<ReserveConsultingScreen> createState() =>
      _ReserveConsultingScreenState();
}

class _ReserveConsultingScreenState extends State<ReserveConsultingScreen> {
  DateTime selectedDate = DateTime.now();
  String selectedTime = '';

  final List<String> dates = List.generate(
    19,
    (index) => DataUtils.convertDateTimeToTimeString(
      datetime: DateTime(2024, 1, 1, 10, 00).add(
        Duration(minutes: 30 * index),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: '상담 예약'),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              '날짜와 시간을 선택해 주세요.',
              style: MyTextStyle.bodyTitleMedium,
            ),
            const SizedBox(height: 8.0),
            MainCalendar(
              selectedDate: selectedDate,
              onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                setState(() {
                  selectedDate = selectedDay;
                });
              },
            ),
            const SizedBox(height: 8.0),
            CustomSingleDropDown(
              hintText: '시간 선택',
              onChanged: (String value) {
                selectedTime = value;
              },
              dropdownList: dates,
              dropdownHeight: 220,
            ),
          ],
        ),
      ),
    );
  }
}
