import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'presentation/view/home_page.dart';
import 'presentation/view/onboarding_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final bool? seenOnboarding = prefs.getBool('seenOnboarding');

  runApp(MyApp(seenOnboarding: seenOnboarding ?? false));
}

class MyApp extends StatelessWidget {
  final bool seenOnboarding;
  const MyApp({super.key, required this.seenOnboarding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding Demo',
      debugShowCheckedModeBanner: false,
      home: seenOnboarding ? const HomePage() : const OnboardingPage(),
    );
  }
}



