import 'package:all_one_food/cart/model/cart_model.dart';
import 'package:all_one_food/common/utils/data_utils.dart';
import 'package:all_one_food/order/model/delivery_model.dart';
import 'package:all_one_food/order/model/order_model.dart';
import 'package:all_one_food/order/model/payment_model.dart';
import 'package:all_one_food/product/model/product_model.dart';
import 'package:all_one_food/product/provider/product_provider.dart';
import 'package:all_one_food/user/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderProvider =
    StateNotifierProvider<OrderStateNotifier, List<OrderModel>>((ref) {
  final products = ref.read(productProvider);

  return OrderStateNotifier(products: products);
});

class OrderStateNotifier extends StateNotifier<List<OrderModel>> {
  final List<ProductModel> products;

  OrderStateNotifier({
    required this.products,
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
    return [
      // ...products.map((e) {
      //   DateTime createdAt = DateTime(
      //     2024,
      //     Random().nextInt(DateTime.now().month) + 1,
      //     Random().nextInt(DateTime.now().day) + 1,
      //   );
      //
      //   return OrderModel(
      //     productModel: e,
      //     amount: Random().nextInt(30),
      //     deliveryState:
      //         DateTime.now().difference(createdAt) < Duration(days: 7)
      //             ? DeliveryState.doing
      //             : DeliveryState.done,
      //     createdAt: createdAt,
      //   );
      // }).toList(),
    ];
  }
}
