import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_search/core/utils/JSColors.dart';
import 'package:nb_utils/nb_utils.dart';

class AppThemeData {
  //
  AppThemeData._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: whiteColor,
    primaryColor: JPColors.appColorPrimary,
    primaryColorDark: JPColors.appColorPrimary,
    hoverColor: Colors.white54,
    dividerColor: viewLineColor,
    fontFamily: GoogleFonts.openSans().fontFamily,
    appBarTheme: AppBarTheme(
      color: whiteColor,
      iconTheme: IconThemeData(color: textPrimaryColor),
      systemOverlayStyle:
          SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
    ),
    textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.black),
    cardTheme: CardTheme(color: Colors.white),
    cardColor: Colors.white,
    iconTheme: IconThemeData(color: textPrimaryColor),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: whiteColor),
    textTheme: TextTheme(
      labelLarge: TextStyle(color: JPColors.appColorPrimary),
      titleLarge: TextStyle(color: textPrimaryColor),
      titleSmall: TextStyle(color: textSecondaryColor),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.light(primary: JPColors.appColorPrimary)
        .copyWith(error: Colors.red),
  ).copyWith(
    pageTransitionsTheme:
        PageTransitionsTheme(builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
      TargetPlatform.macOS: OpenUpwardsPageTransitionsBuilder(),
    }),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: JPColors.appBackgroundColorDark,
    highlightColor: JPColors.appBackgroundColorDark,
    appBarTheme: AppBarTheme(
      color: JPColors.appBackgroundColorDark,
      iconTheme: IconThemeData(color: blackColor),
      systemOverlayStyle:
          SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
    ),
    primaryColor: JPColors.color_primary_black,
    dividerColor: Color(0xFFDADADA).withOpacity(0.3),
    primaryColorDark: JPColors.color_primary_black,
    textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.white),
    hoverColor: Colors.black12,
    fontFamily: GoogleFonts.openSans().fontFamily,
    bottomSheetTheme:
        BottomSheetThemeData(backgroundColor: JPColors.appBackgroundColorDark),
    primaryTextTheme: TextTheme(
        titleLarge: primaryTextStyle(color: Colors.white),
        labelSmall: primaryTextStyle(color: Colors.white)),
    cardTheme: CardTheme(color: JPColors.cardBackgroundBlackDark),
    cardColor: JPColors.appSecondaryBackgroundColor,
    iconTheme: IconThemeData(color: whiteColor),
    textTheme: TextTheme(
      labelLarge: TextStyle(color: JPColors.color_primary_black),
      titleLarge: TextStyle(color: whiteColor),
      titleSmall: TextStyle(color: Colors.white54),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.dark(
            primary: JPColors.appBackgroundColorDark,
            onPrimary: JPColors.cardBackgroundBlackDark)
        .copyWith(secondary: whiteColor)
        .copyWith(error: Color(0xFFCF6676)),
  ).copyWith(
    pageTransitionsTheme:
        PageTransitionsTheme(builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
      TargetPlatform.macOS: OpenUpwardsPageTransitionsBuilder(),
    }),
  );
}
