
import 'package:all_one_food/cart/provider/cart_provider.dart';
import 'package:all_one_food/common/component/custom_text_form_field.dart';
import 'package:all_one_food/common/const/text_styles.dart';
import 'package:all_one_food/common/utils/data_utils.dart';
import 'package:all_one_food/user/model/user_model.dart';
import 'package:all_one_food/user/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderInfo extends ConsumerStatefulWidget {
  const OrderInfo({super.key});

  @override
  ConsumerState<OrderInfo> createState() => _OrderInfoState();
}

class _OrderInfoState extends ConsumerState<OrderInfo> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider) as UserModel;
    final carts = ref.watch(selectedCartProvider);

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

    _nameController.text = user.name;
    _phoneController.text = user.phone;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            '주문 정보',
            style: MyTextStyle.bigTitleBold,
          ),
          const SizedBox(height: 8.0),
          _renderTitleAndForm(
            title: '주문자',
            controller: _nameController,
          ),
          const SizedBox(height: 4.0),
          _renderTitleAndForm(
            title: '주문자 연락처',
            controller: _phoneController,
          ),
          const SizedBox(height: 4.0),
          _renderTitleAndDescription(
            title: '상품 금액',
            description:
            DataUtils.convertPriceToMoneyString(price: productPrice),
            isEmphasis: false,
          ),
          const SizedBox(height: 4.0),
          _renderTitleAndDescription(
            title: '할인 금액',
            description:
            DataUtils.convertPriceToMoneyString(price: discountPrice),
            isEmphasis: false,
          ),
          const SizedBox(height: 4.0),
          _renderTitleAndDescription(
            title: '최종 결제 금액',
            description: DataUtils.convertPriceToMoneyString(price: totalPrice),
            isEmphasis: true,
          ),
        ],
      ),
    );
  }

  Widget _renderTitleAndForm({
    required String title,
    required TextEditingController controller,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 140.0,
          child: Text(
            title,
            style: MyTextStyle.descriptionRegular,
          ),
        ),
        Expanded(
          child: CustomTextFormField(
            controller: controller,
            onChanged: (String value) {},
            onSaved: (String? newValue) {},
            validator: (String? value) {
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _renderTitleAndDescription({
    required String title,
    required String description,
    required bool isEmphasis,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: isEmphasis
                ? MyTextStyle.bodyBold
                : MyTextStyle.descriptionRegular,
          ),
          Text(
            '$description 원',
            style: isEmphasis
                ? MyTextStyle.bodyBold
                : MyTextStyle.descriptionRegular,
          ),
        ],
      ),
    );
  }
}
