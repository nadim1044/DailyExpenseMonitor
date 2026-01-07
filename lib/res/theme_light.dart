import 'package:daily_expense_monitor_app/gen/fonts.gen.dart';
import 'package:daily_expense_monitor_app/res/dimension.dart';
import 'package:daily_expense_monitor_app/res/theme_colors.dart';
import 'package:daily_expense_monitor_app/res/theme_text_colors.dart';
import 'package:flutter/material.dart';

/// Application Theme
///
final _lightThemeData = ThemeData.light(useMaterial3: true);

const _themeColors = ThemeColors(
  primary: Color(0xFF3F5F90),
  scaffold: Colors.white,
  lightBlue: Color(0xFF3F5F90),
  darkBlue: Color(0xFF02376D),
  darkBlack: Color(0xFF001B3C),
  textColor: Color(0xFF2F3036),
  black: Color(0xFF000000),
  grey: Colors.grey,
  outline: Color(0xFF74777F),
  backgroundColor: Color(0xFFFAF9FF),
  errorColor: Color(0xFFBA1A1A),
  scaffoldColor: Color(0XFFF9F8FF),
  skyBlueColor: Color(0XFFD5E3FF),
  tineColor: Color(0XFF9FF2E0),
  lightGray: Color(0XFF49454F),
  grayShade600: Color(0XFF455A64),
  grayShade400: Color(0XFF99ABB4),
  drawerBackGround: Color(0xFFF1F1F9),
  greenColor: Color(0xFF55CE63),
  incorrectBackGroundColor: Color(0xFFFFBAB1),
  correctBackGroundColor: Color(0xFFECFFF9),
  initialPercentageBackground: Color(0xFFF3F3F4),
  iconColor: Color(0xFF000000),
);

const _themeTextColors = ThemeTextColors(
  text: Color(0xFF2F3036),
  textField: Color(0xFF202324),
  textFieldHint: Color(0xFFD3D3D3),
  textFieldBorder: Color(0xFFD3D3D3),
  textButtonDisabled: Color(0xFFD3D3D3),
  textDisabled: Color(0xFFD3D3D3),
  textFieldErrorBorder: Color(0xFFFF8A85),
  whiteTextColor: Color(0xFFFFFFFF),
  blackTextColor: Color(0xFF202324),
  historyViewTextColor: Color(0x00ffffff),
  contactTitleColor: Color(0xFFFF8A85),
  darkMistSubTitle: Color(0xFF3E4C59),
  kPurpleLight: Color(0xFFDABFFF),
  neonBlueLinksColor: Color(0xFF4881F4),
  communitySkipText: Color(0xFF8C62FF),
  chatTimeText: Color(0xFF616E7C),
  goldTextColor: Color(0XFFFFD466),
  filledTextFieldHintColor: Color(0XFF43474E),
);

final _textTheme = _lightThemeData.textTheme.copyWith(
  titleLarge: TextStyle(
    fontFamily: FontFamily.workSans,
    fontWeight: FontWeight.w700,
    color: _themeTextColors.text,
    fontSize: AppSize.sp16,
    inherit: false,
    height: 1.5,
  ),
  titleMedium: TextStyle(
    fontFamily: FontFamily.workSans,
    fontWeight: FontWeight.w700,
    color: _themeTextColors.text,
    // inherit: false,
    height: 1,
    fontSize: AppSize.sp14,
    letterSpacing: 0,
  ),
  titleSmall: TextStyle(
    fontFamily: FontFamily.workSans,
    fontWeight: FontWeight.w600,
    color: _themeTextColors.text,
    // inherit: false,
    height: 1,
    fontSize: AppSize.sp14,
    letterSpacing: 0,
  ),
  bodyLarge: TextStyle(
    fontFamily: FontFamily.workSans,
    fontWeight: FontWeight.w500,
    color: _themeTextColors.text,
    // inherit: false,
    height: 1,
    fontSize: AppSize.sp14,
    letterSpacing: 0,
  ),
  bodyMedium: TextStyle(
    fontFamily: FontFamily.workSans,
    fontWeight: FontWeight.w400,
    color: _themeTextColors.text,
    // inherit: false,
    height: 1,
    fontSize: AppSize.sp14,
    letterSpacing: 0,
  ),
  bodySmall: TextStyle(
    fontFamily: FontFamily.workSans,
    fontWeight: FontWeight.w300,
    color: _themeTextColors.text,
    // inherit: false,
    height: 1,
    fontSize: AppSize.sp14,
    letterSpacing: 0,
  ),
  /*labelSmall: TextStyle(
          fontFamily: FontFamily.inter,
          fontWeight: FontWeight.w200,
          color: _themeTextColors.text,
        ),*/
);

/// Tab bar theme
// final _tabBarTheme = TabBarTheme(
//   labelColor: _themeTextColors.blackTextColor,
//   labelStyle: _textTheme.titleLarge,
//   unselectedLabelStyle: _textTheme.titleLarge,
//   indicator: UnderlineTabIndicator(
//     borderSide: const BorderSide(color: Colors.black),
//     insets: EdgeInsets.symmetric(vertical: AppSize.h10),
//   ),
//   overlayColor: WidgetStateProperty.all<Color>(Colors.grey.shade100),
//   unselectedLabelColor: _themeTextColors.textDisabled,
// );

/// Application Light Theme
final lightTheme = _lightThemeData.copyWith(
  colorScheme: ColorScheme.light(primary: _themeColors.primary),
  cardColor: Colors.grey.shade200,
  splashColor: Colors.transparent,
  scaffoldBackgroundColor: _themeColors.scaffold,
  textTheme: _textTheme,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    centerTitle: true,
    scrolledUnderElevation: 0,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontFamily: FontFamily.workSans,
      fontWeight: FontWeight.w700,
      color: _themeTextColors.text,
      fontSize: AppSize.sp16,
      height: 1.5,
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      foregroundColor: _themeColors.lightBlue,
      disabledBackgroundColor: Colors.grey,
      disabledForegroundColor: _themeTextColors.textButtonDisabled,
      maximumSize: Size(double.infinity, AppSize.h48),
      minimumSize: Size(AppSize.w64, AppSize.h48),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.r24),
      ),
      textStyle: _textTheme.bodyMedium?.copyWith(
        fontSize: AppSize.sp16,
        fontFamily: FontFamily.workSans,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      disabledBackgroundColor: Colors.grey,
      disabledForegroundColor: _themeTextColors.textButtonDisabled,
      maximumSize: Size(double.infinity, AppSize.h48),
      minimumSize: Size(AppSize.w64, AppSize.h48),
      side: BorderSide(
        color: _themeColors.outline,
        width: AppSize.h1,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.r24),
      ),
      textStyle: _textTheme.bodyMedium?.copyWith(
        fontSize: AppSize.sp14,
        fontFamily: FontFamily.workSans,
        fontWeight: FontWeight.w700,
        color: _themeColors.primary,
        height: 1.5,
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: _themeTextColors.text,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.r24),
      ),
      textStyle: _textTheme.bodyMedium?.copyWith(
        fontSize: AppSize.sp16,
        fontFamily: FontFamily.workSans,
        fontWeight: FontWeight.w700,
        color: _themeTextColors.text,
        height: 1,
      ),
    ),
  ),
  extensions: <ThemeExtension<dynamic>>[
    _themeColors,
    _themeTextColors,
  ],
);
