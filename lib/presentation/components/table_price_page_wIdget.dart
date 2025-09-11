import 'package:flutter/material.dart';
import 'package:quentinha_app/core/consts/size_const.dart';

import '../../core/consts/colors_const.dart';
import 'table_price_widget.dart';

class TablePricePageWIdget extends StatelessWidget {
  const TablePricePageWIdget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Column(
            children: [
              Icon(
                Icons.timelapse,
                size: 120,
                color: AppColors.primary,
              ),
              20.h,
              Text(
                "Planejamento e economia",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Text(
          "Monte seus planos semanais ou mensais com praticidade.",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.textSecondary,
          ),
        ),
        20.h,
        TablePriceWidget(),
      ],
    );
  }
}
