import 'dart:async' show Timer;

import 'package:daily_expense_monitor_app/res/dimension.dart';
import 'package:daily_expense_monitor_app/shared/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';

/// Global app button [FilledButton]
class AppButton extends StatefulWidget {
  /// constructor
  const AppButton({
    required this.text,
    super.key,
    this.isLoading = false,
    this.isDisabled = false,
    this.showIconOnly = false,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.buttonStyle,
    this.icon,
    this.visualDensity,
    this.textStyle,
  });

  /// text of button
  final String text;

  /// on pressed function
  final VoidCallback? onPressed;

  /// is loading
  final bool isLoading;

  /// is disabled
  final bool isDisabled;

  /// background color of button
  final Color? backgroundColor;

  /// foreground color of button for which is apply to text
  final Color? foregroundColor;

  /// button Style
  final ButtonStyle? buttonStyle;

  /// Visual density for button
  final VisualDensity? visualDensity;

  /// Text style for button
  final TextStyle? textStyle;

  /// Icon for button
  final Widget? icon;

  /// Flag to show only icon
  final bool showIconOnly;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _isProcessing = false;
  Timer? _debounceTimer;

  void _handleTap() {
    if (_isProcessing) return;

    _isProcessing = true;
    widget.onPressed?.call();

    _debounceTimer = Timer(
      const Duration(milliseconds: 500),
      () => _isProcessing = false,
    );
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: widget.isDisabled
          ? null
          : widget.isLoading
              ? () {}
              : _handleTap,
      style: widget.buttonStyle ??
          FilledButton.styleFrom(
            backgroundColor: widget.backgroundColor,
            foregroundColor: widget.foregroundColor,
            visualDensity: widget.visualDensity,
          ),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 240),
        child: widget.isLoading
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: AppSize.h12),
                child: const FittedBox(fit: BoxFit.scaleDown, child: LoadingIndicator()))
            : (widget.icon != null && widget.showIconOnly)
                ? widget.icon!
                : (widget.icon != null)
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          widget.icon!,
                          SizedBox(width: AppSize.w6),
                          Text(
                            widget.text,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: widget.textStyle,
                          ),
                        ],
                      )
                    : Text(
                        widget.text,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: widget.textStyle,
                      ),
      ),
    );
  }
}
