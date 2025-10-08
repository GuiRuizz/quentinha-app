import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quentinha_app/core/consts/colors_const.dart';
import 'package:quentinha_app/core/consts/routes_const.dart';
import 'package:quentinha_app/core/consts/size_const.dart';

import '../components/bottom_nav_bar_widget.dart';

class PedidosPage extends StatefulWidget {
  const PedidosPage({super.key});

  @override
  State<PedidosPage> createState() => _PedidosPageState();
}

class _PedidosPageState extends State<PedidosPage> {
  // Simulando dados de pedidos
  final List<Map<String, dynamic>> pedidosHistorico = [
    {
      'id': 1,
      'produto': 'Marmita Fit',
      'data': '07/10/2025',
      'status': 'Entregue',
      'quantidade': 2
    },
    {
      'id': 2,
      'produto': 'Marmita Vegana',
      'data': '05/10/2025',
      'status': 'Entregue',
      'quantidade': 1
    },
  ];

  final Map<String, dynamic>? pedidoAtual = {
    'id': 3,
    'produto': 'Marmita Low Carb',
    'data': '08/10/2025',
    'status': 'Em preparo',
    'quantidade': 1
  };

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.toString();
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop){
          context.go(AppNameRoutes.home);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavBar(currentRoute: currentRoute),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              children: [
                if (pedidoAtual != null) ...[
                  const Text(
                    'Em Andamento',
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  8.h,
                  Card(
                    elevation: 0,
                    color: AppColors.widgetBackgroundGrey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: ListTile(
                      title: Text(pedidoAtual!['produto']),
                      subtitle: Text(
                          'Quantidade: ${pedidoAtual!['quantidade']}\nStatus: ${pedidoAtual!['status']}'),
                      trailing: Icon(Icons.local_shipping, color: AppColors.primary),
                      onTap: () {
                        // Aqui você pode ir para uma página de detalhes do pedido
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            backgroundColor: AppColors.background,
                            title: Text('Pedido #${pedidoAtual!['id']}'),
                            content: Text(
                                'Produto: ${pedidoAtual!['produto']}\nQuantidade: ${pedidoAtual!['quantidade']}\nStatus: ${pedidoAtual!['status']}'),
                            actions: [
                              TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: AppColors.primary,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30), // bordas bem arredondadas
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('Fechar', style: TextStyle(color: AppColors.background),))
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  20.h,
                ],
                const Text(
                  'Histórico de Pedidos',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                8.h,
                ...pedidosHistorico.map((pedido) => Card(
                      elevation: 0,
                      color: AppColors.widgetBackgroundGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: ListTile(
                        title: Text(pedido['produto']),
                        subtitle: Text(
                            'Quantidade: ${pedido['quantidade']}\nData: ${pedido['data']}\nStatus: ${pedido['status']}'),
                        trailing: Icon(Icons.history, color: Colors.grey),
                        onTap: () {
                          // Detalhes do pedido histórico
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                            backgroundColor: AppColors.background,
                              title: Text('Pedido #${pedido['id']}'),
                              content: Text(
                                  'Produto: ${pedido['produto']}\nQuantidade: ${pedido['quantidade']}\nData: ${pedido['data']}\nStatus: ${pedido['status']}'),
                              actions: [
                                TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: AppColors.primary,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30), // bordas bem arredondadas
                                      ),
                                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Fechar'))
                              ],
                            ),
                          );
                        },
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
