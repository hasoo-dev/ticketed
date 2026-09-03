import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/view.dart';
import '../../models/quote_model.dart';
import 'routes_name.dart';

class RoutesIo {
  static final router = GoRouter(
    initialLocation: RoutesName.int,
    routes: [
      GoRoute(
        path: RoutesName.int,
        pageBuilder: (context, state) =>
            _buildPage(context, state, const SplashView()),
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
        path: RoutesName.main,
        pageBuilder: (context, state) =>
            _buildPage(context, state, const MainView()),
      ),
      GoRoute(
        path: RoutesName.newQuote,
        pageBuilder: (context, state) {
          final initialQuote = state.extra as QuoteModel?;
          return _buildPage(context, state, NewQuoteView(initialQuote: initialQuote));
        },
      ),
      GoRoute(
        path: RoutesName.quotePreview,
        pageBuilder: (context, state) {
          final quote = state.extra as QuoteModel;
          return _buildPage(context, state, QuotePreviewView(quote: quote));
        },
      ),
      GoRoute(
        path: RoutesName.signQuote,
        pageBuilder: (context, state) {
          final quote = state.extra as QuoteModel;
          return _buildPage(context, state, SignQuoteView(quote: quote));
        },
      ),
      GoRoute(
        path: RoutesName.quoteSuccess,
        pageBuilder: (context, state) {
          final quote = state.extra as QuoteModel;
          return _buildPage(context, state, QuoteSuccessView(quote: quote));
        },
      ),
      GoRoute(
        path: RoutesName.createTemplate,
        pageBuilder: (context, state) =>
            _buildPage(context, state, const CreateTemplateView()),
      ),
      GoRoute(
        path: RoutesName.editQuote,
        pageBuilder: (context, state) {
          final quote = state.extra as QuoteModel;
          return _buildPage(context, state, EditQuoteView(quote: quote));
        },
      ),
      GoRoute(
        path: RoutesName.settings,
        pageBuilder: (context, state) =>
            _buildPage(context, state, const SettingsView()),
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
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
          child: child,
        );
      },
    );
  }
}
