import 'package:daily_expense_monitor_app/extensions/sizedbox_extension.dart';
import 'package:daily_expense_monitor_app/features/domain/entities/transactions_entities.dart';
import 'package:daily_expense_monitor_app/features/presentation/controllers/add_transaction_controller.dart';
import 'package:daily_expense_monitor_app/l10n/l10n.dart';
import 'package:daily_expense_monitor_app/res/dimension.dart';
import 'package:daily_expense_monitor_app/shared/widgets/app_custom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTransactionPage extends GetView<AddTransactionController> {
  const AddTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppCustomAppBar(title: Text(context.l10n.add_transactions)),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.h10),
          child: Column(
            children: [
              TextField(
                key: const Key('transaction_name_field'),
                controller: controller.titleController,
                decoration: const InputDecoration(labelText: "Title"),
              ),
              TextField(
                key: const Key('transaction_amount_field'),
                controller: controller.amountController,
                decoration: const InputDecoration(labelText: "Amount"),
                keyboardType: TextInputType.number,
              ),
              AppSize.h16.sizedBoxHeight,
              Obx(
                () => SizedBox(
                  height: AppSize.h48, // FIXED HEIGHT
                  width: double.infinity, // optional
                  child: ElevatedButton(
                    key: const Key('submit_transaction_button'),
                    onPressed: controller.isSaving.value
                        ? null
                        : () async {
                            final title = controller.titleController.text;
                            final amount = double.tryParse(
                                    controller.amountController.text) ??
                                0;

                            final txn = TransactionsEntities(
                              id: '',
                              title: title,
                              amount: amount,
                              date: DateTime.now().toIso8601String(),
                            );

                            await controller.addTransaction(txn);
                          },
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: controller.isSaving.value
                          ? SizedBox.square(
                              dimension: AppSize.h20,
                              key: const ValueKey('loader'),
                              child: const CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              'Add',
                              key: ValueKey('text'),
                            ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
