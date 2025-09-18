import 'package:flutter/material.dart';
import 'package:quentinha_app/core/consts/colors_const.dart';
import 'package:quentinha_app/core/consts/size_const.dart';

class CustomSnackBar {
  /// Exibe diretamente a snackbar customizada
  static void show(
    BuildContext context, {
    required String message,
    Color backgroundColor = Colors.black87,
    IconData? icon,
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: Colors.white),
              8.h,
            ],
            Expanded(child: Text(message)),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: backgroundColor,
        duration: duration,
      ),
    );
  }

  /// Exibe um loading por [delay], depois mostra a snackbar
  static Future<void> showWithLoading(
    BuildContext context, {
    required String message,
    Color backgroundColor = Colors.black87,
    IconData? icon,
    Duration duration = const Duration(seconds: 3),
    Duration delay = const Duration(seconds: 2),
  }) async {
  
    // Exibe loading
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) =>
          Center(child: CircularProgressIndicator(color: AppColors.primary)),
    );

    // Aguarda
    await Future.delayed(delay);

    // Fecha loading com rootNavigator
    Navigator.of(context, rootNavigator: true).pop();

    // Mostra snackbar
    show(
      context,
      message: message,
      backgroundColor: backgroundColor,
      icon: icon,
      duration: duration,
    );
  }
}
