import 'package:all_one_food/common/const/text_styles.dart';
import 'package:all_one_food/common/layout/default_app_bar.dart';
import 'package:all_one_food/common/layout/default_layout.dart';
import 'package:all_one_food/order/provider/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderDetailScreen extends ConsumerStatefulWidget {
  static String get routeName => 'order_detail';

  final String id;

  const OrderDetailScreen({
    super.key,
    required this.id,
  });

  @override
  ConsumerState<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends ConsumerState<OrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final order = ref.watch(orderDetailProvider(widget.id));

    return DefaultLayout(
      appbar: DefaultAppBar(title: '주문상세'),
      child: Column(
        children: [
          Text(widget.id),
          _renderTitleAndDescription(
              title: 'title', description: 'description'),
          _renderTitleAndDescription(
              title: 'title', description: 'description'),
          _renderTitleAndDescription(
              title: 'title', description: 'description'),
          _renderTitleAndDescription(
              title: 'title', description: 'description'),
        ],
      ),
    );
  }

  Widget _renderTitleAndDescription({
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
