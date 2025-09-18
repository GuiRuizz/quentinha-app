import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:quentinha_app/core/consts/size_const.dart';

import '../../core/consts/colors_const.dart';
import '../../core/log/logger.dart';

class AppBarPersonalizada extends StatelessWidget {
  const AppBarPersonalizada({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.widgetBackgroundGrey,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: IconButton(
                  icon: const Icon(Icons.sort, color: Colors.black),
                  onPressed: () {
                    AppLogger.i('Menu button pressed');
                  },
                ),
              ),
              12.w,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ENTREGAR EM',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 12,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Localização Atual',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.textSecondary,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(100),
            ),
            child: IconButton(
              icon: badges.Badge(
                badgeContent: Text('3'),
                position: badges.BadgePosition.topEnd(top: -15),
                child: const Icon(
                  Icons.shopping_bag_rounded,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                AppLogger.i('Shopping bag pressed');
              },
            ),
          ),
        ],
      ),
    );
  }
}