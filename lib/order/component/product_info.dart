import 'package:all_one_food/cart/provider/cart_provider.dart';
import 'package:all_one_food/common/const/text_styles.dart';
import 'package:all_one_food/product/component/product_and_amount_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductInfo extends ConsumerWidget {
  const ProductInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carts = ref.watch(selectedCartProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            '상품 정보',
            style: MyTextStyle.bigTitleBold,
          ),
          const SizedBox(height: 8.0),
          ...carts.map(
            (cart) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ProductAndAmountCard(
                cart: cart,
                isFixed: true,
              ),
            ),
          )
        ],
      ),
    );
  }
}
