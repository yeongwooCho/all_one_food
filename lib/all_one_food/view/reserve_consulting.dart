import 'package:all_one_food/common/layout/default_app_bar.dart';
import 'package:all_one_food/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class ReserveConsultingScreen extends StatelessWidget {
  static String get routeName => 'reserve_consulting';

  const ReserveConsultingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: DefaultAppBar(title: '상담 예약'),
      child: Column(
        children: [
          const Placeholder(),
        ],
      ),
    );
  }
}
