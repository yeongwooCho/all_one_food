import 'package:all_one_food/common/component/default_button.dart';
import 'package:all_one_food/common/component/divider_container.dart';
import 'package:all_one_food/common/layout/default_app_bar.dart';
import 'package:all_one_food/common/layout/default_layout.dart';
import 'package:all_one_food/common/view/completion_screen.dart';
import 'package:all_one_food/order/component/delivery_info.dart';
import 'package:all_one_food/order/component/order_info.dart';
import 'package:all_one_food/order/component/product_info.dart';
import 'package:all_one_food/order/component/toss_payment_container.dart';
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
    return DefaultLayout(
      isLoading: isLoading,
      appbar: const DefaultAppBar(title: '주문/결제'),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProductInfo(),
            const DividerContainer(),
            OrderInfo(),
            const DividerContainer(),
            DeliveryInfo(),
            const DividerContainer(),
            TossPaymentContainer(),
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
