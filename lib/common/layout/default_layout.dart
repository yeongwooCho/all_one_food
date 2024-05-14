import 'package:all_one_food/common/component/custom_loading.dart';
import 'package:all_one_food/common/const/colors.dart';
import 'package:all_one_food/common/provider/global_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DefaultLayout extends ConsumerWidget {
  final Color? backgroundColor;
  final PreferredSizeWidget? appbar;
  final Widget? bottomNavigationBar;
  final FloatingActionButton? floatingActionButton;
  final Widget child;

  const DefaultLayout({
    super.key,
    this.backgroundColor,
    this.appbar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(isLoadingProvider);

    return Stack(
      children: [
        Scaffold(
          appBar: appbar,
          backgroundColor: backgroundColor ?? MyColor.white,
          // 기본배경이 완전 흰색은 아니다.
          body: SafeArea(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: child,
            ),
          ),
          bottomNavigationBar: bottomNavigationBar,
          floatingActionButton: floatingActionButton,
        ),
        Positioned.fill(
          child: Visibility(
            visible: isLoading,
            child: const Center(
              child: CustomLoadingScreen(),
            ),
          ),
        )
      ],
    );
  }
}
