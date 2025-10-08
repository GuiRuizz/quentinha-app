import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quentinha_app/core/consts/colors_const.dart';
import 'package:quentinha_app/core/consts/routes_const.dart';

class BottomNavBar extends StatelessWidget {
  final String currentRoute;

  const BottomNavBar({super.key, required this.currentRoute});

  int _getSelectedIndex(String route) {
    switch (route) {
      case AppNameRoutes.home:
        return 0;
      case AppNameRoutes.planos:
        return 1;
      case AppNameRoutes.pedidos:
        return 2;
      case AppNameRoutes.perfil:
        return 3;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = _getSelectedIndex(currentRoute);

    return BottomNavigationBar(
      currentIndex: selectedIndex,
      backgroundColor: AppColors.background,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        switch (index) {
          case 0:
            context.push(AppNameRoutes.home);
            break;
          case 1:
            context.push(AppNameRoutes.planos);
            break;
          case 2:
            context.push(AppNameRoutes.pedidos);
            break;
          case 3:
            context.push(AppNameRoutes.perfil);
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Início',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.card_membership),
          label: 'Planos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt_long),
          label: 'Pedidos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
    );
  }
}
