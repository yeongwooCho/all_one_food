import 'package:all_one_food/common/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomLoadingScreen extends StatelessWidget {
  const CustomLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.empty,
      body: Center(
        child: LoadingAnimationWidget.discreteCircle(
          color: MyColor.darkGrey,
          secondRingColor: MyColor.middleGrey,
          thirdRingColor: MyColor.lightGrey,
          size: 80,
        ),
      ),
    );
  }
}
