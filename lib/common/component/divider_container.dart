import 'package:all_one_food/common/const/colors.dart';
import 'package:flutter/material.dart';

class DividerContainer extends StatelessWidget {
  const DividerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.0,
      color: MyColor.lightGrey,
    );
  }
}
