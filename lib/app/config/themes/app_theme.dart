import 'package:google_fonts/google_fonts.dart';

import '../../app_core.dart';

class AppTheme {
  static ThemeData lightTheme (){
    final ThemeData base = ThemeData.light();
    final fontFamily = GoogleFonts.montserrat().fontFamily;
    const Color primaryColor = kGrey252;
    const Color secondaryColor = kBlack;
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      shadow: kGrey500,
      primary: kPrimary,
      secondary: primaryColor,
      inversePrimary: secondaryColor,
    );

    return base.copyWith(
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      backgroundColor: primaryColor,
      canvasColor: primaryColor,
      scaffoldBackgroundColor: primaryColor,
    );
  }

  static ThemeData darkTheme() {
    final ThemeData base = ThemeData.dark();
    final fontFamily = GoogleFonts.workSans().fontFamily;
    const Color primaryColor = kDarkGrey;
    const Color secondaryColor = kWhite;
    final ColorScheme colorScheme = const ColorScheme.dark().copyWith(
        shadow: secondaryColor,
        primary: kPrimary,
        secondary: primaryColor,
        inversePrimary: secondaryColor);
    return base.copyWith(
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      canvasColor: primaryColor,
      backgroundColor: primaryColor,
      scaffoldBackgroundColor: primaryColor,
      textTheme: _textTheme(base.textTheme, secondaryColor),
      appBarTheme: AppBarTheme(
        elevation: 0,
        color: primaryColor,
        iconTheme: const IconThemeData(color: secondaryColor),
        titleTextStyle: AppStyle.subtitle
            .copyWith(fontFamily: fontFamily, color: secondaryColor, fontSize: 15, fontWeight: FontWeight.w600),
      ),
    );
  }

  static TextTheme _textTheme(TextTheme base, Color color) {
    final fontFamily = GoogleFonts.montserrat().fontFamily;
    return base.copyWith(
      headline1: AppStyle.title.copyWith(fontFamily: fontFamily, color: color,),
      headline2:
      AppStyle.header2.copyWith(fontFamily: fontFamily, color: color),
      headline3:
      AppStyle.header3.copyWith(fontFamily: fontFamily, color: color),
      headline4: base.headline4?.copyWith(fontFamily: fontFamily, color: color),
      headline5: base.headline5?.copyWith(fontFamily: fontFamily, color: color),
      headline6: base.headline6?.copyWith(fontFamily: fontFamily, color: color),
      button:
      AppStyle.buttonText.copyWith(fontFamily: fontFamily, color: color),
      caption: base.caption?.copyWith(fontFamily: fontFamily, color: color),
      bodyText1: base.bodyText1?.copyWith(fontFamily: fontFamily, color: color),
      bodyText2: base.bodyText2?.copyWith(fontFamily: fontFamily, color: color),
      subtitle1:
      AppStyle.subtitle.copyWith(fontFamily: fontFamily, color: color),
      subtitle2: base.subtitle2?.copyWith(fontFamily: fontFamily, color: color),
      overline: base.overline?.copyWith(fontFamily: fontFamily, color: color),
    );
  }
}