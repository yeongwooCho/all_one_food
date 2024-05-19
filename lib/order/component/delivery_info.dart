import 'package:all_one_food/common/component/custom_text_form_field.dart';
import 'package:all_one_food/common/const/colors.dart';
import 'package:all_one_food/common/const/text_styles.dart';
import 'package:all_one_food/user/model/user_model.dart';
import 'package:all_one_food/user/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DeliveryInfo extends ConsumerStatefulWidget {
  const DeliveryInfo({super.key});

  @override
  ConsumerState<DeliveryInfo> createState() => _DeliveryInfoState();
}

class _DeliveryInfoState extends ConsumerState<DeliveryInfo> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _detailAddressController =
      TextEditingController();
  final TextEditingController _memoController = TextEditingController();

  bool isSelectedEqual = true;

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider) as UserModel;

    if (isSelectedEqual) {
      _nameController.text = user.address.name;
      _phoneController.text = user.address.phone;
      _addressController.text = user.address.address;
      _detailAddressController.text = user.address.detailAddress;
      _memoController.text = user.address.memo;
    } else {
      _nameController.text = '';
      _phoneController.text = '';
      _addressController.text = '';
      _detailAddressController.text = '';
      _memoController.text = '';
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            '배송 정보',
            style: MyTextStyle.bigTitleBold,
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                '주문자 정보와 동일',
                style: MyTextStyle.descriptionRegular,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    isSelectedEqual = !isSelectedEqual;
                  });
                },
                icon: PhosphorIcon(
                  isSelectedEqual
                      ? PhosphorIcons.checkSquare(PhosphorIconsStyle.fill)
                      : PhosphorIcons.square(),
                  size: 24.0,
                  color: MyColor.text,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          _renderTitleAndForm(
            title: '받으시는 분',
            controller: _nameController,
          ),
          const SizedBox(height: 4.0),
          _renderTitleAndForm(
            title: '받으시는 분 연락처',
            controller: _phoneController,
          ),
          const SizedBox(height: 4.0),
          _renderTitleAndForm(
            title: '상품 금액',
            controller: _addressController,
          ),
          const SizedBox(height: 4.0),
          _renderTitleAndForm(
            title: '할인 금액',
            controller: _detailAddressController,
          ),
          const SizedBox(height: 4.0),
          _renderTitleAndForm(
            title: '최종 결제 금액',
            controller: _memoController,
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
}
