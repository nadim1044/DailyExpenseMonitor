import 'package:daily_expense_monitor_app/extensions/ext_build_context.dart';
import 'package:daily_expense_monitor_app/res/dimension.dart';
import 'package:flutter/material.dart';

/// This is loading indicator widget
class LoadingIndicator extends StatelessWidget {
  /// Constructor
  const LoadingIndicator({super.key, this.progress, this.color, this.showLinearLoader = false, this.strokeWidth = 4.0});

  /// Loading progress between 0 - 1
  final double? progress;

  /// Color of loading indicator
  final Color? color;

  /// The width of the line used to draw the circle.
  final double strokeWidth;

  /// Flag for showing linear progress bar
  final bool showLinearLoader;

  @override
  Widget build(BuildContext context) {
    return showLinearLoader
        ? Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.w10),
            child: LinearProgressIndicator(
              value: progress,
            ),
          )
        : CircularProgressIndicator(
            strokeWidth: strokeWidth,
            valueColor: AlwaysStoppedAnimation<Color>(color ?? context.themeColors.backgroundColor),
            value: progress,
          );
  }
}
