import 'package:flutter/material.dart';
import 'package:flutter_go_router/screens/cart_screen.dart';
import 'package:flutter_go_router/screens/details_screen.dart';
import 'package:flutter_go_router/screens/error_screen.dart';
import 'package:flutter_go_router/screens/home_screen.dart';
import 'package:flutter_go_router/screens/product_screen.dart';
import 'package:flutter_go_router/screens/profile_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: "/",
    routes: [
      GoRoute(
        name: 'home',
        path: "/",
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            name: "profile",
            path: "/profile/:userId/:username",
            builder: (context, state) => ProfileScreen(
              userId: int.parse(state.pathParameters['userId'] ?? ""),
              userName: state.pathParameters['username'] ?? "",
            ),
          ),
        ],
      ),
      GoRoute(
        path: "/product/:productName",
        builder: (context, state) => ProductScreen(
          productName: state.pathParameters['productName'] ?? "",
        ),
        routes: [
          GoRoute(
            path: "/cart",
            builder: (context, state) => CartScreen(
              productName: state.pathParameters['productName'] ?? "",
            ),
          ),
        ],
      ),
      // GoRoute(
      //   path: "/details/:productId/:productPrice/:productName",
      //   builder: (context, state) {
      //     final String productId = state.pathParameters['productId'] ?? "";
      //     final String productName = state.pathParameters['productName'] ?? "";
      //     final String productPrice =
      //         state.pathParameters['productPrice'] ?? "";
      //     return DetailsScreen(
      //       productId: int.parse(productId),
      //       productName: productName,
      //       productPrice: double.parse(productPrice),
      //     );
      //   },
      // ),

      GoRoute(
        path: "/details/:productId/:productName/:productPrice",
        pageBuilder: (context, state) {
          String productId = state.pathParameters['productId'] ?? '';
          String productName = state.pathParameters['productName'] ?? '';
          String price = state.pathParameters['productPrice'] ?? '';
          return CustomTransitionPage(
            key: state.pageKey,
            child: DetailsScreen(
              productId: int.parse(productId),
              productName: productName,
              productPrice: double.parse(price),
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1, 0);
              const end = Offset.zero;
              const curve = Curves.linear;

              var tween = Tween(begin: begin, end: end).chain(
                CurveTween(curve: curve),
              );

              var offsetAnimation = animation.drive(tween);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
            transitionDuration: const Duration(seconds: 1),
          );
        },
      )
    ],
    errorBuilder: (context, state) {
      return ErrorScreen(error: state.error);
    },
  );
}
