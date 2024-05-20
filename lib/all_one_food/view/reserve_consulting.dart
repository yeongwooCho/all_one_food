import 'package:all_one_food/all_one_food/component/radio_card.dart';
import 'package:all_one_food/all_one_food/provider/all_one_food_provider.dart';
import 'package:all_one_food/common/component/custom_drop_down_single.dart';
import 'package:all_one_food/common/component/default_button.dart';
import 'package:all_one_food/common/component/main_calendar.dart';
import 'package:all_one_food/common/const/text_styles.dart';
import 'package:all_one_food/common/layout/default_app_bar.dart';
import 'package:all_one_food/common/layout/default_layout.dart';
import 'package:all_one_food/common/utils/data_utils.dart';
import 'package:all_one_food/common/view/completion_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ReserveConsultingScreen extends ConsumerStatefulWidget {
  static String get routeName => 'reserve_consulting';

  const ReserveConsultingScreen({super.key});

  @override
  ConsumerState<ReserveConsultingScreen> createState() =>
      _ReserveConsultingScreenState();
}

class _ReserveConsultingScreenState
    extends ConsumerState<ReserveConsultingScreen> {
  DateTime selectedDate = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0, 1);
  bool isConsultingAt = false;
  List<int> time = [0, 0];
  bool? isOnlineConsulting;

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
    final allOneFood = ref.watch(allOneFoodProvider);

    String consultingType = isOnlineConsulting == null
        ? ''
        : isOnlineConsulting!
            ? '온라인 상담'
            : '전화상담';

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
                    selectedDate =
                        selectedDay.copyWith(hour: time[0], minute: time[1]);
                  });
                },
              ),
              const SizedBox(height: 8.0),
              CustomSingleDropDown(
                hintText: '시간 선택',
                onChanged: (String value) {
                  time = value.split(':').map((e) => int.parse(e)).toList();
                  // final time = timeValue.split(':').map((e) => int.parse(e)).toList();
                  setState(() {
                    selectedDate =
                        selectedDate.copyWith(hour: time[0], minute: time[1]);
                    isConsultingAt = true;
                  });
                },
                dropdownList: dates,
                dropdownHeight: 220,
              ),
              const SizedBox(height: 40.0),
              if (isConsultingAt)
                Column(
                  children: [
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
                        isSelected:
                            isOnlineConsulting != null && isOnlineConsulting!
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
                        description:
                            '전화상담 진행 요청 시 상담 하루전 안내 문자가 발송됩니다. 확인해주세요!',
                        isSelected:
                            isOnlineConsulting != null && !isOnlineConsulting!
                                ? true
                                : false,
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 40.0),
              if (isConsultingAt)
                PrimaryButton(
                  onPressed: () {
                    ref.read(allOneFoodProvider.notifier).state =
                        allOneFood.copyWith(
                      consultingType: consultingType,
                      consultingAt: DateTime(
                        selectedDate.year,
                        selectedDate.month,
                        selectedDate.day,
                        selectedDate.hour,
                        selectedDate.minute,
                      ),
                    );

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
