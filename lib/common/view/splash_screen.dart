import 'package:all_one_food/common/const/image_path.dart';
import 'package:all_one_food/common/layout/default_layout.dart';
import 'package:all_one_food/user/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  static String get routeName => 'splash';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    delay();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImagePath.logo,
              width: MediaQuery.of(context).size.width * 3 / 7,
            ),
          ],
        ),
      ),
    );
  }

  void delay() async {
    await Future.delayed(const Duration(seconds: 1));

    context.goNamed(LoginScreen.routeName);
  }
}
