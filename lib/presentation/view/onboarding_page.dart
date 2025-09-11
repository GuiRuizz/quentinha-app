import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:quentinha_app/core/consts/colors_const.dart';
import 'package:quentinha_app/presentation/components/table_price_comp.dart';
import 'package:quentinha_app/presentation/view/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quentinha_app/core/consts/size_const.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});
  

  Future<void> _finishOnboarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seenOnboarding', true);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Bem-vindo ao Quentinha 🍲",
            bodyWidget: Column(
              children: [
                Text(
                  "Seu app de marmitas saudável e saborosas!",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.justify,
                ),
                20.h,
                
                Text(
                  "Seja para matar a fome em um momento corrido ou para garantir praticidade o mês inteiro, temos o plano certo para você.",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.justify,
                ),
                10.h,
                Text(
                  "Flexibilidade, sabor e entrega garantida, do jeito que sua rotina precisa.",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
            image: Center(
              child: Image.asset("assets/images/logo-2.png", width: 400),
            ),
          ),
          PageViewModel(
            title: "",
            bodyWidget: Column(
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
                PricingTable(),
              ],
            ),
          ),
          PageViewModel(
            title: "🚀 Bora começar!",
            body: "Clique em começar para usar o app agora.",
            image: Center(child: Icon(Icons.rocket_launch, size: 120)),
          ),
        ],
        onDone: () => _finishOnboarding(context),
        onSkip: () => _finishOnboarding(context),
        showSkipButton: true,
        skip: Text("Pular", style: TextStyle(color: AppColors.primary)),
        next: Icon(Icons.arrow_forward, color: AppColors.primary),
        done: const Text(
          "Começar",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        dotsDecorator: DotsDecorator(
          size: Size(10.0, 10.0),
          color: Colors.grey,
          activeSize: Size(22.0, 10.0),
          activeColor: AppColors.primary,
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
      ),
    );
  }
}
