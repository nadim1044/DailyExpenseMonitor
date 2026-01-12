import 'package:daily_expense_monitor_app/extensions/ext_build_context.dart';
import 'package:daily_expense_monitor_app/extensions/sizedbox_extension.dart';
import 'package:daily_expense_monitor_app/features/domain/entities/transactions_entities.dart';
import 'package:daily_expense_monitor_app/l10n/l10n.dart';
import 'package:daily_expense_monitor_app/res/dimension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransactionDetailsPage extends StatelessWidget {
  final transaction = Get.arguments as TransactionsEntities;

  TransactionDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dateTime = DateTime.parse(transaction.date);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.transaction_details),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSize.h20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // AMOUNT (Hero)
            Text(
              '₹${transaction.amount.toStringAsFixed(2)}',
              style: BuildContextEx(context)
                  .theme
                  .textTheme
                  .labelLarge
                  ?.copyWith(
                      fontSize: AppSize.sp28,
                      color: BuildContextEx(context).themeColors.greenColor),
            ),

            AppSize.h8.sizedBoxHeight,
            // TITLE
            Text(
              transaction.title,
              style: BuildContextEx(context).textTheme.bodyLarge,
            ),

            AppSize.h20.sizedBoxHeight,
            const Divider(),

            _DetailRow(
              label: context.l10n.transaction_id,
              value: transaction.id,
            ),
            _DetailRow(
              label: context.l10n.date,
              value: DateFormat('dd MMM yyyy').format(dateTime),
            ),
            _DetailRow(
              label: context.l10n.time,
              value: DateFormat('hh:mm a').format(dateTime),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: BuildContextEx(context).textTheme.bodySmall,
          ),
          Text(
            value,
            style: BuildContextEx(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: context.themeColors.primary),
          ),
        ],
      ),
    );
  }
}
