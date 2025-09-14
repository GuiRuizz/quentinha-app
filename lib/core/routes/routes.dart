import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/view/home_page.dart';
import '../../presentation/view/login_page.dart';
import '../../presentation/view/onboarding_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String login = '/login';
  static const String onboarding = '/onboarding';

  static GoRouter router(bool seenOnboarding) {
    return GoRouter(
      initialLocation: seenOnboarding ? home : onboarding,
      routes: [
        GoRoute(
          path: home,
          name: 'home',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: login,
          name: 'login',
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: onboarding,
          name: 'onboarding',
          builder: (context, state) => const OnboardingPage(),
        ),
      ],
      errorBuilder: (context, state) => Scaffold(
        body: Center(child: Text('Erro: ${state.error}')),
      ),
    );
  }
}
