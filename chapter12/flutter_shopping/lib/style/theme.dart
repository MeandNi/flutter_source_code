import 'package:flutter/material.dart';
import 'package:flutter_shopping/style/colors.dart';

ThemeData buildTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: ShoppingColors.green200,
    buttonColor: ShoppingColors.green200,
    scaffoldBackgroundColor: ShoppingColors.green200,
    cardColor: Colors.white,
    textSelectionColor: ShoppingColors.pink100,
    errorColor: ShoppingColors.errorRed,
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.normal,
    ),
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
      elevation: 0.0,
    ),
    primaryIconTheme: customIconTheme(base.iconTheme),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: Color(0xFF442B2D)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none),
    ),
    textTheme: buildTextTheme(base.textTheme),
    primaryTextTheme: buildTextTheme(base.primaryTextTheme),
    accentTextTheme: buildTextTheme(base.accentTextTheme),
    iconTheme: customIconTheme(base.iconTheme),
  );
}

// 文本主题
TextTheme buildTextTheme(TextTheme base) {
  return base.copyWith(
    headline: base.headline.copyWith(fontWeight: FontWeight.w500),
    title: base.title.copyWith(fontSize: 18.0),
    caption: base.caption.copyWith(fontWeight: FontWeight.w400, fontSize: 20.0),
    body2: base.body2.copyWith(fontWeight: FontWeight.bold, fontSize: 16.0),
    button: base.button.copyWith(fontWeight: FontWeight.w500, fontSize: 14.0),
  ).apply(
    fontFamily: 'Raleway',
    displayColor: ShoppingColors.brown900,
    bodyColor: ShoppingColors.brown900,
  );
}

// 图标主题
IconThemeData customIconTheme(IconThemeData original) {
  return original.copyWith(color: ShoppingColors.brown900);
}

// 全局颜色
ColorScheme colorScheme = ColorScheme(
  primary: Colors.pink,
  primaryVariant: ShoppingColors.brown900,
  secondary: ShoppingColors.pink50,
  secondaryVariant: ShoppingColors.brown900,
  surface: ShoppingColors.surfaceWhite,
  background: Colors.white,
  error: ShoppingColors.errorRed,
  onPrimary: ShoppingColors.brown900,
  onSecondary: ShoppingColors.brown900,
  onSurface: ShoppingColors.brown900,
  onBackground: ShoppingColors.brown900,
  onError: ShoppingColors.surfaceWhite,
  brightness: Brightness.light,
);