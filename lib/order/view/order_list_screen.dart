import 'package:all_one_food/common/const/text_styles.dart';
import 'package:all_one_food/common/layout/default_app_bar.dart';
import 'package:all_one_food/common/layout/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderListScreen extends ConsumerWidget {
  static String get routeName => 'order_list';

  const OrderListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final orders = ref
    //     .watch(orderProvider)
    //     .where((e) => e.deliveryState != DeliveryState.no)
    //     .toList();
    // final readyOrders =
    // orders.where((e) => e.deliveryState == DeliveryState.ready).toList();
    // final doingOrders =
    // orders.where((e) => e.deliveryState == DeliveryState.doing).toList();
    // final doneOrders =
    // orders.where((e) => e.deliveryState == DeliveryState.done).toList();

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '배송 현황'),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // renderDeliveryAmount(count: orders.length, title: '전체'),
                // renderDeliveryAmount(count: readyOrders.length, title: '준비중'),
                // renderDeliveryAmount(count: doingOrders.length, title: '배송중'),
                // renderDeliveryAmount(count: doneOrders.length, title: '배송완료'),
              ],
            ),
          ),
          // DeliveryListView(orders: orders),
        ],
      ),
    );
  }

  Widget renderDeliveryAmount({
    required int count,
    required String title,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            count.toString(),
            style: MyTextStyle.bigTitleBold,
          ),
          Text(
            title,
            style: MyTextStyle.minimumRegular,
          ),
        ],
      ),
    );
  }
}
//
// class DeliveryListView extends StatelessWidget {
//   final List<OrderModel> orders;
//
//   const DeliveryListView({
//     super.key,
//     required this.orders,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: GroupedListView<OrderModel, String>(
//         physics: const BouncingScrollPhysics(),
//         elements: orders,
//         groupBy: (element) => element.createdAt.toString().split(' ').first,
//         groupSeparatorBuilder: (String groupByValue) => Column(
//           children: [
//             const DividerContainer(),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   const SizedBox(height: 16.0),
//                   Text(
//                     groupByValue,
//                     style: MyTextStyle.bigTitleRegular,
//                     textAlign: TextAlign.start,
//                   ),
//                   const SizedBox(height: 16.0),
//                   const Divider(height: 1.0),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         itemBuilder: (context, OrderModel element) => Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             const SizedBox(height: 16.0),
//             Padding(
//               padding: const EdgeInsets.only(left: 24.0, bottom: 8.0),
//               child: Text(
//                 element.deliveryState.label,
//                 style: MyTextStyle.bodyBold,
//               ),
//             ),
//             VerticalItemListCard(
//               product: element.productModel,
//               amount: element.amount,
//             ),
//             const SizedBox(height: 16.0),
//           ],
//         ),
//         itemComparator: (item1, item2) => item1.createdAt.compareTo(
//           item2.createdAt,
//         ),
//         order: GroupedListOrder.DESC,
//       ),
//     );
//   }
// }
