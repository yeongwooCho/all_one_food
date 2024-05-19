import 'package:all_one_food/common/const/text_styles.dart';
import 'package:all_one_food/common/utils/data_utils.dart';
import 'package:all_one_food/order/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderListCard extends ConsumerWidget {
  final OrderModel order;

  const OrderListCard({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        renderTitleAndDescription(
          title: '상품명',
          description: order.carts.length > 1
              ? '${order.carts.first.product.name}외 ${order.carts.length - 1}개'
              : order.carts.first.product.name,
        ),
        renderTitleAndDescription(
          title: '주문번호',
          description: DataUtils.extractNumbers(order.id.split('-').join())
              .substring(0, 9),
        ),
        renderTitleAndDescription(
          title: '결제금액',
          description:
              '${DataUtils.convertPriceToMoneyString(price: order.payment.price)} 원',
        ),
        renderTitleAndDescription(
          title: '주문상태',
          description: order.status.label,
        ),
      ],
    );
  }

  Widget renderTitleAndDescription({
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: MyTextStyle.descriptionRegular,
          ),
          Text(
            description,
            style: MyTextStyle.descriptionRegular,
          ),
        ],
      ),
    );
  }
}
