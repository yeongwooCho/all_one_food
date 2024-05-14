import 'package:all_one_food/all_one_food/view/all_one_food_screen.dart';
import 'package:all_one_food/common/const/colors.dart';
import 'package:all_one_food/common/const/text_styles.dart';
import 'package:all_one_food/common/layout/default_layout.dart';
import 'package:all_one_food/common/view/error_screen.dart';
import 'package:all_one_food/home/view/home_screen.dart';
import 'package:all_one_food/product/view/product_screen.dart';
import 'package:all_one_food/profile/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class RootTab extends StatelessWidget {
  final Widget child;

  const RootTab({
    super.key,
    required this.child,
  });

  int getIndex(BuildContext context) {
    switch (GoRouterState.of(context).location) {
      case '/home':
        return 0;
      case '/all_one_food':
        return 1;
      case '/product':
        return 2;
      case '/profile':
        return 3;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        backgroundColor: MyColor.white,
        selectedItemColor: MyColor.text,
        selectedLabelStyle: MyTextStyle.bodyBold.copyWith(fontSize: 12.0),
        unselectedItemColor: MyColor.middleGrey,
        unselectedFontSize: 12.0,
        unselectedLabelStyle: MyTextStyle.bodyBold.copyWith(fontSize: 12.0),
        type: BottomNavigationBarType.fixed,
        currentIndex: getIndex(context),
        onTap: (int index) {
          switch (index) {
            case 0:
              context.goNamed(HomeScreen.routeName);
            case 1:
              context.goNamed(AllOneFoodScreen.routeName);
            case 2:
              context.goNamed(ProductScreen.routeName);
            case 3:
              context.goNamed(ProfileScreen.routeName);
            default:
              context.goNamed(ErrorScreen.routeName);
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: PhosphorIcon(
              PhosphorIcons.house(),
              size: 30.0,
            ),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: PhosphorIcon(
              PhosphorIcons.users(),
              size: 30.0,
            ),
            label: 'All One Food',
          ),
          BottomNavigationBarItem(
            icon: PhosphorIcon(
              PhosphorIcons.gift(),
              size: 30.0,
            ),
            label: '상품',
          ),
          BottomNavigationBarItem(
            icon: PhosphorIcon(
              PhosphorIcons.user(),
              size: 30.0,
            ),
            label: '내 정보',
          ),
        ],
      ),
      child: child,
    );
  }
}
