import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quentinha_app/core/consts/routes_const.dart';
import '../../presentation/animation/custom_slide_transition.dart';
import 'export_routes.dart';


class AppRoutes {
  static GoRouter router(bool seenOnboarding) {
    return GoRouter(
      initialLocation: seenOnboarding
          ? AppNameRoutes.home
          : AppNameRoutes.onboarding,
      routes: [
        GoRoute(
          path: AppNameRoutes.home,
          name: 'home',
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context, 
            state: state, 
            child: HomePage(),
          ),
        ),
        GoRoute(
          path: AppNameRoutes.planos,
          name: 'planos',
          builder: (context, state) => const PlanosPage(),
        ),
        GoRoute(
          path: AppNameRoutes.pedidos,
          name: 'pedidos',
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context, 
            state: state, 
            child: PedidosPage(),
          ),
        ),
        GoRoute(
          path: AppNameRoutes.perfil,
          name: 'perfil',
          builder: (context, state) => const PerfilPage(),
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
        GoRoute(
          path: AppNameRoutes.forgotPassword,
          name: 'forgot_password',
          builder: (context, state) => const ForgotPasswordPage(),
        ),
      ],
      errorBuilder: (context, state) => Scaffold(
        body: Center(child: Text('Erro: ${state.error}')),
      ),
    );
  }
}
