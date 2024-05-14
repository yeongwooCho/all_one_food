import 'package:all_one_food/common/component/default_button.dart';
import 'package:all_one_food/common/const/text_styles.dart';
import 'package:all_one_food/common/layout/default_layout.dart';
import 'package:all_one_food/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CompletionScreen extends StatelessWidget {
  static String get routeName => 'completion';

  const CompletionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final title = GoRouterState.of(context).pathParameters['title'];

    return DefaultLayout(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 40.0, right: 24.0, left: 24.0),
        child: PrimaryButton(
          onPressed: () async {
            context.goNamed(HomeScreen.routeName);
          },
          child: const Text('홈으로 이동'),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 140.0),
        child: Text(
          title!,
          style: MyTextStyle.headTitle,
        ),
      ),
    );
  }
}
