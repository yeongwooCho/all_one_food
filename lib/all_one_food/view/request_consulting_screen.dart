import 'package:all_one_food/all_one_food/provider/all_one_food_provider.dart';
import 'package:all_one_food/all_one_food/view/completion_consulting_screen.dart';
import 'package:all_one_food/common/component/custom_drop_down_multi.dart';
import 'package:all_one_food/common/component/custom_drop_down_single.dart';
import 'package:all_one_food/common/component/custom_ink_well_button.dart';
import 'package:all_one_food/common/component/custom_text_form_field.dart';
import 'package:all_one_food/common/component/default_button.dart';
import 'package:all_one_food/common/const/colors.dart';
import 'package:all_one_food/common/const/text_styles.dart';
import 'package:all_one_food/common/layout/default_app_bar.dart';
import 'package:all_one_food/common/layout/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RequestConsultingScreen extends ConsumerStatefulWidget {
  static String get routeName => 'request_consulting';

  const RequestConsultingScreen({super.key});

  @override
  ConsumerState<RequestConsultingScreen> createState() =>
      _RequestConsultingScreenState();
}

class _RequestConsultingScreenState
    extends ConsumerState<RequestConsultingScreen> {
  bool isAnswerProduct1 = false;
  String productInfo = '';

  bool isAnswerProduct2 = false;
  String productType = '';

  bool isAnswerProduct3 = false;
  List<String> taste = [];

  bool isAnswerMainSentence = false;
  String mainSentence = '';

  bool isAnswerQuestion1 = false;
  List<String> questionsList1 = ['1) 선택지 내용', '2) 선택지 내용', '3) 선택지 내용'];
  String question1 = '';

  bool isAnswerQuestion2 = false;
  List<String> questionsList2 = ['1) 선택지 내용', '2) 선택지 내용', '3) 선택지 내용'];
  String question2 = '';

  bool isAnswerQuestion3 = false;
  List<String> questionsList3 = ['1) 선택지 내용', '2) 선택지 내용', '3) 선택지 내용'];
  String question3 = '';

  bool isAnswerQuestion4 = false;
  List<String> questionsList4 = ['1) 선택지 내용', '2) 선택지 내용', '3) 선택지 내용'];
  String question4 = '';

  bool isAnswerQuestion5 = false;
  List<String> questionsList5 = ['1) 선택지 내용', '2) 선택지 내용', '3) 선택지 내용'];
  String question5 = '';

  bool isAnswerHealth = false;
  bool? isHealth;

  bool isAnswerPrice = false;
  String wishedPrice = '';

  @override
  Widget build(BuildContext context) {
    final allOneFood = ref.watch(allOneFoodProvider);

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '컨설팅 요청'),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AnimatedContainer(
                height: isAnswerHealth ? 200 : 0.0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.fastOutSlowIn,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          '희망 생산원가(예상치)',
                          style: MyTextStyle.bodyTitleRegular,
                        ),
                        const SizedBox(height: 8.0),
                        CustomTextFormField(
                          textAlign: TextAlign.end,
                          suffixText: '원',
                          onChanged: (String value) {
                            wishedPrice = value;
                          },
                          onSaved: (String? newValue) {},
                          validator: (String? value) {
                            return null;
                          },
                          textInputType: TextInputType.number,
                        ),
                        const SizedBox(height: 8.0),
                        PrimaryButton(
                          onPressed: () {
                            ref.read(allOneFoodProvider.notifier).state =
                                allOneFood.copyWith(
                              id: 1,
                              productInfo: productInfo,
                              productType: productType,
                              taste: taste,
                              mainSentence: mainSentence,
                              wishedPrice: int.parse(wishedPrice),
                            );

                            context
                                .goNamed(CompletionConsultingScreen.routeName);
                          },
                          child: const Text('컵셉 결과 확인하기'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              AnimatedContainer(
                height: isAnswerQuestion5 ? 140 : 0.0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.fastOutSlowIn,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          '건강 기능에 대한 어필을 추가할까요?',
                          style: MyTextStyle.bodyTitleRegular,
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            Expanded(
                              child: CustomInkWellButton(
                                onTap: () {
                                  setState(() {
                                    isHealth = true;
                                    isAnswerHealth = true;
                                  });
                                },
                                title: '네',
                                isSelected:
                                    (isHealth != null && isHealth == true),
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: CustomInkWellButton(
                                onTap: () {
                                  setState(() {
                                    isHealth = false;
                                    isAnswerHealth = true;
                                  });
                                },
                                title: '아니요',
                                isSelected:
                                    (isHealth != null && isHealth == false),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              QuestionContainer(
                title: '컨셉 방향에 대한 상세화 - 5',
                isAnswer: isAnswerQuestion4,
                questionList: questionsList5,
                onTap: (String e) {
                  setState(() {
                    question5 = e;
                    isAnswerQuestion5 = true;
                  });
                },
                question: question5,
              ),
              QuestionContainer(
                title: '컨셉 방향에 대한 상세화 - 4',
                isAnswer: isAnswerQuestion3,
                questionList: questionsList1,
                onTap: (String e) {
                  setState(() {
                    question4 = e;
                    isAnswerQuestion4 = true;
                  });
                },
                question: question4,
              ),
              QuestionContainer(
                title: '컨셉 방향에 대한 상세화 - 3',
                isAnswer: isAnswerQuestion2,
                questionList: questionsList3,
                onTap: (String e) {
                  setState(() {
                    question3 = e;
                    isAnswerQuestion3 = true;
                  });
                },
                question: question3,
              ),
              QuestionContainer(
                title: '컨셉 방향에 대한 상세화 - 2',
                isAnswer: isAnswerQuestion1,
                questionList: questionsList2,
                onTap: (String e) {
                  setState(() {
                    question2 = e;
                    isAnswerQuestion2 = true;
                  });
                },
                question: question2,
              ),
              QuestionContainer(
                title: '컨셉 방향에 대한 상세화 - 1',
                isAnswer: isAnswerMainSentence,
                questionList: questionsList1,
                onTap: (String e) {
                  setState(() {
                    question1 = e;
                    isAnswerQuestion1 = true;
                  });
                },
                question: question1,
              ),
              AnimatedContainer(
                height: isAnswerProduct1 && isAnswerProduct2 && isAnswerProduct3
                    ? 230
                    : 0.0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.fastOutSlowIn,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          '한 줄 소개',
                          style: MyTextStyle.bodyTitleRegular,
                        ),
                        Text(
                          '컨셉 도출 및 기획의 방향에 대해 설정합니다.',
                          style: MyTextStyle.minimumRegular.copyWith(
                            color: MyColor.darkGrey,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        CustomTextFormField(
                          onChanged: (String value) {
                            setState(() {
                              mainSentence = value;
                            });
                          },
                          onSaved: (String? newValue) {},
                          validator: (String? value) {
                            return null;
                          },
                        ),
                        const SizedBox(height: 8.0),
                        SecondaryButton(
                          onPressed: mainSentence.isNotEmpty
                              ? () {
                                  setState(() {
                                    isAnswerMainSentence = true;
                                    FocusScope.of(context).unfocus();
                                  });
                                }
                              : null,
                          child: const Text('확인'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    '제품 정보',
                    style: MyTextStyle.bodyTitleRegular,
                  ),
                  Text(
                    '현재 스낵류 이외 카테고리는 준비중 입니다.',
                    style: MyTextStyle.minimumRegular.copyWith(
                      color: MyColor.darkGrey,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  CustomSingleDropDown(
                    dropdownList: [
                      '스낵류',
                      '베이커리',
                      '밀키트',
                      '냉동식품',
                      '통조림',
                      '빙과류',
                      '음료',
                      '기타',
                    ],
                    hintText: '제품 분류',
                    onChanged: (String value) {
                      setState(() {
                        productInfo = value;
                        isAnswerProduct1 = true;
                      });
                    },
                    dropdownHeight: 220,
                  ),
                  if (isAnswerProduct1) const SizedBox(height: 8.0),
                  if (isAnswerProduct1)
                    CustomSingleDropDown(
                      dropdownList: [
                        '쿠키',
                        '봉지형',
                        '박스형',
                        '사탕류',
                        '빙과류',
                        '에너지바',
                        '초콜릿류',
                        '기타',
                      ],
                      hintText: '제품 형식 분류',
                      onChanged: (String value) {
                        setState(() {
                          productType = value;
                          isAnswerProduct2 = true;
                        });
                        print(value);
                      },
                      dropdownHeight: 220,
                    ),
                  if (isAnswerProduct2) const SizedBox(height: 8.0),
                  if (isAnswerProduct2)
                    CustomDropDownMulti(
                      dropdownList: [
                        '고소한 맛',
                        '달콤한 맛',
                        '새콤한 맛',
                        '매콤한 맛',
                      ],
                      hintText: '맛 기준 구현 2가지',
                      onChanged: (List<String> value) {
                        if (value.length >= 2) {
                          setState(() {
                            taste = value;
                            isAnswerProduct3 = true;
                          });
                        } else {
                          setState(() {
                            taste = value;
                            isAnswerProduct3 = false;
                          });
                        }
                      },
                      dropdownHeight: 194,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionContainer extends StatelessWidget {
  final String title;
  final bool isAnswer;
  final List<String> questionList;
  final void Function(String) onTap;
  final String question;

  const QuestionContainer({
    super.key,
    required this.title,
    required this.isAnswer,
    required this.questionList,
    required this.onTap,
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: isAnswer ? 220 : 0.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                title,
                style: MyTextStyle.bodyTitleRegular,
              ),
              ...questionList.map((e) => Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: InkWell(
                      onTap: () {
                        onTap(e);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            color: question == e
                                ? MyColor.primary
                                : MyColor.middleGrey,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: Text(
                            e,
                            style: MyTextStyle.descriptionRegular,
                          ),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
