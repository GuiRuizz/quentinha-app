import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:quentinha_app/core/consts/colors_const.dart';
import 'package:quentinha_app/presentation/components/register_login_page.dart';
import 'package:quentinha_app/presentation/view/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../components/table_price_page_wIdget.dart';
import '../components/wellcome_widget.dart';

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
            bodyWidget: WellcomeWidget(),
            image: Center(
              child: Image.asset("assets/images/logo-2.png", width: 400),
            ),
          ),
          PageViewModel(
            title: "",
            bodyWidget: TablePricePageWIdget(),
          ),
          PageViewModel(
            title: "",
            bodyWidget: RegisterLoginPage(),
          ),
        ],
        onDone: () => _finishOnboarding(context),
        onSkip: () => _finishOnboarding(context),
        showSkipButton: true,
        skip: Text("Pular", style: TextStyle(color: AppColors.primary)),
        next: Icon(Icons.arrow_forward, color: AppColors.primary),
        done: Text(
          "Começar",
          style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.primary),
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



