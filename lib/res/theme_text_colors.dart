// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

/// Theme extension for text colors
@immutable
class ThemeTextColors extends ThemeExtension<ThemeTextColors> {
  /// constructor
  const ThemeTextColors({
    required this.text,
    required this.textField,
    required this.textFieldHint,
    required this.textFieldBorder,
    required this.textButtonDisabled,
    required this.textDisabled,
    required this.textFieldErrorBorder,
    required this.whiteTextColor,
    required this.blackTextColor,
    required this.historyViewTextColor,
    required this.contactTitleColor,
    required this.darkMistSubTitle,
    required this.kPurpleLight,
    required this.neonBlueLinksColor,
    required this.communitySkipText,
    required this.chatTimeText,
    required this.goldTextColor,
    required this.filledTextFieldHintColor,
  });

  final Color text;
  final Color textField;
  final Color textFieldHint;
  final Color textFieldBorder;
  final Color textButtonDisabled;
  final Color textDisabled;
  final Color textFieldErrorBorder;
  final Color whiteTextColor;
  final Color blackTextColor;
  final Color historyViewTextColor;
  final Color contactTitleColor;
  final Color darkMistSubTitle;
  final Color kPurpleLight;
  final Color neonBlueLinksColor;
  final Color communitySkipText;
  final Color chatTimeText;
  final Color goldTextColor;
  final Color filledTextFieldHintColor;

  @override
  ThemeExtension<ThemeTextColors> copyWith({
    Color? text,
    Color? textField,
    Color? textFieldHint,
    Color? textFieldBorder,
    Color? textButtonDisabled,
    Color? textDisabled,
    Color? textFieldErrorBorder,
    Color? whiteTextColor,
    Color? blackTextColor,
    Color? historyViewTextColor,
    Color? contactTitleColor,
    Color? darkMistSubTitle,
    Color? kPurpleLight,
    Color? neonBlueLinksColor,
    Color? communitySkipText,
    Color? chatTimeText,
    Color? goldTextColor,
    Color? filledTextFieldHintColor,
  }) {
    return ThemeTextColors(
      text: text ?? this.text,
      textField: textField ?? this.textField,
      textFieldHint: textFieldHint ?? this.textFieldHint,
      textFieldBorder: textFieldBorder ?? this.textFieldBorder,
      textButtonDisabled: textButtonDisabled ?? this.textButtonDisabled,
      textDisabled: textDisabled ?? this.textDisabled,
      textFieldErrorBorder: textFieldErrorBorder ?? this.textFieldErrorBorder,
      whiteTextColor: whiteTextColor ?? this.whiteTextColor,
      blackTextColor: blackTextColor ?? this.blackTextColor,
      historyViewTextColor: historyViewTextColor ?? this.historyViewTextColor,
      contactTitleColor: contactTitleColor ?? this.contactTitleColor,
      darkMistSubTitle: darkMistSubTitle ?? this.darkMistSubTitle,
      kPurpleLight: kPurpleLight ?? this.kPurpleLight,
      neonBlueLinksColor: neonBlueLinksColor ?? this.neonBlueLinksColor,
      communitySkipText: communitySkipText ?? this.communitySkipText,
      chatTimeText: chatTimeText ?? this.chatTimeText,
      goldTextColor: goldTextColor ?? this.goldTextColor,
      filledTextFieldHintColor: filledTextFieldHintColor ?? this.filledTextFieldHintColor,
    );
  }

  @override
  ThemeExtension<ThemeTextColors> lerp(covariant ThemeExtension<ThemeTextColors>? other, double t) {
    if (other is! ThemeTextColors) {
      return this;
    }
    return ThemeTextColors(
      text: Color.lerp(text, other.text, t)!,
      textField: Color.lerp(textField, other.textField, t)!,
      textFieldHint: Color.lerp(textFieldHint, other.textFieldHint, t)!,
      textFieldBorder: Color.lerp(textFieldBorder, other.textFieldBorder, t)!,
      textButtonDisabled: Color.lerp(textButtonDisabled, other.textButtonDisabled, t)!,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t)!,
      textFieldErrorBorder: Color.lerp(textFieldErrorBorder, other.textFieldErrorBorder, t)!,
      whiteTextColor: Color.lerp(whiteTextColor, other.whiteTextColor, t)!,
      blackTextColor: Color.lerp(blackTextColor, other.blackTextColor, t)!,
      historyViewTextColor: Color.lerp(historyViewTextColor, other.historyViewTextColor, t)!,
      contactTitleColor: Color.lerp(contactTitleColor, other.contactTitleColor, t)!,
      darkMistSubTitle: Color.lerp(darkMistSubTitle, other.darkMistSubTitle, t)!,
      kPurpleLight: Color.lerp(kPurpleLight, other.kPurpleLight, t)!,
      neonBlueLinksColor: Color.lerp(neonBlueLinksColor, other.neonBlueLinksColor, t)!,
      communitySkipText: Color.lerp(communitySkipText, other.communitySkipText, t)!,
      chatTimeText: Color.lerp(chatTimeText, other.chatTimeText, t)!,
      goldTextColor: Color.lerp(goldTextColor, other.goldTextColor, t)!,
      filledTextFieldHintColor: Color.lerp(filledTextFieldHintColor, other.filledTextFieldHintColor, t)!,
    );
  }
}
