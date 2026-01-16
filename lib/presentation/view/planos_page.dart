import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/consts/routes_const.dart';
import '../components/bottom_nav_bar_widget.dart';

class PlanosPage extends StatefulWidget {
  const PlanosPage({super.key});

  @override
  State<PlanosPage> createState() => _PlanosPageState();
}

class _PlanosPageState extends State<PlanosPage> {
  final PageController _controller = PageController();

  Timer? _timer;
  int _currentIndex = 0;

  final List<Map<String, dynamic>> planos = [
    {
      'category': 'PREMIUM PLAN',
      'title': 'Performance Pro',
      'description':
          'Fuel your active lifestyle with high-protein meals designed for recovery.',
      'calories': '650 kcal',
      'protein': '45g',
      'time': '15 min',
      'price': '\$12.99',
      'image': 'https://www.auto-data.net/images/f22/file3680407.jpg',
    },
    {
      'category': 'FIT PLAN',
      'title': 'Lean Life',
      'description': 'Balanced meals for a healthier everyday routine.',
      'calories': '520 kcal',
      'protein': '38g',
      'time': '10 min',
      'price': '\$9.99',
      'image': 'https://www.auto-data.net/images/f123/Koenigsegg-Gemera.jpg',
    },
    {
      'category': 'ECONOMIC PLAN',
      'title': 'Daily Saver',
      'description': 'Great taste with the best cost-benefit.',
      'calories': '580 kcal',
      'protein': '32g',
      'time': '12 min',
      'price': '\$8.99',
      'image': 'https://www.auto-data.net/images/f100/McLaren-Senna.jpg',
    },
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (_controller.hasClients) {
        _currentIndex = (_currentIndex + 1) % planos.length;
        _controller.animateToPage(
          _currentIndex,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.toString();

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          context.go(AppNameRoutes.home);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: BottomNavBar(currentRoute: currentRoute),
        body: PageView.builder(
          controller: _controller,
          itemCount: planos.length,
          itemBuilder: (context, index) {
            final plano = planos[index];

            return Stack(
              children: [
                /// 🔹 Background image
                Positioned.fill(
                  child: Image.network(plano['image'], fit: BoxFit.cover),
                ),

                /// 🔹 Dark overlay
                Positioned.fill(
                  child: Container(color: Colors.black.withOpacity(0.35)),
                ),

                /// 🔹 Top icons
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _circleIcon(Icons.arrow_back, () {
                          context.pop();
                        }),
                        _circleIcon(Icons.help_outline, () {}),
                      ],
                    ),
                  ),
                ),

                /// 🔹 Bottom card
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 24,
                  child: _PlanCard(plano: plano),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _circleIcon(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: Colors.black.withAlpha(50),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}

/// 🔹 Card principal do plano
class _PlanCard extends StatelessWidget {
  final Map<String, dynamic> plano;

  const _PlanCard({required this.plano});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          colors: [Colors.black.withAlpha(75), Colors.black.withAlpha(90)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(40),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Category
          Text(
            plano['category'],
            style: const TextStyle(
              color: Colors.orange,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 6),

          /// Title
          Text(
            plano['title'],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),

          /// Description
          Text(
            plano['description'],
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 16),

          /// Info row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _infoItem(
                Icons.local_fire_department,
                plano['calories'],
                'Calories',
              ),
              _infoItem(Icons.fitness_center, plano['protein'], 'Protein'),
              _infoItem(Icons.schedule, plano['time'], 'Prep Time'),
            ],
          ),
          const SizedBox(height: 20),

          /// Price + Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                plano['price'],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // TODO: Navegar para checkout
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                ),
                child: const Text(
                  'Choose This Plan →',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.orange, size: 22),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(color: Colors.white60, fontSize: 11),
        ),
      ],
    );
  }
}
