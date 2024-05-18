import 'package:all_one_food/common/const/colors.dart';
import 'package:all_one_food/common/const/text_styles.dart';
import 'package:all_one_food/common/provider/global_provider.dart';
import 'package:all_one_food/common/utils/data_utils.dart';
import 'package:all_one_food/product/model/rating_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class RatingContainer extends ConsumerWidget {
  const RatingContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ratings = ref.watch(ratingProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '최근 리뷰 5건',
                style: MyTextStyle.bigTitleMedium,
              ),
              IconButton(
                onPressed: () {},
                icon: PhosphorIcon(
                  PhosphorIcons.caretDown(),
                  size: 32.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              final rating = ratings[index];

              return RatingCard(rating: rating);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 8.0);
            },
            itemCount: 5,
          ),
        ],
      ),
    );
  }
}

class RatingCard extends StatelessWidget {
  final RatingModel rating;

  const RatingCard({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: MyColor.middleGrey,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  rating.username,
                  style: MyTextStyle.bodyTitleRegular,
                ),
                Row(
                  children: [
                    PhosphorIcon(
                      PhosphorIcons.star(PhosphorIconsStyle.fill),
                      size: 24.0,
                      color: MyColor.primary,
                    ),
                    const SizedBox(width: 6.0),
                    Text(
                      rating.ratingPoint.toString(),
                      style: MyTextStyle.bodyTitleRegular.copyWith(
                        color: MyColor.primary,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 4.0),
            Text(
              DataUtils.convertDateTimeToDateString(datetime: rating.createAt),
              style: MyTextStyle.descriptionRegular.copyWith(
                color: MyColor.darkGrey,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              rating.content,
              style: MyTextStyle.descriptionRegular,
            ),
          ],
        ),
      ),
    );
  }
}
