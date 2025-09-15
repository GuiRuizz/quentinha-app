import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:quentinha_app/core/consts/colors_const.dart';
import 'package:quentinha_app/core/consts/routes_const.dart';
import 'package:quentinha_app/core/consts/size_const.dart';

import '../../core/log/logger.dart';

class RegisterLoginPage extends StatelessWidget {
  const RegisterLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo ou título
            const Text(
              "🍲 Sua marmita quentinha,\n toda semana na sua porta!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            20.h,
            Text(
              "Não perca tempo! Registre-se ou faça login para começar a pedir suas refeições favoritas.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: AppColors.textSecondary),
            ),

            40.h,

            // Botão Google
            ElevatedButton.icon(
              onPressed: () {
                // TODO: implementar login Google
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(color: Colors.grey),
                ),
              ),
              icon: SvgPicture.network(
                "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/google/google-original.svg",
                height: 24,
              ),
              label: const Text("Registrar com Google"),
            ),

            16.h,

            // Botão Apple
            ElevatedButton.icon(
              onPressed: () {
                // TODO: implementar login Apple
              },
              style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: SvgPicture.network(
                "https://cdn.jsdelivr.net/npm/simple-icons@v3/icons/apple.svg",
                height: 24,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
              label: const Text("Registrar com Apple"),
            ),

            16.h,

            // Botão Email
            ElevatedButton.icon(
              onPressed: () {
                // TODO: implementar login por Email
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.email_outlined),
              label: const Text("Registrar com Email"),
            ),

            30.h,

            // Texto rodapé
            TextButton(
              onPressed: () {
                context.go(AppNameRoutes.login);
                AppLogger.i("Navegar para login");
              },
              child: const Text(
                "Já tem conta? Entrar",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
