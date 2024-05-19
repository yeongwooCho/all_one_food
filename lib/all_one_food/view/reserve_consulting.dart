import 'package:all_one_food/all_one_food/component/radio_card.dart';
import 'package:all_one_food/common/component/custom_drop_down_single.dart';
import 'package:all_one_food/common/component/default_button.dart';
import 'package:all_one_food/common/component/main_calendar.dart';
import 'package:all_one_food/common/const/text_styles.dart';
import 'package:all_one_food/common/layout/default_app_bar.dart';
import 'package:all_one_food/common/layout/default_layout.dart';
import 'package:all_one_food/common/utils/data_utils.dart';
import 'package:all_one_food/common/view/completion_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
  bool? isOnlineConsulting = true;

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
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
              const SizedBox(height: 40.0),
              InkWell(
                onTap: () {
                  setState(() {
                    isOnlineConsulting = true;
                  });
                },
                child: RadioCard(
                  title: '온라인 상담',
                  description:
                      '온라인상담 진행 요청 시 진행방법에 대한 안내가 고객님께 문자로 발송됩니다. 확인해주세요!',
                  isSelected: isOnlineConsulting != null && isOnlineConsulting!
                      ? true
                      : false,
                ),
              ),
              const SizedBox(height: 8.0),
              InkWell(
                onTap: () {
                  setState(() {
                    isOnlineConsulting = false;
                  });
                },
                child: RadioCard(
                  title: '전화 상담',
                  description: '전화상담 진행 요청 시 상담 하루전 안내 문자가 발송됩니다. 확인해주세요!',
                  isSelected: isOnlineConsulting != null && !isOnlineConsulting!
                      ? true
                      : false,
                ),
              ),
              const SizedBox(height: 40.0),
              PrimaryButton(
                onPressed: () {
                  context.goNamed(
                    CompletionScreen.routeName,
                    pathParameters: {'title': '상담 요청이\n정상적으로\n완료 되었습니다.'},
                  );
                },
                child: const Text('상담 신청 완료'),
              ),
              const SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }
}
