import 'package:daily_expense_monitor_app/app/db/db_helper.dart';
import 'package:daily_expense_monitor_app/app/db/models/transaction_model.dart';
import 'package:daily_expense_monitor_app/utils/logger.dart';
import 'package:get/get.dart';

class AddTransactionController extends GetxController {
  Future<void> addTransaction(TransactionModel txn) async {
    'Transaction Model ${txn.toMap()}'.logD;
    await DatabaseHelper().insertTransaction(txn);
  }
}
