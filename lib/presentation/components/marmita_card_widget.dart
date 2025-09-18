import 'package:flutter/material.dart';
import 'package:quentinha_app/core/consts/colors_const.dart';
import 'package:quentinha_app/core/consts/size_const.dart';
import '../../data/models/marmita_model.dart';

class MarmitaCardWidget extends StatelessWidget {
  final Marmita marmita;
  final String selectedOption;
  final Function(String) onOptionSelected;

  const MarmitaCardWidget({
    super.key,
    required this.marmita,
    required this.selectedOption,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    double preco;
    if (selectedOption == "Pro Dia") {
      preco = marmita.precoDia;
    } else if (selectedOption == "Pra Semana") {
      preco = marmita.precoSemana;
    } else {
      preco = marmita.precoMes;
    }

    return Card(
      elevation: 2,
      color: Colors.white,
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagem ocupa toda a largura, ignorando o padding
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            child: Image.network(
              marmita.imagem,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.grey[300],
                height: 200,
                child: Icon(Icons.error),
              ),
            ),
          ),
          // Conteúdo abaixo da imagem com padding
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  marmita.nome,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                4.h,
                Text(
                  marmita.descricao,
                  style: TextStyle(color: Colors.grey[600]),
                ),
                8.h,
                Text(
                  "R\$ ${preco.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                8.h,
                Wrap(
                  spacing: 8,
                  children: ["Pro Dia", "Pra Semana", "Pro Mês"].map((opcao) {
                    return ChoiceChip(
                      selectedColor: AppColors.primary.withAlpha(20),
                      elevation: 2,
                      side: BorderSide(style: BorderStyle.none),
                      backgroundColor: AppColors.widgetBackgroundGrey,
                      showCheckmark: false,
                      label: Text(opcao),
                      selected: selectedOption == opcao,
                      onSelected: (_) {
                        onOptionSelected(opcao);
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
