import 'package:statszone/core/app_core.dart';

class AppStyle {
  static final fontFamily = GoogleFonts.raleway().fontFamily;
  static TextStyle title = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 36.sp,
    fontFamily: fontFamily,
    letterSpacing: -0.02,
  );

  static TextStyle header2 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 30.sp,
    fontFamily: fontFamily,
    letterSpacing: -0.02,
  );

  static TextStyle header3 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 24.sp,
    fontFamily: fontFamily,
    letterSpacing: -0.02,
  );

  static TextStyle subtitle = TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
    fontSize: 14,
  );

  static TextStyle body = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    fontFamily: fontFamily,
    // letterSpacing: 1.4,
  );

  static TextStyle small = TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
    fontSize: 12,
  );

  static TextStyle preTitle = TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
    fontSize: 14,
  );

  static TextStyle buttonText = TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
    fontSize: 16,
  );

  static TextStyle link = TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
    fontSize: 16,
  );
}