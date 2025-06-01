import 'package:daily_expense_monitor_app/extensions/ext_build_context.dart';
import 'package:daily_expense_monitor_app/res/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Global app custom appbar [AppBar]
class AppCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// constructor
  const AppCustomAppBar({
    super.key,
    this.title,
    this.leadingView,
    this.centerTitle = true,
    this.actions,
    this.bottom,
    this.leadingOnBackPressed,
    this.viewBackIcon = true,
    this.leadingWidth,
    this.appBarHeight,
    this.leadingIconSize,
    this.leadingIconColor,
    this.automaticallyImplyLeading = true,
    this.backgroundColor,
    this.titleSpacing,
    this.isPageAppBar = true,
    this.systemOverlayStyle,
  });

  /// title of appbar
  final Widget? title;

  /// leading view of appbar
  final Widget? leadingView;

  /// align title to center or not
  final bool centerTitle;

  /// actions of appbar
  final List<Widget>? actions;

  /// bottom of appbar
  final PreferredSizeWidget? bottom;

  /// on pressed leading icon
  final VoidCallback? leadingOnBackPressed;

  /// view back icon or not
  final bool viewBackIcon;

  /// Controls whether we should try to imply the leading widget if null (shows back button).
  final bool automaticallyImplyLeading;

  /// leading width
  final double? leadingWidth;

  /// height of appbar
  final double? appBarHeight;

  /// size of leading icon
  final double? leadingIconSize;

  /// color of leading icon
  final Color? leadingIconColor;

  /// used for background color of appbar
  final Color? backgroundColor;

  /// to set title spacing of appbar
  final double? titleSpacing;

  /// used for Call LogEvent for Page only, Not for Bottom sheet
  final bool isPageAppBar;

  /// System overlay style
  final SystemUiOverlayStyle? systemOverlayStyle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      titleSpacing: titleSpacing,
      leadingWidth: leadingWidth ?? (Navigator.canPop(context) ? null : 0),
      centerTitle: centerTitle,
      actions: actions,
      bottom: bottom,
      systemOverlayStyle: systemOverlayStyle,
      // forceMaterialTransparency: true,
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: backgroundColor ?? context.themeColors.backgroundColor,
      leading: viewBackIcon && Navigator.canPop(context)
          ? IconButton(
              onPressed: leadingOnBackPressed != null
                  ? () {
                      // if (isPageAppBar) Injector.instance<AnalyticManager>().onBackEvent();
                      leadingOnBackPressed!.call();
                    }
                  : () {
                      // if (isPageAppBar) Injector.instance<AnalyticManager>().onBackEvent();
                      if (Navigator.canPop(context)) {
                        Navigator.of(context).pop();
                      }
                    },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: leadingIconColor ?? context.themeColors.black,
                size: leadingIconSize ?? AppSize.h20,
              ),
            )
          : leadingView /*?? const SizedBox.shrink()*/,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight ?? kToolbarHeight);
}
