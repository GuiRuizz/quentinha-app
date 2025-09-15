import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:quentinha_app/core/consts/colors_const.dart';
import 'package:quentinha_app/core/consts/size_const.dart';
import 'package:quentinha_app/presentation/components/snackbar_widget.dart';
import '../../core/consts/routes_const.dart';
import '../../core/log/logger.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  bool rememberAccount = false;

  void _forgotPassword() async {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;

      // Fecha teclado
      FocusManager.instance.primaryFocus?.unfocus();
      await Future.delayed(const Duration(milliseconds: 200));

      // Mostra loading + snackbar
      await CustomSnackBar.showWithLoading(
        context,
        message: "Se o e-mail existir, um link de recuperação foi enviado.",
        backgroundColor: Colors.green,
        icon: Icons.check_circle,
        delay: const Duration(seconds: 2),
      );

      AppLogger.i("Email que foi solicitado para recuperar a senha: $email");
      // Navega para a página de login
      if (mounted) {
        context.go(AppNameRoutes.login);
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
                      "Esqueci minha senha",
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
                        "Insira seu email para recuperar sua senha, você receberá um link no seu email.",
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
                          // Botão Login
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: _forgotPassword,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                "RECUPERAR SENHA",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),

                          40.h,
                          Center(
                            child: Image.asset(
                              "assets/images/logo-1.png",
                              width: 400,
                            ),
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
}
