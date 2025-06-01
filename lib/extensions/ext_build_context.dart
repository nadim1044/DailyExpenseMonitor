import 'package:daily_expense_monitor_app/res/theme_colors.dart';
import 'package:daily_expense_monitor_app/res/theme_text_colors.dart';
import 'package:flutter/material.dart';

/// extension for [BuildContext]
extension BuildContextEx on BuildContext {
  /// to get theme
  ThemeData get theme => Theme.of(this);

  /// to get colorScheme
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// to get text theme
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// to get theme colors
  ThemeColors get themeColors => Theme.of(this).extension<ThemeColors>()!;

  /// to get theme text colors
  ThemeTextColors get themeTextColors => Theme.of(this).extension<ThemeTextColors>()!;

  /// to get size of screen
  Size get sizeOf => MediaQuery.sizeOf(this);

  /// to get width from media query
  double get width => sizeOf.width;

  /// to get height from media query
  double get height => sizeOf.height;

  /// to get device pixel ratio
  double get pixelRatio => MediaQuery.of(this).devicePixelRatio;

  /// to get width in pixels
  double get widthPixel => MediaQuery.sizeOf(this).width * MediaQuery.of(this).devicePixelRatio;

  /// to get height in pixels
  double get heightPixel => MediaQuery.sizeOf(this).height * MediaQuery.of(this).devicePixelRatio;

  /// to get view insets
  EdgeInsets get viewInsetsOf => MediaQuery.viewInsetsOf(this);

  /// to theme brightness [Brightness.dark] or [Brightness.light]
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  /// to show common dialog
  // Future<bool?> showAlertDialog({
  //   required String defaultActionText,
  //   required String cancelActionText,
  //   String? title,
  //   String? content,
  //   VoidCallback? onDefaultActionPressed,
  //   VoidCallback? onCancelActionPressed,
  //   Widget? titleWidget,
  //   Widget? contentWidget,
  //   Color? defaultActionBgColor,
  //   Color? cancelActionBgColor,
  //   ValueNotifier<bool>? isLoadingDefaultAction,
  // }) async =>
  //     showDialog<bool>(
  //       context: this,
  //       builder: (context) => AlertDialog(
  //         surfaceTintColor: Colors.white,
  //         backgroundColor: context.themeColors.backgroundColor,
  //         alignment: Alignment.center,
  //         insetPadding: EdgeInsets.all(AppSize.h24),
  //         title: titleWidget ??
  //             Text(
  //               title ?? '',
  //               textAlign: TextAlign.center,
  //               style: context.textTheme.titleSmall?.copyWith(fontSize: AppSize.sp16),
  //             ),
  //         titlePadding: EdgeInsets.symmetric(vertical: AppSize.h16),
  //         content: contentWidget ?? Text(content ?? '', textAlign: TextAlign.center),
  //         actions: [
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Expanded(
  //                 child: AppButtonOutlined(
  //                   onPressed: onCancelActionPressed,
  //                   text: cancelActionText,
  //                   visualDensity: VisualDensity.compact,
  //                   backgroundColor: cancelActionBgColor ?? context.themeColors.scaffoldColor,
  //                 ),
  //               ),
  //               SizedBox(width: AppSize.w16),
  //               Expanded(
  //                 child: isLoadingDefaultAction != null
  //                     ? ValueListenableBuilder<bool>(
  //                         valueListenable: isLoadingDefaultAction,
  //                         builder: (context, isLoading, child) {
  //                           return AppButton(
  //                             onPressed: onDefaultActionPressed,
  //                             text: defaultActionText,
  //                             visualDensity: VisualDensity.compact,
  //                             textStyle: BuildContextEx(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
  //                             isLoading: isLoading,
  //                             backgroundColor: defaultActionBgColor ?? context.themeColors.primary,
  //                           );
  //                         },
  //                       )
  //                     : AppButton(
  //                         onPressed: onDefaultActionPressed,
  //                         text: defaultActionText,
  //                         visualDensity: VisualDensity.compact,
  //                         textStyle: BuildContextEx(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
  //                         backgroundColor: defaultActionBgColor ?? context.themeColors.primary,
  //                       ),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     );
}
