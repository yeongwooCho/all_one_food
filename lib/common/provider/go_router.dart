import 'package:all_one_food/all_one_food/view/all_one_food_screen.dart';
import 'package:all_one_food/all_one_food/view/request_consulting_screen.dart';
import 'package:all_one_food/common/view/completion_screen.dart';
import 'package:all_one_food/common/view/error_screen.dart';
import 'package:all_one_food/common/view/root_tab.dart';
import 'package:all_one_food/common/view/splash_screen.dart';
import 'package:all_one_food/home/view/home_screen.dart';
import 'package:all_one_food/product/view/product_detail_screen.dart';
import 'package:all_one_food/product/view/product_screen.dart';
import 'package:all_one_food/profile/view/profile_screen.dart';
import 'package:all_one_food/user/view/certification_screen.dart';
import 'package:all_one_food/user/view/custom_sns_screen.dart';
import 'package:all_one_food/user/view/email_login_screen.dart';
import 'package:all_one_food/user/view/input_info_screen.dart';
import 'package:all_one_food/user/view/login_screen.dart';
import 'package:all_one_food/user/view/term_detail_screen.dart';
import 'package:all_one_food/user/view/term_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  redirect: null,
  initialLocation: '/splash',
  routes: routes,
  errorBuilder: (context, state) => ErrorScreen(
    error: state.error.toString(),
  ),
  debugLogDiagnostics: true,
);

List<RouteBase> get routes => [
      GoRoute(
        path: '/splash',
        name: SplashScreen.routeName,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: '/completion/:title',
        name: CompletionScreen.routeName,
        builder: (context, state) => CompletionScreen(),
      ),
      GoRoute(
        path: '/sns/:title',
        name: CustomSnsScreen.routeName,
        builder: (context, state) => CustomSnsScreen(),
      ),
      GoRoute(
        path: '/login',
        name: LoginScreen.routeName,
        builder: (context, state) => LoginScreen(),
        routes: [
          GoRoute(
            path: 'email_login',
            name: EmailLoginScreen.routeName,
            builder: (context, state) => EmailLoginScreen(),
            routes: [
              GoRoute(
                path: 'term',
                name: TermScreen.routeName,
                builder: (context, state) => TermScreen(),
                routes: [
                  GoRoute(
                    path: 'detail/:id',
                    name: TermDetailScreen.routeName,
                    builder: (context, state) => TermDetailScreen(),
                  ),
                ],
              ),
              GoRoute(
                path: 'certification',
                name: CertificationScreen.routeName,
                builder: (context, state) => CertificationScreen(),
                routes: [
                  GoRoute(
                    path: 'input_info',
                    name: InputInfoScreen.routeName,
                    builder: (context, state) => InputInfoScreen(),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return RootTab(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            name: HomeScreen.routeName,
            builder: (context, state) => HomeScreen(),
          ),
          GoRoute(
            path: '/all_one_food',
            name: AllOneFoodScreen.routeName,
            builder: (context, state) => AllOneFoodScreen(),
            routes: [
              GoRoute(
                parentNavigatorKey: _rootNavigatorKey,
                path: 'request_consulting',
                name: RequestConsultingScreen.routeName,
                builder: (context, state) => RequestConsultingScreen(),
              ),
            ],
          ),
          GoRoute(
            path: '/product',
            name: ProductScreen.routeName,
            builder: (context, state) => ProductScreen(),
            routes: [
              GoRoute(
                parentNavigatorKey: _rootNavigatorKey,
                path: ':id',
                name: ProductDetailScreen.routeName,
                builder: (context, state) {
                  final productId =
                      GoRouterState.of(context).pathParameters['id'];

                  return ProductDetailScreen(id: int.parse(productId!));
                },
              ),
            ],
          ),
          GoRoute(
            path: '/profile',
            name: ProfileScreen.routeName,
            builder: (context, state) => ProfileScreen(),
          ),
        ],
      ),
      // GoRoute(
      //   parentNavigatorKey: _rootNavigatorKey,
      //   path: '/notification',
      //   name: NotificationScreen.routeName,
      //   builder: (_, state) => NotificationScreen(),
      //   routes: [
      //     GoRoute(
      //       parentNavigatorKey: _rootNavigatorKey,
      //       path: ':id',
      //       name: NotificationDetailScreen.routeName,
      //       builder: (_, state) => NotificationDetailScreen(
      //         id: state.pathParameters['id']!,
      //       ),
      //     )
      //   ],
      // ),
    ];
