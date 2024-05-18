import 'package:all_one_food/cart/model/cart_model.dart';
import 'package:all_one_food/cart/provider/cart_provider.dart';
import 'package:all_one_food/common/component/default_button.dart';
import 'package:all_one_food/common/component/divider_container.dart';
import 'package:all_one_food/common/component/see_more_button.dart';
import 'package:all_one_food/common/const/text_styles.dart';
import 'package:all_one_food/common/layout/default_app_bar.dart';
import 'package:all_one_food/common/layout/default_layout.dart';
import 'package:all_one_food/common/utils/data_utils.dart';
import 'package:all_one_food/common/view/completion_screen.dart';
import 'package:all_one_food/order/component/toss_payment_container.dart';
import 'package:all_one_food/product/component/product_and_amount_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CreateOrderScreen extends ConsumerStatefulWidget {
  static String get routeName => 'order';

  const CreateOrderScreen({super.key});

  @override
  ConsumerState<CreateOrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends ConsumerState<CreateOrderScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final carts = ref.watch(cartProvider).where((e) => e.isSelected).toList();
    // final totalPrice =
    //     orders.fold(0, (pre, e) => pre + e.productModel.price * e.amount);

    return DefaultLayout(
      isLoading: isLoading,
      appbar: const DefaultAppBar(title: '주문/결제'),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _ProductInfo(carts: carts),
            const DividerContainer(),
            renderAddress(),
            const DividerContainer(),
            TossPaymentContainer(),
            const DividerContainer(),
            // renderPaymentInfoWidget(totalPrice: totalPrice),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: PrimaryButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  await Future.delayed(const Duration(seconds: 2));
                  setState(() {
                    isLoading = false;
                  });

                  context.goNamed(
                    CompletionScreen.routeName,
                    pathParameters: {'title': '결제가\n정상적으로\n완료되었습니다.'},
                  );
                  // ref.read(orderProvider.notifier).orderProducts();
                  ref.read(cartProvider.notifier).removeAll();
                },
                child: const Text('결제하기'),
              ),
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }

  Widget renderAddress() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '배송지 정보',
                style: MyTextStyle.bigTitleBold,
              ),
              SeeMoreButton(
                title: '배송지 변경',
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Text(
            '최지우',
            style: MyTextStyle.descriptionRegular,
          ),
          const SizedBox(height: 4.0),
          Text(
            '010-1234-1234',
            style: MyTextStyle.descriptionRegular,
          ),
          const SizedBox(height: 4.0),
          Text(
            '서울특별시 종로구 세종대로 182',
            style: MyTextStyle.descriptionRegular,
          ),
        ],
      ),
    );
  }

  Widget renderPaymentInfoWidget({
    required int totalPrice,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            '결제 정보',
            style: MyTextStyle.bigTitleBold,
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '최종 결제 금액',
                style: MyTextStyle.bodyBold,
              ),
              Text(
                '${DataUtils.convertPriceToMoneyString(price: totalPrice)} 원',
                style: MyTextStyle.bodyBold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProductInfo extends StatelessWidget {
  final List<CartModel> carts;

  const _ProductInfo({
    super.key,
    required this.carts,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
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
