import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:quentinha_app/presentation/view/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
            title: "👋 Bem-vindo!",
            body: "Aqui você vai aprender como usar o app.",
            image: Center(child: Icon(Icons.phone_android, size: 120)),
          ),
          PageViewModel(
            title: "📦 Funcionalidade 1",
            body: "Explicação sobre algo que seu app faz.",
            image: Center(child: Icon(Icons.explore, size: 120)),
          ),
          PageViewModel(
            title: "🚀 Bora começar!",
            body: "Clique em começar para usar o app agora.",
            image: Center(child: Icon(Icons.rocket_launch, size: 120)),
          ),
        ],
        onDone: () => _finishOnboarding(context),
        onSkip: () => _finishOnboarding(context), // se o usuário pular
        showSkipButton: true,
        skip: const Text("Pular"),
        next: const Icon(Icons.arrow_forward),
        done: const Text("Começar", style: TextStyle(fontWeight: FontWeight.w600)),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Colors.grey,
          activeSize: Size(22.0, 10.0),
          activeColor: Colors.orange,
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
      ),
    );
  }
}