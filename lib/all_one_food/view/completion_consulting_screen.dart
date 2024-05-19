import 'package:all_one_food/common/component/default_button.dart';
import 'package:all_one_food/common/const/text_styles.dart';
import 'package:all_one_food/common/layout/default_app_bar.dart';
import 'package:all_one_food/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class CompletionConsultingScreen extends StatelessWidget {
  static String get routeName => 'completion_consulting';

  const CompletionConsultingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: 'dsaf'),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _renderTitleAndDescription(
              title: '리포팅',
              description:
                  '동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 ',
            ),
            _renderTitleAndDescription(
              title: '리포팅',
              description:
                  '동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 ',
            ),
            _renderTitleAndDescription(
              title: '리포팅',
              description:
                  '동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 ',
            ),
            _renderTitleAndDescription(
              title: '리포팅',
              description:
                  '동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 ',
            ),
            _renderTitleAndDescription(
              title: '리포팅',
              description:
                  '동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 ',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
              child: PrimaryButton(
                onPressed: () {},
                child: const Text('전문가 상담 요청'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderTitleAndDescription({
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: MyTextStyle.bodyTitleMedium,
          ),
          const SizedBox(height: 8.0),
          Text(
            description,
            style: MyTextStyle.descriptionRegular,
          ),
        ],
      ),
    );
  }
}
