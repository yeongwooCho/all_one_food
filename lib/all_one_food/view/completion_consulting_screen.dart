import 'package:all_one_food/all_one_food/view/reserve_consulting.dart';
import 'package:all_one_food/common/component/default_button.dart';
import 'package:all_one_food/common/const/colors.dart';
import 'package:all_one_food/common/const/text_styles.dart';
import 'package:all_one_food/common/layout/default_app_bar.dart';
import 'package:all_one_food/common/layout/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CompletionConsultingScreen extends StatelessWidget {
  static String get routeName => 'completion_consulting';

  const CompletionConsultingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: '컨셉 결과'),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _renderTitleAndDescription(
              title: '리포팅',
              description:
                  '동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 ',
            ),
            _renderTitleAndDescription(
              title: '제품 설명',
              description:
                  '동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 ',
            ),
            _renderTitleAndDescription(
              title: '특징 및 장점',
              description:
                  '동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 ',
            ),
            _renderTitleAndDescription(
              title: '영양정보',
              description:
                  '동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 ',
            ),
            _renderTitleAndDescription(
              title: '제품 종류',
              description:
                  '동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 ',
            ),
            _renderTitleAndDescription(
              title: '판매 포인트',
              description:
                  '동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 ',
            ),
            _renderTitleAndDescription(
              title: '관련 이미지 아이디어',
              description:
                  '동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 ',
            ),
            _renderTitleAndDescription(
              title: '희망 생산원가',
              description:
                  '동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 ',
            ),
            _renderRecommandPrice(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
              child: PrimaryButton(
                onPressed: () {
                  context.goNamed(ReserveConsultingScreen.routeName);
                },
                child: const Text('전문가 상담 요청'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderTitleAndDescription({
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: MyTextStyle.bodyTitleMedium,
          ),
          const SizedBox(height: 8.0),
          Text(
            description,
            style: MyTextStyle.descriptionRegular,
          ),
        ],
      ),
    );
  }

  Widget _renderRecommandPrice() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            '추천 생산원가',
            style: MyTextStyle.bodyTitleMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            '고객님께 추천 드리는 AOF를 통한 우수 컨설팅 사례',
            style: MyTextStyle.minimumRegular.copyWith(
              color: MyColor.darkGrey,
            ),
          ),
        ),
        SizedBox(
          height: 150.0,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: MyColor.middleGrey,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                width: 230.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        '크라운 콩 단백질 에너지바',
                        style: MyTextStyle.bodyRegular,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        '콩 단백질을 함유하여 비건 고객 맞춤 건강한 에너지바',
                        style: MyTextStyle.descriptionRegular,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        '1,500원',
                        style: MyTextStyle.descriptionRegular,
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 8.0);
            },
            itemCount: 4,
          ),
        ),
      ],
    );
  }
}
