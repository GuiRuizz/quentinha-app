import 'package:flutter/material.dart';
import 'package:quentinha_app/core/consts/colors_const.dart';
import 'package:quentinha_app/core/consts/size_const.dart';

import '../../core/utils/date_time_utils.dart';
import '../components/app_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final double topSafeArea = MediaQuery.of(context).padding.top;
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: topSafeArea),
              AppBarPersonalizada(),
              20.h,
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Olá {Nome do cliente}, ${DateUtilsHelper.saudacao()}!',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.start,
                    ),
                    20.h,
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Pesquisar',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: AppColors.widgetBackgroundGrey,
                      ),
                    ),
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
