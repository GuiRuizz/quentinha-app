import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quentinha_app/core/consts/routes_const.dart';
import 'package:quentinha_app/core/consts/size_const.dart';
import '../../core/consts/colors_const.dart';
import 'saldo_coins_widget.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            /// Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  24.h,
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 32, color: Colors.black),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Olá, Guilherme!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Bem-vindo ao Quentinha App',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),

            16.h,

            /// Itens do menu
            _drawerItem(Icons.design_services, 'Personalizar Plano', () {}),
            _drawerItem(Icons.receipt_long, 'Meus Pedidos', () {
              context.go(AppNameRoutes.pedidos);
            }),
            _drawerItem(Icons.workspace_premium, 'Quentinha Coins', () {}),
            _drawerItem(Icons.settings, 'Configurações', () {}),
            _drawerItem(Icons.help_outline, 'Ajuda', () {}),

            const Spacer(),
            SaldoCoinsWidget(saldo: 120),

            /// Logout
            const Divider(),
            16.h,
            _drawerItem(Icons.logout, 'Sair', () {
              context.go(AppNameRoutes.login);
              //TODO: Implementar lógica de logout
            }),
            16.h,
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(title),
      onTap: onTap,
    );
  }
}

