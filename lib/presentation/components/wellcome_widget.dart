import 'package:flutter/material.dart';
import 'package:quentinha_app/core/consts/size_const.dart';

import '../../core/consts/colors_const.dart';

class WellcomeWidget extends StatelessWidget {
  const WellcomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Text(
            "Seu app de marmitas saudável e saborosas!",
            style: TextStyle(
              fontSize: 16,
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        20.h,
    
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Text(
            "Seja para matar a fome em um momento corrido ou para garantir praticidade o mês inteiro, temos o plano certo para você.",
            style: TextStyle(
              fontSize: 16,
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        10.h,
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Text(
            "Flexibilidade, sabor e entrega garantida, do jeito que sua rotina precisa.",
            style: TextStyle(
              fontSize: 16,
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}