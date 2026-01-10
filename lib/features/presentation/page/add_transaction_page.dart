import 'package:daily_expense_monitor_app/features/domain/entities/transactions_entities.dart';
import 'package:daily_expense_monitor_app/features/presentation/controllers/add_transaction_controller.dart';
import 'package:daily_expense_monitor_app/l10n/l10n.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 10),
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
              const SizedBox(height: 20),
              Obx(() => ElevatedButton(
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
                    child: controller.isSaving.value
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text("Add"),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
