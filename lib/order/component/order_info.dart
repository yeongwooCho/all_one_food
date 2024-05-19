
import 'package:all_one_food/cart/provider/cart_provider.dart';
import 'package:all_one_food/common/const/text_styles.dart';
import 'package:all_one_food/common/utils/data_utils.dart';
import 'package:all_one_food/user/model/user_model.dart';
import 'package:all_one_food/user/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderInfo extends ConsumerWidget {
  const OrderInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider) as UserModel;
    final carts = ref.watch(selectedCartProvider);

    final productPrice = carts
        .map((e) => e.product.price * e.amount)
        .reduce((value, element) => value + element);

    final totalPrice = carts
        .map((e) => (e.product.price * (1 - e.product.sale / 100)) * e.amount)
        .reduce((value, element) => value + element)
        .toInt();

    // final discountPrice = carts
    //     .map((e) => (e.product.price * e.product.sale / 100) * e.amount)
    //     .reduce((value, element) => value + element).toInt();
    final discountPrice = productPrice - totalPrice;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            '주문 정보',
            style: MyTextStyle.bigTitleBold,
          ),
          const SizedBox(height: 8.0),
          _renderTitleAndDescription(
            title: '주문자',
            description: user.name,
            isEmphasis: false,
          ),
          const SizedBox(height: 4.0),
          _renderTitleAndDescription(
            title: '주문자 연락처',
            description: user.phone,
            isEmphasis: false,
          ),
          const SizedBox(height: 4.0),
          _renderTitleAndDescription(
            title: '상품 금액',
            description:
                '${DataUtils.convertPriceToMoneyString(price: productPrice)} 원',
            isEmphasis: false,
          ),
          const SizedBox(height: 4.0),
          _renderTitleAndDescription(
            title: '할인 금액',
            description:
                '${DataUtils.convertPriceToMoneyString(price: discountPrice)} 원',
            isEmphasis: false,
          ),
          const SizedBox(height: 4.0),
          _renderTitleAndDescription(
            title: '최종 결제 금액',
            description:
                '${DataUtils.convertPriceToMoneyString(price: totalPrice)} 원',
            isEmphasis: true,
          ),
        ],
      ),
    );
  }

  Widget _renderTitleAndDescription({
    required String title,
    required String description,
    required bool isEmphasis,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: isEmphasis
                ? MyTextStyle.bodyBold
                : MyTextStyle.descriptionRegular,
          ),
          Text(
            description,
            style: isEmphasis
                ? MyTextStyle.bodyBold
                : MyTextStyle.descriptionRegular,
          ),
        ],
      ),
    );
  }
}
