import 'package:all_one_food/common/const/colors.dart';
import 'package:all_one_food/common/const/text_styles.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SingleDropDown extends StatelessWidget {
  final List<String> dropdownList;
  final String hintText;
  final ValueChanged<String> onChanged;

  const SingleDropDown({
    super.key,
    required this.dropdownList,
    required this.hintText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return MultiSelectDropDown<int>(
      // type
      selectionType: SelectionType.single,
      hint: hintText,
      hintStyle: MyTextStyle.descriptionRegular,
      // 선택 했을 때 동작
      onOptionSelected: (List<ValueItem> selectedOptions) {
        onChanged(selectedOptions.first.label);
      },

      options: dropdownList.mapIndexed((index, element) {
        return ValueItem<int>(
          label: element,
          value: index,
        );
      }).toList(),

      chipConfig: const ChipConfig(wrapType: WrapType.wrap),

      // 일반 상태
      optionTextStyle: MyTextStyle.descriptionRegular,
      optionsBackgroundColor: MyColor.empty,

      // 선택된 상태
      singleSelectItemStyle: MyTextStyle.descriptionRegular,
      selectedOptionBackgroundColor: MyColor.lightGrey,
      selectedOptionTextColor: Colors.red,
      selectedOptionIcon: PhosphorIcon(
        PhosphorIcons.checkCircle(PhosphorIconsStyle.fill),
      ),

      // form style
      borderRadius: 8.0,
      borderColor: MyColor.middleGrey,
      borderWidth: 1.0,
      clearIcon: null,

      // dropdown style
      dropdownHeight: 220,
      dropdownBorderRadius: 8.0,
      focusedBorderColor: MyColor.primary,
      focusedBorderWidth: 2.0,

      // // 선택된 데이터
      // selectedOptions: [
      //   ValueItem(label: '선택', value: 0),
      // ],
      // disabledOptions: [
      //   ValueItem(label: '선택', value: 0),
      // ],
    );
  }
}
