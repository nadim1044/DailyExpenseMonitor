import 'package:daily_expense_monitor_app/features/domain/entities/transactions_entities.dart';
import 'package:daily_expense_monitor_app/features/domain/usecase/add_transaction_usecase.dart';
import 'package:daily_expense_monitor_app/features/presentation/controllers/base_controller.dart';
import 'package:daily_expense_monitor_app/utils/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddTransactionController extends BaseController {
  AddTransactionController({
    required this.addTransactionUseCase,
  });

  final AddTransactionUseCase addTransactionUseCase;

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final isSaving = false.obs;

  Future<void> addTransaction(TransactionsEntities txn) async {
    'Transaction Model ${txn.toJson()}'.logD;
    if (txn.amount <= 0) {
      Get.snackbar(
        'Failed',
        'Amount is equal or less than zero.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else if (txn.title.isEmpty) {
      Get.snackbar(
        'Failed',
        'Please enter title',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      isSaving.value = true;
      await addTransactionUseCase.call(txn);
      isSaving.value = false;
      Get.back();
    }
  }
}
