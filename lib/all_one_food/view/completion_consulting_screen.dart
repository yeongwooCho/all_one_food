import 'package:all_one_food/common/layout/default_app_bar.dart';
import 'package:all_one_food/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class CompletionConsultingScreen extends StatelessWidget {
  static String get routeName => 'completion_consulting';

  const CompletionConsultingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: DefaultAppBar(title: 'dsaf'),
      child: Column(
        children: [
          const Placeholder(),
        ],
      ),
    );
  }
}
