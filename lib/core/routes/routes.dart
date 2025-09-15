import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quentinha_app/core/consts/routes_const.dart';
import 'package:quentinha_app/presentation/view/register_page.dart';

import '../../presentation/view/home_page.dart';
import '../../presentation/view/login_page.dart';
import '../../presentation/view/onboarding_page.dart';

class AppRoutes {
  

  static GoRouter router(bool seenOnboarding) {
    return GoRouter(
      initialLocation: seenOnboarding ? AppNameRoutes.home : AppNameRoutes.onboarding,
      routes: [
        GoRoute(
          path: AppNameRoutes.home,
          name: 'home',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: AppNameRoutes.login,
          name: 'login',
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: AppNameRoutes.onboarding,
          name: 'onboarding',
          builder: (context, state) => const OnboardingPage(),
        ),
        GoRoute(
          path: AppNameRoutes.register,
          name: 'register',
          builder: (context, state) => const RegisterPage(),
        ),
      ],
      errorBuilder: (context, state) => Scaffold(
        body: Center(child: Text('Erro: ${state.error}')),
      ),
    );
  }
}
