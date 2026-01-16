import 'package:flutter/material.dart';
import '../../core/consts/colors_const.dart';

class SaldoCoinsWidget extends StatelessWidget {
  final int saldo;

  const SaldoCoinsWidget({
    super.key,
    required this.saldo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.widgetBackgroundGrey,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          /// Ícone
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.monetization_on,
              color: AppColors.primary,
              size: 28,
            ),
          ),
          const SizedBox(width: 12),

          /// Texto
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Saldo disponível',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 4),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(text: saldo.toString()),
                    const TextSpan(text: ' Quentinha Coins'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
