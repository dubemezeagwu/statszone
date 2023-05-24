import 'package:statszone/app/config/size_config.dart';

extension SizeExtension on num {
  double get h => SizeConfig.getHeight(toDouble());
  double get w => SizeConfig.getWidth(toDouble());
  double get sp => SizeConfig.getTextSize(toDouble());
}