import 'package:all_one_food/cart/provider/cart_provider.dart';
import 'package:all_one_food/common/component/default_button.dart';
import 'package:all_one_food/common/component/divider_container.dart';
import 'package:all_one_food/common/layout/default_app_bar.dart';
import 'package:all_one_food/common/layout/default_layout.dart';
import 'package:all_one_food/common/view/completion_screen.dart';
import 'package:all_one_food/order/component/delivery_info.dart';
import 'package:all_one_food/order/component/order_info.dart';
import 'package:all_one_food/order/component/product_info.dart';
import 'package:all_one_food/order/component/toss_payment_container.dart';
import 'package:all_one_food/order/provider/order_provider.dart';
import 'package:all_one_food/user/model/user_model.dart';
import 'package:all_one_food/user/provider/user_provider.dart';
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

  String cardName = ''; // 카드사 이름

  @override
  Widget build(BuildContext context) {
    final carts = ref.watch(selectedCartProvider);
    final user = ref.watch(userProvider) as UserModel;

    // price
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

    return DefaultLayout(
      isLoading: isLoading,
      appbar: const DefaultAppBar(title: '주문/결제'),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProductInfo(carts: carts),
            const DividerContainer(),
            OrderInfo(
              user: user,
              productPrice: productPrice,
              discountPrice: discountPrice,
              totalPrice: totalPrice,
            ),
            const DividerContainer(),
            DeliveryInfo(address: user.address),
            const DividerContainer(),
            TossPaymentContainer(
              onChanged: (value) {
                cardName = value;
              },
            ),
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

                  // 주문/결제하기
                  ref.read(orderProvider.notifier).orderFromCarts(
                        carts: carts,
                        user: user,
                        cardName: cardName,
                        totalPrice: totalPrice,
                      );

                  context.goNamed(
                    CompletionScreen.routeName,
                    pathParameters: {'title': '결제가\n정상적으로\n완료되었습니다.'},
                  );
                  // ref.read(orderProvider.notifier).orderProducts();
                  // ref.read(cartProvider.notifier).removeAll();
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
}
