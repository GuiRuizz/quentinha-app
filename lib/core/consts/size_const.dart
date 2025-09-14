import 'package:flutter/widgets.dart';

extension SpaceExtension on num {
  /// Cria um SizedBox com altura
  SizedBox get h => SizedBox(height: toDouble());

  /// Cria um SizedBox com largura
  SizedBox get w => SizedBox(width: toDouble());
}
