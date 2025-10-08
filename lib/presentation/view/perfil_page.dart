import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quentinha_app/core/consts/colors_const.dart';
import 'package:quentinha_app/core/consts/size_const.dart';

import '../../core/consts/routes_const.dart';
import '../components/bottom_nav_bar_widget.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.toString();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          'Perfil',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/user_placeholder.png'),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade300,
                    ),
                    padding: const EdgeInsets.all(6),
                    child: const Icon(
                      Icons.camera_alt,
                      size: 20,
                    ),
                  ),
                ],
              ),
              16.h,
        
             
              const Text(
                '{Nome do usuário}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              8.h,
              const Text(
                '{+55 (12) 99999-9999}',
                style: TextStyle(color: Colors.black54),
              ),
        
              const SizedBox(height: 24),
              const Divider(),
        
              ListTile(
                leading: const Icon(Icons.key),
                title: const Text('Conta'),
                subtitle: const Text('Privacidade, segurança, mudança de número'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.lock),
                title: const Text('Privacidade'),
                subtitle: const Text('Bloqueios, status, confirmação de leitura'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.notifications),
                title: const Text('Notificações'),
                subtitle: const Text('Sons de mensagens e chamadas'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.help_outline),
                title: const Text('Ajuda'),
                subtitle: const Text('Central de ajuda, contato e termos'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('Sobre'),
                subtitle: const Text('Versão do aplicativo e informações'),
                onTap: () {},
              ),
        
              16.h,
              const Divider(),
        
             
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.redAccent),
                title: const Text(
                  'Sair',
                  style: TextStyle(color: Colors.redAccent),
                ),
                onTap: () {
                  context.go(AppNameRoutes.login);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentRoute: currentRoute),
    );
  }
}
