import 'package:statszone/core/app_core.dart';

extension SizeExtension on num {
  double get h => SizeConfig.getHeight(toDouble());
  double get w => SizeConfig.getWidth(toDouble());
  double get sp => SizeConfig.getTextSize(toDouble());
}