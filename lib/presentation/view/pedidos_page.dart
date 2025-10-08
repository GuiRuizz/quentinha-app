import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavBar(currentRoute: currentRoute),
      appBar: AppBar(
        title: const Text('Meus Pedidos'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            if (pedidoAtual != null) ...[
              const Text(
                'Pedido em Andamento',
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: ListTile(
                  title: Text(pedidoAtual!['produto']),
                  subtitle: Text(
                      'Quantidade: ${pedidoAtual!['quantidade']}\nStatus: ${pedidoAtual!['status']}'),
                  trailing: Icon(Icons.local_shipping, color: Colors.orange),
                  onTap: () {
                    // Aqui você pode ir para uma página de detalhes do pedido
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text('Pedido #${pedidoAtual!['id']}'),
                        content: Text(
                            'Produto: ${pedidoAtual!['produto']}\nQuantidade: ${pedidoAtual!['quantidade']}\nStatus: ${pedidoAtual!['status']}'),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Fechar'))
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
            const Text(
              'Histórico de Pedidos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...pedidosHistorico.map((pedido) => Card(
                  elevation: 2,
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
                          title: Text('Pedido #${pedido['id']}'),
                          content: Text(
                              'Produto: ${pedido['produto']}\nQuantidade: ${pedido['quantidade']}\nData: ${pedido['data']}\nStatus: ${pedido['status']}'),
                          actions: [
                            TextButton(
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
    );
  }
}
