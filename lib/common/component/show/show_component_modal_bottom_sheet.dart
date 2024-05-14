import 'package:all_one_food/common/const/colors.dart';
import 'package:flutter/material.dart';

void showCustomModalBottomSheet({
  required BuildContext context,
  required Widget bottomSheetWidget,
}) {
  showModalBottomSheet(
    useSafeArea: true,
    isDismissible: true,
    isScrollControlled: true,
    context: context,
    barrierColor: MyColor.barrier,
    backgroundColor: MyColor.empty,
    builder: (_) {
      return bottomSheetWidget;
    },
  );
}
