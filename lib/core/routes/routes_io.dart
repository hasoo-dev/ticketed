import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/view.dart';
import 'routes_name.dart';

class RoutesIo {
  static final router = GoRouter(
    initialLocation: RoutesName.int,
    routes: [
      GoRoute(
        path: RoutesName.int,
        pageBuilder: (context, state) =>
            _buildPage(context, state, SplashView()),
      ),
      GoRoute(
        path: RoutesName.auth,
        pageBuilder: (context, state) =>
            _buildPage(context, state, const AuthView()),
      ),
      GoRoute(
        path: RoutesName.signUp,
        pageBuilder: (context, state) =>
            _buildPage(context, state, const SignUpView()),
      ),
      GoRoute(
        path: RoutesName.forgetPassword,
        pageBuilder: (context, state) =>
            _buildPage(context, state, const ForgetPasswordView()),
      ),
      GoRoute(
        path: RoutesName.trade,
        pageBuilder: (context, state) =>
            _buildPage(context, state, const TradeView()),
      ),
      GoRoute(
        path: RoutesName.home,
        pageBuilder: (context, state) =>
            _buildPage(context, state, const HomeView()),
      ),
    ],
  );

  static CustomTransitionPage _buildPage(
    BuildContext context,
    GoRouterState state,
    Widget page,
  ) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Slide transition
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
        // Add more transition types here if needed
      },
    );
  }
}
