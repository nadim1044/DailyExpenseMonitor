import 'package:daily_expense_monitor_app/features/domain/entities/transactions_entities.dart';
import 'package:daily_expense_monitor_app/features/presentation/controllers/add_transaction_controller.dart';
import 'package:daily_expense_monitor_app/l10n/l10n.dart';
import 'package:daily_expense_monitor_app/shared/widgets/app_custom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTransactionPage extends StatelessWidget {
  AddTransactionPage({super.key});

  final titleController = TextEditingController();
  final amountController = TextEditingController();

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
                controller: titleController,
                decoration: const InputDecoration(labelText: "Title"),
              ),
              TextField(
                key: const Key('transaction_amount_field'),
                controller: amountController,
                decoration: const InputDecoration(labelText: "Amount"),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                key: const Key('submit_transaction_button'),
                onPressed: () {
                  final title = titleController.text;
                  final amount = double.tryParse(amountController.text) ?? 0;
                  if (title.isNotEmpty && amount > 0) {
                    final TransactionsEntities txn = TransactionsEntities(
                      id: '',
                      title: title,
                      amount: amount,
                      date: DateTime.now().toIso8601String(),
                    );

                    final controller = Get.find<AddTransactionController>();
                    controller.addTransaction(txn);
                    Get.back(); // close the screen
                  }
                },
                child: const Text("Add"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
