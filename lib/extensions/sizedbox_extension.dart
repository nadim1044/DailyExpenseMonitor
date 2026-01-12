import 'package:flutter/widgets.dart';

extension SizedBoxExtension on double {
  /// Height SizedBox
  SizedBox get sizedBoxHeight => SizedBox(height: toDouble());

  /// Width SizedBox
  SizedBox get sizedBoxWidth => SizedBox(width: toDouble());
}
