import 'package:all_one_food/cart/provider/cart_provider.dart';
import 'package:all_one_food/common/component/default_button.dart';
import 'package:all_one_food/common/component/divider_container.dart';
import 'package:all_one_food/common/const/colors.dart';
import 'package:all_one_food/common/const/text_styles.dart';
import 'package:all_one_food/common/layout/default_app_bar.dart';
import 'package:all_one_food/common/layout/default_layout.dart';
import 'package:all_one_food/product/view/product_screen.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hidable/hidable.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CartScreen extends ConsumerStatefulWidget {
  static String get routeName => 'cart';

  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final carts = ref.watch(cartProvider);
    final isAllSelected =
        carts.firstWhereOrNull((element) => !element.isSelected) == null;

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '장바구니'),
      bottomNavigationBar: Hidable(
        controller: scrollController,
        preferredWidgetSize: const Size(double.infinity, 68.0),
        child: carts.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(
                    bottom: 20.0, left: 24.0, right: 24.0),
                child: Row(
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        onPressed: () {
                          // ref
                          //     .read(orderProvider.notifier)
                          //     .addProductsFromCarts(carts: carts);
                          // context.goNamed(OrderScreen.routeName);
                        },
                        child: const Text('선택한 상품 결제하기'),
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox(height: 0.0),
      ),
      child: carts.isNotEmpty
          ? Column(
              children: [
                Hidable(
                  controller: scrollController,
                  preferredWidgetSize: const Size.fromHeight(72.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 24.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            // ref
                            //     .read(cartProvider.notifier)
                            //     .updateAllSelected(isSelected: !isAllSelected);
                          },
                          child: Row(
                            children: [
                              (isAllSelected)
                                  ? PhosphorIcon(
                                      PhosphorIcons.checkCircle(
                                        PhosphorIconsStyle.fill,
                                      ),
                                      color: MyColor.primary,
                                      size: 32.0,
                                    )
                                  : PhosphorIcon(
                                      PhosphorIcons.circle(),
                                      color: MyColor.text,
                                      size: 32.0,
                                    ),
                              const SizedBox(width: 8.0),
                              const Text(
                                '전체 선택',
                                style: MyTextStyle.bodyBold,
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            // ref
                            //     .read(cartProvider.notifier)
                            //     .removeAllSelectedProduct();
                          },
                          child: const Text(
                            '선택 삭제',
                            style: MyTextStyle.bodyBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const DividerContainer(),
                Expanded(
                  child: ListView.separated(
                    controller: scrollController,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    itemBuilder: (_, index) {
                      final cart = carts[index];

                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 16.0,
                              right: 16.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    // ref
                                    //     .read(cartProvider.notifier)
                                    //     .updateSelected(
                                    //       cartId: cart.id,
                                    //       isSelected: !cart.isSelected,
                                    //     );
                                  },
                                  icon: cart.isSelected
                                      ? PhosphorIcon(
                                          PhosphorIcons.checkCircle(
                                            PhosphorIconsStyle.fill,
                                          ),
                                          color: MyColor.primary,
                                        )
                                      : PhosphorIcon(PhosphorIcons.circle()),
                                  iconSize: 32.0,
                                ),
                                IconButton(
                                  onPressed: () {
                                    // ref
                                    //     .read(cartProvider.notifier)
                                    //     .removeProduct(id: cart.id);
                                  },
                                  icon: PhosphorIcon(PhosphorIcons.x()),
                                  iconSize: 32.0,
                                ),
                              ],
                            ),
                          ),
                          // VerticalItemListCard(
                          //   product: cart.productModel,
                          //   amount: cart.amount,
                          //   amountUpdateButton: InkWell(
                          //     onTap: () {
                          //       showModalBottomSheet(
                          //         context: context,
                          //         builder: (_) {
                          //           return Container(
                          //             height: 200.0,
                          //             decoration: BoxDecoration(
                          //                 borderRadius:
                          //                     BorderRadius.circular(12.0),
                          //                 color: MyColor.white),
                          //             child: CupertinoPicker(
                          //               itemExtent: 40.0,
                          //               onSelectedItemChanged: (int value) {
                          //                 // ref
                          //                 //     .read(cartProvider.notifier)
                          //                 //     .updateAmount(
                          //                 //       cartId: cart.id,
                          //                 //       amount: value + 1,
                          //                 //     );
                          //               },
                          //               children: List.generate(
                          //                 100,
                          //                 (index) => Center(
                          //                   child: Text(
                          //                     (index + 1).toString(),
                          //                   ),
                          //                 ),
                          //               ).toList(),
                          //             ),
                          //           );
                          //         },
                          //       );
                          //     },
                          //     child: Container(
                          //       color: MyColor.primary,
                          //       child: Padding(
                          //         padding: const EdgeInsets.all(4.0),
                          //         child: Text(
                          //           '갯수 변경',
                          //           style: MyTextStyle.minimumRegular.copyWith(
                          //             color: MyColor.white,
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.0),
                        child: Divider(height: 40.0),
                      );
                    },
                    itemCount: carts.length,
                  ),
                )
              ],
            )
          : Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 24.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 80.0),
                  const Text(
                    '장바구니에\n담긴 상품이 없습니다.',
                    style: MyTextStyle.headTitle,
                    textAlign: TextAlign.start,
                  ),
                  const Expanded(child: SizedBox(height: 1.0)),
                  PrimaryButton(
                    onPressed: () {
                      context.goNamed(ProductScreen.routeName);
                    },
                    child: const Text('상품 보러가기'),
                  )
                ],
              ),
            ),
    );
  }
}
