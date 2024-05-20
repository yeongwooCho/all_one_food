import 'package:all_one_food/all_one_food/view/all_one_food_screen.dart';
import 'package:all_one_food/all_one_food/view/completion_consulting_screen.dart';
import 'package:all_one_food/all_one_food/view/request_consulting_screen.dart';
import 'package:all_one_food/all_one_food/view/reserve_consulting.dart';
import 'package:all_one_food/cart/view/cart_screen.dart';
import 'package:all_one_food/common/view/completion_screen.dart';
import 'package:all_one_food/common/view/error_screen.dart';
import 'package:all_one_food/common/view/root_tab.dart';
import 'package:all_one_food/common/view/splash_screen.dart';
import 'package:all_one_food/home/view/home_screen.dart';
import 'package:all_one_food/order/view/create_order_screen.dart';
import 'package:all_one_food/order/view/order_detail_screen.dart';
import 'package:all_one_food/order/view/order_list_screen.dart';
import 'package:all_one_food/product/view/product_detail_screen.dart';
import 'package:all_one_food/product/view/product_screen.dart';
import 'package:all_one_food/profile/view/edit_profile_screen.dart';
import 'package:all_one_food/profile/view/profile_screen.dart';
import 'package:all_one_food/user/view/certification_screen.dart';
import 'package:all_one_food/user/view/custom_sns_screen.dart';
import 'package:all_one_food/user/view/email_login_screen.dart';
import 'package:all_one_food/user/view/find_id_screen.dart';
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
        path: '/completion/:title/:button_text/:to_route',
        name: CompletionScreen.routeName,
        builder: (context, state) {
          final parameters = GoRouterState.of(context).pathParameters;

          return CompletionScreen(
            title: parameters['title']!,
            buttonText: parameters['button_text'],
            toRouteName: parameters['to_route'],
          );
        },
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
              GoRoute(
                path: 'find_id',
                name: FindIdScreen.routeName,
                builder: (context, state) => FindIdScreen(),
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
                routes: [
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: 'completion',
                    name: CompletionConsultingScreen.routeName,
                    builder: (context, state) => CompletionConsultingScreen(),
                      routes: [
                        GoRoute(
                          parentNavigatorKey: _rootNavigatorKey,
                          path: 'reserve',
                          name: ReserveConsultingScreen.routeName,
                          builder: (context, state) => ReserveConsultingScreen(),
                        )
                      ],
                    ),
                  ]),
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
            routes: [
              GoRoute(
                parentNavigatorKey: _rootNavigatorKey,
                path: 'edit',
                name: EditProfileScreen.routeName,
                builder: (context, state) => EditProfileScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/cart',
        name: CartScreen.routeName,
        builder: (context, state) => CartScreen(),
        routes: [
          GoRoute(
            parentNavigatorKey: _rootNavigatorKey,
            path: 'create_order',
            name: CreateOrderScreen.routeName,
            builder: (context, state) => CreateOrderScreen(),
          ),
        ],
      ),

      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/order_list',
        name: OrderListScreen.routeName,
        builder: (context, state) => OrderListScreen(),
        routes: [
          GoRoute(
            parentNavigatorKey: _rootNavigatorKey,
            path: ':id',
            name: OrderDetailScreen.routeName,
            builder: (context, state) {
              String id = state.pathParameters['id']!;
              return OrderDetailScreen(id: id);
            },
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
