import 'package:daily_expense_monitor_app/app_routes/app_routes.dart';
import 'package:daily_expense_monitor_app/features/presentation/controllers/get_transactions_controller.dart';
import 'package:daily_expense_monitor_app/l10n/l10n.dart';
import 'package:daily_expense_monitor_app/shared/widgets/app_custom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionsPage extends GetView<GetTransactionsController> {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppCustomAppBar(title: Text(context.l10n.transactions)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Obx(
              () => Expanded(
                child: ListView.builder(
                  itemCount: controller.transactions.length,
                  itemBuilder: (context, index) {
                    final txn = controller.transactions[index];
                    return ListTile(
                      title: Text(txn.title),
                      subtitle: Text('₹${txn.amount.toStringAsFixed(2)}'),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.addTransaction)?.then(
            (value) {
              Get.find<GetTransactionsController>().loadTransactions();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
