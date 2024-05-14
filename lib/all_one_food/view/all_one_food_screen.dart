import 'package:all_one_food/all_one_food/component/radio_card.dart';
import 'package:all_one_food/all_one_food/view/request_consulting_screen.dart';
import 'package:all_one_food/common/component/default_button.dart';
import 'package:all_one_food/common/layout/default_app_bar.dart';
import 'package:all_one_food/common/layout/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const consultingData = {
  '종합 컨설팅': '제품 아이디어는 있는데 어떻게 시작할지 모르겠어요.',
  '상품기획 컨설팅': '제품 아이디어에 대한 상세 컨설팅만 필요해요!',
  '제조라인 컨설팅': '제품을 생산하는 컨설팅을 받고 싶어요',
  '유통라인 컨설팅_국내': '국내 유통망을 확보하고 싶어요!',
  '유통라인 컨설팅_해외': '해외 유통망을 확보하고 싶어요!',
};

class AllOneFoodScreen extends StatefulWidget {
  static String get routeName => "all_one_food";

  const AllOneFoodScreen({super.key});

  @override
  State<AllOneFoodScreen> createState() => _AllOneFoodScreenState();
}

class _AllOneFoodScreenState extends State<AllOneFoodScreen> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: 'All One Food'),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          if (index == consultingData.length) {
            return Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: PrimaryButton(
                onPressed: () {
                  context.pushNamed(RequestConsultingScreen.routeName);
                },
                child: const Text('컨설팅 진행하기'),
              ),
            );
          }
          final title = consultingData.keys.toList()[index];
          final description = consultingData.values.toList()[index];

          return InkWell(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: RadioCard(
              title: title,
              description: description,
              isSelected: selectedIndex == index,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 8.0);
        },
        itemCount: consultingData.length + 1,
      ),
    );
  }
}
