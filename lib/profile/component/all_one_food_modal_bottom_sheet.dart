import 'package:all_one_food/all_one_food/provider/all_one_food_provider.dart';
import 'package:all_one_food/common/const/colors.dart';
import 'package:all_one_food/common/const/text_styles.dart';
import 'package:all_one_food/common/utils/data_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllOneFoodModalBottomSheet extends ConsumerWidget {
  const AllOneFoodModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allOneFood = ref.watch(allOneFoodProvider);

    return Container(
      decoration: const BoxDecoration(
        color: MyColor.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12.0),
        ),
      ),
      width: double.infinity,
      height: 480.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              '기본 정보',
              style: MyTextStyle.bigTitleMedium,
            ),
            const SizedBox(height: 8.0),
            _renderTitleAndDescription(
              title: '한 줄 소개',
              description: allOneFood.shortInfo,
            ),
            _renderTitleAndDescription(
              title: '스낵 분류',
              description: allOneFood.snack,
            ),
            _renderTitleAndDescription(
              title: '주요 가치',
              description: allOneFood.value.join(', '),
            ),
            _renderTitleAndDescription(
              title: '희망 생산 원가',
              description:
                  '${DataUtils.convertPriceToMoneyString(price: allOneFood.wishedPrice)} 원',
            ),
            const SizedBox(height: 40.0),
            const Text(
              '상담 일정',
              style: MyTextStyle.bigTitleMedium,
            ),
            const SizedBox(height: 8.0),
            _renderTitleAndDescription(
              title: '일자',
              description: DataUtils.convertDateTimeToDateString(
                  datetime: allOneFood.consultingAt),
            ),
            _renderTitleAndDescription(
              title: '시간',
              description: DataUtils.convertDateTimeToTimeString(
                  datetime: allOneFood.consultingAt),
            ),
            _renderTitleAndDescription(
              title: '유형',
              description: allOneFood.consultingType,
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
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120.0,
            child: Text(
              title,
              style: MyTextStyle.descriptionMedium,
            ),
          ),
          Expanded(
            child: Text(
              description,
              style: MyTextStyle.descriptionRegular,
            ),
          ),
        ],
      ),
    );
  }
}
