import 'package:all_one_food/all_one_food/view/all_one_food_screen.dart';
import 'package:all_one_food/common/component/default_button.dart';
import 'package:all_one_food/common/const/colors.dart';
import 'package:all_one_food/common/const/data.dart';
import 'package:all_one_food/common/const/text_styles.dart';
import 'package:all_one_food/common/layout/default_app_bar.dart';
import 'package:all_one_food/common/layout/default_layout.dart';
import 'package:all_one_food/product/provider/category_provider.dart';
import 'package:all_one_food/product/view/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static String get routeName => "home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: 'All One Food'),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'asset/img/banner/banner.png',
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
              child: PrimaryButton(
                onPressed: () {
                  context.goNamed(AllOneFoodScreen.routeName);
                },
                child: const Text('컨설팅 진행하기'),
              ),
            ),
            _CategoryContainer(),
            _ServiceInfoContainer(),
            _Footer(),
          ],
        ),
      ),
    );
  }
}

class _CategoryContainer extends ConsumerWidget {
  const _CategoryContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoriesProvider);

    const double spacing = 12.0;
    const double horizontalPadding = 24.0;
    const double itemHorizontalPadding = 16.0;

    final itemWidth = (MediaQuery.of(context).size.width -
            (spacing * 3) -
            (horizontalPadding * 2)) /
        4;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Wrap(
        runSpacing: spacing,
        spacing: spacing,
        children: List.generate(
          categories.length - 1,
          (index) => InkWell(
            onTap: () {
              ref
                  .read(categorySelectedProvider.notifier)
                  .update((state) => categories[index + 1]);
              context.goNamed(ProductScreen.routeName);
            },
            child: Container(
              decoration: BoxDecoration(
                color: MyColor.notice,
                borderRadius: BorderRadius.circular(8.0),
              ),
              width: itemWidth,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Column(
                  children: [
                    Image.asset(
                      'asset/img/category/$index.png',
                      width: itemWidth - itemHorizontalPadding * 2,
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      categories[index + 1],
                      style: MyTextStyle.descriptionRegular,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ServiceInfoContainer extends StatelessWidget {
  const _ServiceInfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            '서비스 소개 이미지',
            style: MyTextStyle.bigTitleBold,
          ),
          const SizedBox(height: 8.0),
          Container(
            color: Colors.blue,
            height: 427.0,
          ),
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColor.lightGrey,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            final title = footerData[index];

            return Text(
              title,
              style: (index == 0)
                  ? MyTextStyle.minimumRegular.copyWith(
                      fontWeight: FontWeight.bold,
                      color: MyColor.darkGrey,
                    )
                  : MyTextStyle.minimumRegular.copyWith(
                      color: MyColor.darkGrey,
                    ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 4.0);
          },
          itemCount: footerData.length,
        ),
      ),
    );
  }
}
