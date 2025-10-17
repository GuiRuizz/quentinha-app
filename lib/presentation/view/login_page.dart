import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:quentinha_app/core/consts/colors_const.dart';
import 'package:quentinha_app/core/consts/size_const.dart';
import 'package:quentinha_app/presentation/components/password_field_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/consts/routes_const.dart';
import '../components/snackbar_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool rememberAccount = false;

  void _signOn() async {
  if (_formKey.currentState!.validate()) {
    FocusManager.instance.primaryFocus?.unfocus();

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Se deu certo:
      await CustomSnackBar.showWithLoading(
        context,
        message: "Login realizado com sucesso!",
        backgroundColor: Colors.green,
        icon: Icons.check_circle,
        delay: const Duration(seconds: 2),
      );

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('seenOnboarding', true);

      if (mounted) context.go(AppNameRoutes.home);
    } on FirebaseAuthException catch (e) {
      String message = "Erro ao fazer login.";
      if (e.code == 'user-not-found') {
        message = "Usuário não encontrado.";
      } else if (e.code == 'wrong-password') {
        message = "Senha incorreta.";
      }
      CustomSnackBar.show(
        context,
        message: message,
        backgroundColor: Colors.red,
        icon: Icons.error,
      );
    }
  }
}



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Cabeçalho arredondado
              Container(
                width: double.infinity,
                height: size.height * 0.25,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Entrar",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "Por favor, faça login para continuar a utilizar o app da Quentinha.",
                        style: TextStyle(color: Colors.white70),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),

              // Formulário
              Form(
                key: _formKey,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight:
                        MediaQuery.of(context).size.height -
                        (size.height * 0.25), // pega a tela menos o header
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          20.h,
                          // Email
                          const Text("EMAIL"),
                          8.h,
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              hintText: "exemplo@gmail.com",
                              filled: true,
                              fillColor: Colors.grey[300],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Digite o e-mail";
                              }
                              if (!value.contains("@")) {
                                return "E-mail inválido";
                              }
                              return null;
                            },
                          ),

                          20.h,

                          // Password
                          const Text("SENHA"),
                          8.h,
                          PasswordField(
                            controller: _passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Digite a senha";
                              }
                              if (value.length < 6) {
                                return "A senha deve ter pelo menos 6 caracteres";
                              }
                              return null;
                            },
                          ),

                          10.h,

                          // Remember + Forgot Password
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: rememberAccount,
                                    activeColor: AppColors.primary,
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        rememberAccount = newValue ?? false;
                                      });

                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            rememberAccount
                                                ? 'Conta será lembrada ✅'
                                                : 'Conta não será lembrada ❌',
                                          ),
                                          duration: const Duration(seconds: 2),
                                        ),
                                      );
                                    },
                                  ),
                                  const Text("Lembrar-me"),
                                ],
                              ),
                              TextButton(
                                onPressed: () {
                                  context.push(AppNameRoutes.forgotPassword);
                                },
                                child: const Text(
                                  "Esqueci minha senha",
                                  style: TextStyle(color: Colors.deepOrange),
                                ),
                              ),
                            ],
                          ),

                          20.h,

                          // Botão Login
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: _signOn,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                "ENTRAR",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),

                          20.h,

                          // Signup
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Não tem conta? "),
                              GestureDetector(
                                onTap: () {
                                  context.push(AppNameRoutes.register);
                                },
                                child: const Text(
                                  "Inscreva-se",
                                  style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          20.h,

                          // Divider Or
                          Row(
                            children: const [
                              Expanded(child: Divider()),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text("Ou"),
                              ),
                              Expanded(child: Divider()),
                            ],
                          ),

                          20.h,

                          // Social buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _socialButton(
                                SvgPicture.network(
                                  "https://cdn.jsdelivr.net/npm/simple-icons@v3/icons/apple.svg",
                                  height: 24,
                                  colorFilter: const ColorFilter.mode(
                                    Colors.white,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                Colors.black,
                                3,
                              ),
                              16.h,
                              _socialButton(
                                SvgPicture.network(
                                  "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/google/google-original.svg",
                                  height: 24,
                                ),
                                Colors.white24,
                                3,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _socialButton(dynamic icon, Color? color, double elevation) {
    return Material(
      elevation: elevation,
      shape: const CircleBorder(),
      child: CircleAvatar(
        radius: 24,
        backgroundColor: color,
        child: icon is IconData
            ? Icon(icon, color: Colors.white, size: 28)
            : icon,
      ),
    );
  }
}
