import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quentinha_app/core/consts/colors_const.dart';
import 'package:quentinha_app/core/consts/size_const.dart';

import '../../core/consts/routes_const.dart';
import '../components/bottom_nav_bar_widget.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  bool isEditingName = false;
  bool isEditingNumber = false;

  final TextEditingController _nameController =
      TextEditingController(text: 'Guilherme Enrique');
  final TextEditingController _numberController =
      TextEditingController(text: '+55 (12) 99999-9999');

  late String randomChampionImage;

  final List<String> champions = [
    'Ahri',
    'Yasuo',
    'Lux',
    'Jinx',
    'Zed',
    'Garen',
    'MissFortune',
    'Ekko',
    'Katarina',
    'Ezreal',
    'Thresh',
    'LeeSin',
    'Ashe',
    'Riven',
    'Morgana',
  ];

  @override
  void initState() {
    super.initState();
    randomChampionImage = _getRandomChampionImage();
  }

  String _getRandomChampionImage() {
    final random = Random();
    final champ = champions[random.nextInt(champions.length)];
    // usa o CDN oficial da Riot para pegar o ícone do campeão
    return 'https://ddragon.leagueoflegends.com/cdn/14.20.1/img/champion/$champ.png';
  }

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.toString();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          'Perfil',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.grey.shade300,
                  child: ClipOval(
                    child: Image.network(
                      randomChampionImage,
                      fit: BoxFit.cover,
                      width: 110,
                      height: 110,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.person,
                          size: 60,
                          color: Colors.white,
                        );
                      },
                    ),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade300,
                  ),
                  padding: const EdgeInsets.all(6),
                  child: const Icon(
                    Icons.camera_alt,
                    size: 20,
                  ),
                ),
              ],
            ),
            16.h,

            GestureDetector(
              onTap: () => setState(() => isEditingName = true),
              child: isEditingName
                  ? _editableField(
                      controller: _nameController,
                      label: 'Nome',
                      onSave: () => setState(() => isEditingName = false),
                    )
                  : _displayField(
                      text: _nameController.text,
                    ),
            ),

            4.h,

            GestureDetector(
              onTap: () => setState(() => isEditingNumber = true),
              child: isEditingNumber
                  ? _editableField(
                      controller: _numberController,
                      label: 'Número',
                      onSave: () => setState(() => isEditingNumber = false),
                    )
                  : _displayField(
                      text: _numberController.text,
                    ),
            ),

            24.h,
            const Divider(),

            ListTile(
              leading: Icon(Icons.key, color: AppColors.primary,),
              title: const Text('Conta', style: TextStyle(fontWeight: FontWeight.bold,),),
              subtitle:
                  Text('Privacidade, segurança, mudança de informações pessoais', style: TextStyle(color: AppColors.textSecondary),),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.lock , color: AppColors.primary,),
              title: const Text('Privacidade', style: TextStyle(fontWeight: FontWeight.bold,),),
              subtitle: Text('Bloqueios, status, confirmação de leitura', style: TextStyle(color: AppColors.textSecondary),),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.notifications, color: AppColors.primary,),
              title: const Text('Notificações', style: TextStyle(fontWeight: FontWeight.bold,),),
              subtitle: Text('Sons de mensagens e chamadas', style: TextStyle(color: AppColors.textSecondary),),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.help_outline, color: AppColors.primary,),
              title: const Text('Ajuda', style: TextStyle(fontWeight: FontWeight.bold,),),
              subtitle: Text('Central de ajuda, contato e termos', style: TextStyle(color: AppColors.textSecondary),),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info_outline , color: AppColors.primary,),
              title: const Text('Sobre', style: TextStyle(fontWeight: FontWeight.bold,),),
              subtitle: Text('Versão do aplicativo e informações', style: TextStyle(color: AppColors.textSecondary),),
              onTap: () {},
            ),

            16.h,           
            const Divider(),

            // BOTÃO DE SAIR
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.redAccent),
              title: const Text(
                'Sair',
                style: TextStyle(color: Colors.redAccent),
              ),
              onTap: () {
                context.go(AppNameRoutes.login);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentRoute: currentRoute),
    );
  }

  Widget _displayField({required String text}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: AppColors.textSecondary
          ),
        ),
        8.w,
      ],
    );
  }

  Widget _editableField({
    required TextEditingController controller,
    required String label,
    required VoidCallback onSave,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 200,
          child: TextField(
            cursorColor: AppColors.primary, // cor do cursor
            controller: controller,
            textAlign: TextAlign.center,
            autofocus: true,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStyle(color: AppColors.primary), // label laranja
              isDense: true,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.primary, width: 2),
              ),
              enabledBorder: const UnderlineInputBorder(), // cor padrão do underline
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.check, color: AppColors.primary), // ícone laranja
          onPressed: onSave,
        ),
      ],
    );
  }
}
