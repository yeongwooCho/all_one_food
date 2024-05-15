import 'package:all_one_food/common/layout/default_app_bar.dart';
import 'package:all_one_food/common/layout/default_layout.dart';
import 'package:all_one_food/product/component/vertical_item_grid.dart';
import 'package:all_one_food/product/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductScreen extends ConsumerWidget {
  static String get routeName => "product";

  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productProvider);

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '상품 리스트'),
      child: VerticalItemList(products: products),
    );
  }
}
