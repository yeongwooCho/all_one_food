import 'dart:math';

import 'package:all_one_food/cart/model/cart_model.dart';
import 'package:all_one_food/order/model/order_model.dart';
import 'package:all_one_food/product/model/product_model.dart';
import 'package:all_one_food/product/provider/product_provider.dart';
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
//
//   void addProductRightNow({
//     required ProductModel product,
//     required int amount,
//   }) {
//     final now = DateTime.now();
//     state = [
//       ...state,
//       OrderModel(
//         product: productModel,
//         amount: amount,
//         deliveryState: DeliveryState.no,
//         createdAt: DateTime(now.year, now.month, now.day), id: '', product: null,
//       ),
//     ];
//   }
//
//   void addProductsFromCarts({
//     required List<CartModel> carts,
//   }) {
//     final now = DateTime.now();
//     state = [
//       ...state,
//       ...carts
//           .map((e) => OrderModel(
//                 productModel: e.product,
//                 amount: e.amount,
//                 deliveryState: DeliveryState.no,
//                 createdAt: DateTime(now.year, now.month, now.day),
//               ))
//           .toList()
//     ];
//   }
//
//   void orderProducts() {
//     state = [
//       ...state.map((e) {
//         if (e.deliveryState == DeliveryState.no) {
//           return e.copyWith(
//             deliveryState: DeliveryState.ready,
//           );
//         } else {
//           return e;
//         }
//       }).toList()
//     ];
//   }

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
