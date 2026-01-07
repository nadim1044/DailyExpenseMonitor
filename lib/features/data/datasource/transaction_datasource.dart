import 'package:daily_expense_monitor_app/app/db/models/transaction_model.dart';

abstract class TransactionDataSource {
  Future<List<TransactionModel>> getTransactions();

  Future<int> addTransactions(TransactionModel transaction);
}
