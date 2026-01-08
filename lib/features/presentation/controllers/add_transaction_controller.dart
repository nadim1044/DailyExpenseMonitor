import 'package:daily_expense_monitor_app/features/domain/entities/transactions_entities.dart';
import 'package:daily_expense_monitor_app/features/domain/usecase/add_transaction_usecase.dart';
import 'package:daily_expense_monitor_app/utils/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddTransactionController extends GetxController {
  AddTransactionController({
    required this.addTransactionUseCase,
  });

  final AddTransactionUseCase addTransactionUseCase;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  Future<void> addTransaction(TransactionsEntities txn) async {
    'Transaction Model ${txn.toJson()}'.logD;
    await addTransactionUseCase.call(txn);
  }
}
