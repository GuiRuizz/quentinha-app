import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quentinha_app/core/consts/colors_const.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/routes/routes.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final prefs = await SharedPreferences.getInstance();
  final bool? seenOnboarding = prefs.getBool('seenOnboarding');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp(seenOnboarding: seenOnboarding ?? false));
}

class MyApp extends StatelessWidget {
  final bool seenOnboarding;
  const MyApp({super.key, required this.seenOnboarding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        primaryColor: AppColors.primary,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.primary, // cursor
          selectionColor: Colors.orangeAccent, // texto selecionado
          selectionHandleColor: Colors.orange, // "bolinha" do seletor
        ),
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
      ),
      title: 'Quentinhas App',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRoutes.router(seenOnboarding),
    );
  }
}
