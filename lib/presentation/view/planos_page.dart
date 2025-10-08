import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/consts/routes_const.dart';
import '../components/bottom_nav_bar_widget.dart';
class PlanosPage extends StatefulWidget {
  const PlanosPage({super.key});

  @override
  State<PlanosPage> createState() => _PlanosPageState();
}

class _PlanosPageState extends State<PlanosPage> {
  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.toString();
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop){
          context.go(AppNameRoutes.home);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavBar(currentRoute: currentRoute),
      ),
    );
  }
}
