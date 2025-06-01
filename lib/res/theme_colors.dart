// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

/// Theme colors
@immutable
class ThemeColors extends ThemeExtension<ThemeColors> {
  /// constructor
  const ThemeColors({
    required this.primary,
    required this.scaffold,
    required this.darkBlue,
    required this.lightBlue,
    required this.darkBlack,
    required this.textColor,
    required this.black,
    required this.grey,
    required this.outline,
    required this.backgroundColor,
    required this.errorColor,
    required this.scaffoldColor,
    required this.skyBlueColor,
    required this.tineColor,
    required this.lightGray,
    required this.grayShade600,
    required this.grayShade400,
    required this.drawerBackGround,
    required this.greenColor,
    required this.incorrectBackGroundColor,
    required this.correctBackGroundColor,
    required this.initialPercentageBackground,
    required this.iconColor,
  });

  final Color primary;
  final Color scaffold;
  final Color darkBlue;
  final Color lightBlue;
  final Color darkBlack;
  final Color textColor;
  final Color black;
  final Color grey;
  final Color outline;
  final Color backgroundColor;
  final Color errorColor;
  final Color scaffoldColor;
  final Color skyBlueColor;
  final Color tineColor;
  final Color lightGray;
  final Color grayShade600;
  final Color grayShade400;
  final Color drawerBackGround;
  final Color greenColor;
  final Color incorrectBackGroundColor;
  final Color correctBackGroundColor;
  final Color initialPercentageBackground;
  final Color iconColor;

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? primary,
    Color? scaffold,
    Color? darkBlue,
    Color? lightBlue,
    Color? darkBlack,
    Color? textColor,
    Color? black,
    Color? grey,
    Color? outline,
    Color? backgroundColor,
    Color? errorColor,
    Color? scaffoldColor,
    Color? skyBlueColor,
    Color? tineColor,
    Color? lightGray,
    Color? grayShade600,
    Color? grayShade400,
    Color? drawerBackGround,
    Color? greenColor,
    Color? incorrectBackGroundColor,
    Color? correctBackGroundColor,
    Color? initialPercentageBackground,
    Color? iconColor,
  }) {
    return ThemeColors(
      primary: primary ?? this.primary,
      scaffold: scaffold ?? this.scaffold,
      darkBlue: darkBlue ?? this.darkBlue,
      lightBlue: lightBlue ?? this.lightBlue,
      darkBlack: darkBlack ?? this.darkBlack,
      textColor: textColor ?? this.textColor,
      black: black ?? this.black,
      grey: grey ?? this.grey,
      outline: outline ?? this.outline,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      errorColor: errorColor ?? this.errorColor,
      scaffoldColor: scaffoldColor ?? this.scaffoldColor,
      skyBlueColor: skyBlueColor ?? this.skyBlueColor,
      tineColor: tineColor ?? this.tineColor,
      lightGray: lightGray ?? this.lightGray,
      grayShade600: grayShade600 ?? this.grayShade600,
      grayShade400: grayShade400 ?? this.grayShade400,
      drawerBackGround: drawerBackGround ?? this.drawerBackGround,
      greenColor: greenColor ?? this.greenColor,
      incorrectBackGroundColor: incorrectBackGroundColor ?? this.incorrectBackGroundColor,
      correctBackGroundColor: correctBackGroundColor ?? this.correctBackGroundColor,
      initialPercentageBackground: initialPercentageBackground ?? this.initialPercentageBackground,
      iconColor: initialPercentageBackground ?? this.iconColor,
    );
  }

  @override
  ThemeExtension<ThemeColors> lerp(covariant ThemeExtension<ThemeColors>? other, double t) {
    if (other is! ThemeColors) {
      return this;
    }
    return ThemeColors(
      primary: Color.lerp(primary, other.primary, t)!,
      scaffold: Color.lerp(scaffold, other.scaffold, t)!,
      darkBlue: Color.lerp(darkBlue, other.darkBlue, t)!,
      lightBlue: Color.lerp(lightBlue, other.lightBlue, t)!,
      darkBlack: Color.lerp(darkBlack, other.darkBlack, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
      black: Color.lerp(black, other.black, t)!,
      grey: Color.lerp(grey, other.grey, t)!,
      outline: Color.lerp(outline, other.outline, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      errorColor: Color.lerp(errorColor, other.errorColor, t)!,
      scaffoldColor: Color.lerp(scaffoldColor, other.scaffoldColor, t)!,
      skyBlueColor: Color.lerp(skyBlueColor, other.skyBlueColor, t)!,
      tineColor: Color.lerp(tineColor, other.tineColor, t)!,
      lightGray: Color.lerp(lightGray, other.lightGray, t)!,
      grayShade600: Color.lerp(grayShade600, other.grayShade600, t)!,
      grayShade400: Color.lerp(grayShade400, other.grayShade400, t)!,
      drawerBackGround: Color.lerp(drawerBackGround, other.drawerBackGround, t)!,
      greenColor: Color.lerp(greenColor, other.greenColor, t)!,
      incorrectBackGroundColor: Color.lerp(incorrectBackGroundColor, other.incorrectBackGroundColor, t)!,
      correctBackGroundColor: Color.lerp(correctBackGroundColor, other.correctBackGroundColor, t)!,
      initialPercentageBackground: Color.lerp(initialPercentageBackground, other.initialPercentageBackground, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
    );
  }
}
