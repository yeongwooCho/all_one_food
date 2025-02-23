import 'dart:math';

import 'package:all_one_food/cart/model/cart_model.dart';
import 'package:all_one_food/common/utils/data_utils.dart';
import 'package:all_one_food/order/model/delivery_model.dart';
import 'package:all_one_food/order/model/order_model.dart';
import 'package:all_one_food/order/model/payment_model.dart';
import 'package:all_one_food/product/model/product_model.dart';
import 'package:all_one_food/product/provider/product_provider.dart';
import 'package:all_one_food/user/model/user_model.dart';
import 'package:all_one_food/user/provider/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderDetailProvider = Provider.family<OrderModel, String>((ref, id) {
  final orders = ref.watch(orderProvider);

  return orders.firstWhere((element) => element.id == id);
});

final orderProvider =
    StateNotifierProvider<OrderStateNotifier, List<OrderModel>>((ref) {
  final products = ref.read(productProvider);
  final user = ref.read(userProvider) as UserModel;

  return OrderStateNotifier(
    products: products,
    user: user,
  );
});

class OrderStateNotifier extends StateNotifier<List<OrderModel>> {
  final List<ProductModel> products;
  final UserModel user;

  OrderStateNotifier({
    required this.products,
    required this.user,
  }) : super([]) {
    state = getOrders();
  }

  // void orderFromCarts({
  //   required List<CartModel> carts,
  //   required String orderName,
  //   required String orderPhone,
  //   required DeliveryModel delivery,
  //   required PaymentModel payment,
  // }) {
  //   state = [
  //     ...state,
  //     OrderModel(
  //       id: DataUtils.getUuid(),
  //       createdAt: DateTime.now(),
  //       name: orderName,
  //       phone: orderPhone,
  //       carts: carts,
  //       delivery: delivery,
  //       payment: payment,
  //     ),
  //   ];
  // }

  void orderFromCarts({
    required List<CartModel> carts,
    required UserModel user,
    required String cardName,
    required int totalPrice,
  }) {
    final delivery = DeliveryModel(
      id: DataUtils.getUuid(),
      recipientName: user.address.name,
      recipientPhone: user.address.phone,
      recipientAddress: user.address.address + user.address.detailAddress,
      recipientMemo: user.address.memo,
    );
    final payment = PaymentModel(
        id: DataUtils.getUuid(),
        cardName: cardName,
        status: '완료',
        price: totalPrice,
        createdAt: DateTime.now(),
    );

    state = [
      ...state,
      OrderModel(
        id: DataUtils.getUuid(),
        createdAt: DateTime.now(),
        name: user.name,
        phone: user.phone,
        carts: carts,
        delivery: delivery,
        payment: payment,
      ),
    ];
  }

  List<OrderModel> getOrders() {
    int amount = 10;
    return [
      ...products.map((e) {
        DateTime createdAt = DateTime(
          2024,
          Random().nextInt(DateTime.now().month) + 1,
          Random().nextInt(DateTime.now().day) + 1,
          Random().nextInt(DateTime.now().hour) + 1,
          Random().nextInt(DateTime.now().minute) + 1,
        );

        return OrderModel(
          id: DataUtils.getUuid(),
          createdAt: createdAt,
          name: '홍석표',
          phone: '010-1234-1234',
          status: OrderStatus.done,
          carts: [
            CartModel(
              id: DataUtils.getUuid(),
              product: e,
              amount: amount,
              isSelected: true,
            )
          ],
          delivery: DeliveryModel(
            id: DataUtils.getUuid(),
            recipientName: user.address.name,
            recipientPhone: user.address.phone,
            recipientAddress:
                '${user.address.address}\n${user.address.detailAddress}',
            recipientMemo: user.address.memo,
          ),
          payment: PaymentModel(
            id: DataUtils.getUuid(),
            cardName: '국민카드',
            price: e.price * (100 - e.sale) ~/ 100 * amount,
            createdAt: createdAt,
          ),
        );
      }),
    ];
  }
}
