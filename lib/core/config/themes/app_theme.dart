import 'package:statszone/core/app_core.dart';

class AppTheme {
  static ThemeData lightTheme() {
    final base = FlexThemeData.light(
      scheme: FlexScheme.green,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xff2e7d32),
        onPrimary: Color(0xffffffff),
        primaryContainer: Color(0xffa5d6a7),
        onPrimaryContainer: Color(0xff000000),
        secondary: Color(0xff004d40),
        onSecondary: Color(0xffffffff),
        secondaryContainer: Color(0xff59b1a1),
        onSecondaryContainer: Color(0xff000000),
        tertiary: Color(0xff00695c),
        onTertiary: Color(0xffffffff),
        tertiaryContainer: Color(0xff7dcec4),
        onTertiaryContainer: Color(0xff000000),
        error: Color(0xffba1a1a),
        onError: Color(0xffffffff),
        errorContainer: Color(0xffffdad6),
        onErrorContainer: Color(0xff410002),
        background: Color(0xffffffff),
        onBackground: Color(0xff000000),
        surface: Color(0xffffffff),
        onSurface: Color(0xff000000),
        surfaceVariant: Color(0xffeeeeee),
        onSurfaceVariant: Color(0xff000000),
        outline: Color(0xff737373),
        outlineVariant: Color(0xffbfbfbf),
        shadow: Color(0xff000000),
        scrim: Color(0xff000000),
        inverseSurface: Color(0xff121212),
        onInverseSurface: Color(0xffffffff),
        inversePrimary: Color(0xffbceebf),
        surfaceTint: Color(0xff2e7d32),
      ),
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog,
      blendLevel: 40,
      appBarStyle: FlexAppBarStyle.primary,
      appBarOpacity: 0.95,
      appBarElevation: 0,
      transparentStatusBar: true,
      tabBarStyle: FlexTabBarStyle.forBackground,
      tooltipsMatchBackground: true,
      swapColors: true,
      lightIsWhite: true,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      fontFamily: GoogleFonts.raleway().fontFamily,
      // subThemesData: const FlexSubThemesData(
      //   useTextTheme: true,
      //   fabUseShape: true,
      //   interactionEffects: true,
      //   bottomNavigationBarElevation: 0,
      //   bottomNavigationBarOpacity: 1,
      //   navigationBarOpacity: 1,
      //   navigationBarMutedUnselectedIcon: true,
      //   inputDecoratorIsFilled: true,
      //   inputDecoratorBorderType: FlexInputBorderType.outline,
      //   inputDecoratorUnfocusedHasBorder: true,
      //   blendOnColors: true,
      //   blendTextTheme: true,
      //   popupMenuOpacity: 0.95,
      // ),
    );
    // base.copyWith(
    //   textTheme: _textTheme(base.textTheme, kBlack),
    //   iconTheme: const IconThemeData(color: kBlack)
    //   );
    return base;
  }

  static ThemeData darkTheme() {
    final base = FlexThemeData.dark(
      scheme: FlexScheme.green,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xffa5d6a7),
        onPrimary: Color(0xff000000),
        primaryContainer: Color(0xff1b5e20),
        onPrimaryContainer: Color(0xffffffff),
        secondary: Color(0xff4db6ac),
        onSecondary: Color(0xff000000),
        secondaryContainer: Color(0xff05514a),
        onSecondaryContainer: Color(0xffffffff),
        tertiary: Color(0xff80cbc4),
        onTertiary: Color(0xff000000),
        tertiaryContainer: Color(0xff00695c),
        onTertiaryContainer: Color(0xffffffff),
        error: Color(0xffffb4ab),
        onError: Color(0xff690005),
        errorContainer: Color(0xff93000a),
        onErrorContainer: Color(0xffffb4ab),
        background: Color(0xff121212),
        onBackground: Color(0xffffffff),
        surface: Color(0xff121212),
        onSurface: Color(0xffffffff),
        surfaceVariant: Color(0xff323232),
        onSurfaceVariant: Color(0xffffffff),
        outline: Color(0xff8c8c8c),
        outlineVariant: Color(0xff404040),
        shadow: Color(0xff000000),
        scrim: Color(0xff000000),
        inverseSurface: Color(0xffffffff),
        onInverseSurface: Color(0xff000000),
        inversePrimary: Color(0xff526552),
        surfaceTint: Color(0xffa5d6a7),
      ),
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog,
      blendLevel: 40,
      appBarStyle: FlexAppBarStyle.primary,
      appBarOpacity: 0.95,
      appBarElevation: 0,
      transparentStatusBar: true,
      tabBarStyle: FlexTabBarStyle.forBackground,
      tooltipsMatchBackground: true,
      swapColors: true,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      fontFamily: GoogleFonts.raleway().fontFamily,
      // subThemesData: const FlexSubThemesData(
      //   useTextTheme: true,
      //   fabUseShape: true,
      //   interactionEffects: true,
      //   bottomNavigationBarElevation: 0,
      //   bottomNavigationBarOpacity: 1,
      //   navigationBarOpacity: 1,
      //   navigationBarMutedUnselectedIcon: true,
      //   inputDecoratorIsFilled: true,
      //   inputDecoratorBorderType: FlexInputBorderType.outline,
      //   inputDecoratorUnfocusedHasBorder: true,
      //   blendOnColors: true,
      //   blendTextTheme: true,
      //   popupMenuOpacity: 0.95,
      // ),
    );
    // base.copyWith(
    //   textTheme: _textTheme(base.textTheme, kWhite), 
    //   iconTheme: const IconThemeData(color:kWhite));
    return base;
  }

  static TextTheme _textTheme(TextTheme base, Color color) {
    return base.copyWith(
      displayLarge: AppStyle.header1.copyWith(color: color,),
      displayMedium: AppStyle.header2.copyWith(color: color),
      displaySmall: AppStyle.header3.copyWith(color: color),
      headlineMedium: base.headlineMedium?.copyWith(color: color),
      headlineSmall: base.headlineSmall?.copyWith(color: color),
      titleLarge: base.titleLarge?.copyWith(color: color),
      labelLarge: AppStyle.buttonText.copyWith(color: color),
      bodySmall: base.bodySmall?.copyWith(color: color),
      bodyLarge: base.bodyLarge?.copyWith(color: color),
      bodyMedium: base.bodyMedium?.copyWith(color: color),
      titleMedium: AppStyle.subtitle.copyWith(color: color),
      titleSmall: base.titleSmall?.copyWith(color: color),
      labelSmall: base.labelSmall?.copyWith(color: color),
    );
  }
  // static ThemeData lightTheme (){
  //   final ThemeData base = FlexThemeData.light();
  //   final fontFamily = GoogleFonts.raleway().fontFamily;
  //   const Color primaryColor = kGrey252;
  //   const Color secondaryColor = kBlack;
  //   final ColorScheme colorScheme = const ColorScheme.light().copyWith(
  //     shadow: kGrey500,
  //     primary: kPrimary,
  //     secondary: primaryColor,
  //     inversePrimary: secondaryColor,
  //   );

  //   return base.copyWith(
  //     colorScheme: colorScheme,
  //     primaryColor: primaryColor,
  //     backgroundColor: primaryColor,
  //     canvasColor: primaryColor,
  //     scaffoldBackgroundColor: primaryColor,
  //     textTheme: _textTheme(base.textTheme, secondaryColor),
  //     appBarTheme: AppBarTheme(
  //       elevation: 0,
  //       color: primaryColor,
  //       iconTheme: const IconThemeData(color: secondaryColor),
  //       titleTextStyle: AppStyle.subtitle.copyWith(
  //         fontFamily: fontFamily,
  //         color: secondaryColor,
  //         fontSize: 15,
  //         fontWeight: FontWeight.w600
  //       )
  //     ),
  //     visualDensity: VisualDensity.adaptivePlatformDensity,
  //     useMaterial3: true,
  //     pageTransitionsTheme: PageTransitionsTheme(builders: {
  //         for (final platform in TargetPlatform.values)
  //           platform: const OpenUpwardsPageTransitionsBuilder()
  //       }),
  //   );
  // }

  // static ThemeData darkTheme() {
  //   final ThemeData base = ThemeData.dark();
  //   final fontFamily = GoogleFonts.raleway().fontFamily;
  //   const Color primaryColor = kDarkGrey;
  //   const Color secondaryColor = kWhite;
  //   final ColorScheme colorScheme = const ColorScheme.dark().copyWith(
  //       shadow: secondaryColor,
  //       primary: kPrimary,
  //       secondary: primaryColor,
  //       inversePrimary: secondaryColor);
  //   return base.copyWith(
  //     colorScheme: colorScheme,
  //     primaryColor: primaryColor,
  //     canvasColor: primaryColor,
  //     backgroundColor: primaryColor,
  //     scaffoldBackgroundColor: primaryColor,
  //     textTheme: _textTheme(base.textTheme, secondaryColor),
  //     appBarTheme: AppBarTheme(
  //       elevation: 0,
  //       color: primaryColor,
  //       iconTheme: const IconThemeData(color: secondaryColor),
  //       titleTextStyle: AppStyle.subtitle
  //           .copyWith(fontFamily: fontFamily, color: secondaryColor, fontSize: 15, fontWeight: FontWeight.w600),
  //     ),
  //     visualDensity: VisualDensity.adaptivePlatformDensity,
  //     useMaterial3: true,
  //     pageTransitionsTheme: PageTransitionsTheme(builders: {
  //         for (final platform in TargetPlatform.values)
  //           platform: const OpenUpwardsPageTransitionsBuilder()
  //       }),
  //   );
  // }
}
