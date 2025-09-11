import 'package:flutter/material.dart';
import 'package:quentinha_app/core/consts/colors_const.dart';
import 'package:quentinha_app/core/consts/prices_const.dart';

class PricingTable extends StatelessWidget {
  const PricingTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
      columnWidths: const {
        0: FlexColumnWidth(3),
        1: FlexColumnWidth(2),
        2: FlexColumnWidth(2),
        3: FlexColumnWidth(2),
      },
      children: [
        // Cabeçalho
        TableRow(
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Tipo",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Valor Unitário",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Semanal",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Mensal",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),

        // Mamrita tradicional
        TableRow(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Tradicional 🍛"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "R\$ ${PricesConst.marmitaTradicional.toStringAsFixed(2)}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "R\$ ${(PricesConst.marmitaTradicional * PricesConst.mealsPerWeek).toStringAsFixed(2)}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "R\$ ${(PricesConst.marmitaTradicional * PricesConst.weeksPerMonth).toStringAsFixed(2)}",
              ),
            ),
          ],
        ),

        // Mamrita fitness
        TableRow(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Fitness 🥗"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "R\$ ${PricesConst.marmitaFitness.toStringAsFixed(2)}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "R\$ ${(PricesConst.marmitaFitness * PricesConst.mealsPerWeek).toStringAsFixed(2)}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "R\$ ${(PricesConst.marmitaFitness * PricesConst.weeksPerMonth).toStringAsFixed(2)}",
              ),
            ),
          ],
        ),
        // Mamrita prato do dia
        TableRow(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Do dia 🍲"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("R\$ ${PricesConst.pratoDoDia.toStringAsFixed(2)}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "R\$ ${(PricesConst.pratoDoDia * PricesConst.mealsPerWeek).toStringAsFixed(2)}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "R\$ ${(PricesConst.pratoDoDia * PricesConst.weeksPerMonth).toStringAsFixed(2)}",
              ),
            ),
          ],
        ),

        // Mamrita personalizada
        TableRow(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Personalizada 🍽️"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("R\$ ${PricesConst.marmitaPersonalizada.toStringAsFixed(2)}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "R\$ ${(PricesConst.marmitaPersonalizada * PricesConst.mealsPerWeek).toStringAsFixed(2)}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "R\$ ${(PricesConst.marmitaPersonalizada * PricesConst.weeksPerMonth).toStringAsFixed(2)}",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
