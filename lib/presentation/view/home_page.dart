import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quentinha_app/core/consts/colors_const.dart';
import 'package:quentinha_app/core/consts/size_const.dart';
import 'package:quentinha_app/presentation/components/drawer_widget.dart';
import '../../core/utils/date_time_utils.dart';
import '../../data/models/marmita_model.dart';
import '../components/app_bar_widget.dart';
import '../components/bottom_nav_bar_widget.dart';
import '../components/marmita_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> categories = [
    {'label': 'Todas', 'icon': Icons.fastfood},
    {'label': 'Categoria 2', 'icon': Icons.food_bank},
    {'label': 'Categoria 3', 'icon': Icons.health_and_safety},
    {'label': 'Categoria 4', 'icon': Icons.attach_money_outlined},
    {'label': 'Categoria 5', 'icon': Icons.local_activity},
  ];

  final List<Marmita> marmitas = [
    Marmita(
      nome: "Marmita Fit",
      descricao: "Arroz, feijão, ovo e salada",
      imagem: "https://picsum.photos/600/400",
      precoDia: 15.0,
      precoSemana: 90.0,
      precoMes: 350.0,
    ),
    Marmita(
      nome: "Marmita Tradicional",
      descricao: "Arroz, feijão, frango e legumes",
      imagem: "https://picsum.photos/600/400",
      precoDia: 18.0,
      precoSemana: 110.0,
      precoMes: 400.0,
    ),
    Marmita(
      nome: "Marmita Tradicional",
      descricao: "Arroz, feijão, frango e legumes",
      imagem: "https://picsum.photos/600/400",
      precoDia: 18.0,
      precoSemana: 110.0,
      precoMes: 400.0,
    ),
  ];

  Map<int, String> selectedOptions = {};
  String selectedCategory = 'Todas';
  @override
  Widget build(BuildContext context) {
    final double leftPadding = 16.0;
    final currentRoute = GoRouterState.of(context).uri.toString();
    return Scaffold(
      drawer: const AppDrawer(),
      backgroundColor: AppColors.background,
      bottomNavigationBar: BottomNavBar(currentRoute: currentRoute),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: leftPadding),
              child: AppBarPersonalizada(),
            ),
            20.h,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: leftPadding),
                      child: Text(
                        'Olá Guilherme, ${DateUtilsHelper.saudacao()}!', //TODO: Colocar o nome dinamicamente
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    20.h,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: leftPadding),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Pesquisar',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: AppColors.widgetBackgroundGrey,
                        ),
                      ),
                    ),
                    40.h,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: leftPadding),
                      child: Row(
                        children: [
                          Text(
                            'Categorias',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'Ver tudo',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    20.h,
                    SizedBox(
                      height: 70,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(
                          left: leftPadding,
                          right: leftPadding,
                        ),
                        separatorBuilder: (_, __) => 10.w,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          final cat = categories[index];
                          final isSelected = selectedCategory == cat['label'];
                
                          return ChoiceChip(
                            visualDensity: VisualDensity(
                              horizontal: 2,
                              vertical: 2,
                            ),
                            elevation: 2,
                            side: BorderSide(style: BorderStyle.none),
                            avatar: isSelected
                                ? Icon(
                                    cat['icon'],
                                    size: 20,
                                    color: AppColors.primary,
                                  )
                                : Icon(
                                    cat['icon'],
                                    size: 20,
                                    color: Colors.black,
                                  ),
                            label: Text(cat['label']),
                            labelPadding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            showCheckmark: false,
                            selected: isSelected,
                            selectedColor: AppColors.primary.withAlpha(20),
                            backgroundColor: AppColors.widgetBackgroundGrey,
                            labelStyle: TextStyle(
                              color: isSelected
                                  ? AppColors.primary
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            onSelected: (_) {
                              setState(() {
                                selectedCategory = cat['label'];
                              });
                            },
                          );
                        },
                      ),
                    ),
                    20.h,
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: marmitas.length,
                      itemBuilder: (context, index) {
                        final marmita = marmitas[index];
                        final selectedOption =
                            selectedOptions[index] ?? "Pro Dia";
                
                        return MarmitaCardWidget(
                          marmita: marmita,
                          selectedOption: selectedOption,
                          onOptionSelected: (opcao) {
                            setState(() {
                              selectedOptions[index] = opcao;
                            });
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
