import 'package:daily_expense_monitor_app/extensions/ext_build_context.dart';
import 'package:flutter/material.dart';

class AppDropdownInput<T> extends StatelessWidget {
  final String hintText;
  final List<T> options;
  final T value;
  final String Function(T) getLabel;
  final void Function(T) onChanged;

  const AppDropdownInput({
    super.key,
    this.hintText = 'Please select an Option',
    this.options = const [],
    required this.getLabel,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      builder: (FormFieldState<T> state) {
        return InputDecorator(
          decoration: InputDecoration(
            labelText: hintText,
            filled: true,
            fillColor: context.theme.cardColor,
          ),
          isEmpty: value == null || value == '',
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: value,
              isDense: true,
              onChanged: (value) {
                onChanged(value as T);
              },
              items: options.map((T value) {
                return DropdownMenuItem<T>(
                  value: value,
                  child: Text(
                    getLabel(value),
                    style: BuildContextEx(context).theme.textTheme.bodyMedium,
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
