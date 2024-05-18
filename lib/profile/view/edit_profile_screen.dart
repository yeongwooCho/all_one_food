import 'package:all_one_food/common/component/custom_text_form_field.dart';
import 'package:all_one_food/common/component/default_button.dart';
import 'package:all_one_food/common/component/show/show_custom_toast.dart';
import 'package:all_one_food/common/const/colors.dart';
import 'package:all_one_food/common/const/text_styles.dart';
import 'package:all_one_food/common/layout/default_app_bar.dart';
import 'package:all_one_food/common/layout/default_layout.dart';
import 'package:all_one_food/user/model/user_model.dart';
import 'package:all_one_food/user/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  static String get routeName => "edit_profile";

  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  // final MultiSelectController _controller = MultiSelectController();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _businessNumberController =
      TextEditingController();
  final TextEditingController _businessNameController = TextEditingController();

  List<String> selectedDropdownItems = [];

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);

    if (user is UserModel) {
      _usernameController.text = user.username;
      _nameController.text = user.name;
      _phoneController.text = user.phone;
      _businessNumberController.text = user.business.number.toString();
      _businessNameController.text = user.business.name;
    }

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '내 정보 수정'),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 20.0,
          ),
          child: Container(
            color: MyColor.empty,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 4.0),
                  child: Text(
                    '프로필 사진',
                    style: MyTextStyle.bodyTitleMedium,
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(
                      'asset/img/user/user.png',
                      width: 120.0,
                      height: 120.0,
                    ),
                    const SizedBox(width: 16.0),
                    SecondaryButton(
                      onPressed: () {},
                      child: Text('프로필 사진 변경'),
                    ),
                  ],
                ),
                const SizedBox(height: 40.0),
                const Padding(
                  padding: EdgeInsets.only(left: 4.0),
                  child: Text(
                    '회원정보',
                    style: MyTextStyle.bodyTitleMedium,
                  ),
                ),
                const SizedBox(height: 8.0),
                CustomTextFormField(
                  controller: _usernameController,
                  onChanged: (String? value) {},
                  onSaved: (String? value) {},
                  validator: (String? value) {
                    return null;
                  },
                ),
                const SizedBox(height: 8.0),
                CustomTextFormField(
                  controller: _nameController,
                  onChanged: (String? value) {},
                  onSaved: (String? value) {},
                  validator: (String? value) {
                    return null;
                  },
                ),
                const SizedBox(height: 8.0),
                CustomTextFormField(
                  controller: _phoneController,
                  onChanged: (String? value) {},
                  onSaved: (String? value) {},
                  validator: (String? value) {
                    return null;
                  },
                  textInputType: TextInputType.number,
                ),
                const SizedBox(height: 8.0),
                CustomTextFormField(
                  hintText: '비밀번호(영문, 숫자, 특수문자 합 8~15자)',
                  onChanged: (String? value) {},
                  onSaved: (String? value) {},
                  validator: (String? value) {
                    return null;
                  },
                  textInputType: TextInputType.number,
                ),
                const SizedBox(height: 8.0),
                CustomTextFormField(
                  hintText: '비밀번호 확인',
                  onChanged: (String? value) {},
                  onSaved: (String? value) {},
                  validator: (String? value) {
                    return null;
                  },
                  textInputType: TextInputType.number,
                ),
                const SizedBox(height: 40.0),
                const Padding(
                  padding: EdgeInsets.only(left: 4.0),
                  child: Text(
                    '사업자 정보',
                    style: MyTextStyle.bodyTitleMedium,
                  ),
                ),
                const SizedBox(height: 8.0),
                CustomTextFormField(
                  controller: _businessNumberController,
                  onChanged: (String? value) {},
                  onSaved: (String? value) {},
                  validator: (String? value) {
                    return null;
                  },
                  textInputType: TextInputType.number,
                ),
                const SizedBox(height: 8.0),
                CustomTextFormField(
                  controller: _businessNameController,
                  onChanged: (String? value) {},
                  onSaved: (String? value) {},
                  validator: (String? value) {
                    return null;
                  },
                  textInputType: TextInputType.number,
                ),
                const SizedBox(height: 8.0),
                SecondaryButton(
                  onPressed: () {},
                  child: const Text('사업자 등록증 업로드'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 40.0,
                  ),
                  child: PrimaryButton(
                    onPressed: () {
                      // ref.read(userProvider.notifier).updateInfo(
                      //       name: _nameController.text,
                      //       phone: _phoneController.text,
                      //     );
                      //
                      // ref.read(userProvider.notifier).updateKeywords(
                      //   newKeywords: [...selectedDropdownItems],
                      // );
                      //
                      showCustomToast(context, msg: '저장이 완료되었습니다.');
                      context.pop();
                    },
                    child: const Text('변경하기'),
                  ),
                )
                // MultiSelectDropDown(
                //   controller: _controller,
                //   onOptionSelected: (options) {
                //     selectedDropdownItems = options.map((e) => e.label).toList();
                //   },
                //   onOptionRemoved: (index, option) {},
                //   options: keywords
                //       .mapIndexed((index, element) => ValueItem<int>(
                //             label: element,
                //             value: index,
                //           ))
                //       .toList(),
                //   maxItems: 3,
                //   selectionType: SelectionType.multi,
                //   chipConfig: ChipConfig(
                //     wrapType: WrapType.wrap,
                //     backgroundColor: MyColor.white,
                //     labelColor: MyColor.text,
                //     deleteIcon: PhosphorIcon(
                //       PhosphorIcons.xCircle(),
                //       color: MyColor.text,
                //     ),
                //     spacing: 4.0,
                //     runSpacing: 0.0,
                //     radius: 8.0,
                //   ),
                //
                //   // 일반 상태
                //   optionTextStyle: MyTextStyle.descriptionRegular,
                //   optionsBackgroundColor: MyColor.empty,
                //
                //   // 선택된 상태
                //   selectedOptionBackgroundColor: MyColor.lightGrey,
                //   selectedOptionTextColor: Colors.red,
                //   showChipInSingleSelectMode: true,
                //   selectedOptionIcon: PhosphorIcon(
                //     PhosphorIcons.checkCircle(PhosphorIconsStyle.fill),
                //   ),
                //
                //   // 선택된 데이터
                //   selectedOptions: keywords
                //       .mapIndexed((index, element) {
                //         if (user.keywords.contains(element)) {
                //           return ValueItem<int>(
                //             label: element,
                //             value: index,
                //           );
                //         } else {
                //           return const ValueItem<int>(
                //             label: '',
                //             value: -1,
                //           );
                //         }
                //       })
                //       .where((element) => element.value != -1)
                //       .toList(),
                //
                //   // top
                //   borderRadius: 8.0,
                //   borderColor: MyColor.middleGrey,
                //   borderWidth: 1.0,
                //   clearIcon: null,
                //
                //   // bottom
                //   dropdownHeight: 320,
                //   dropdownBorderRadius: 8.0,
                //   focusedBorderColor: MyColor.primary,
                //   focusedBorderWidth: 2.0,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
