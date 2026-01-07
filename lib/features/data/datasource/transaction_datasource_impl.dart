import 'package:daily_expense_monitor_app/app/db/db_helper.dart';
import 'package:daily_expense_monitor_app/app/db/models/transaction_model.dart';
import 'package:daily_expense_monitor_app/features/data/datasource/transaction_datasource.dart';
import 'package:daily_expense_monitor_app/utils/logger.dart';

class TransactionDatasourceImpl implements TransactionDataSource {
  @override
  Future<List<TransactionModel>> getTransactions() async {
    final data = await DatabaseHelper().getTransactions();

    return data
        .map((model) => TransactionModel(
              id: model.id,
              title: model.title,
              amount: model.amount,
              date: model.date,
            ))
        .toList();
  }

  @override
  Future<int> addTransactions(TransactionModel transaction) {
    'Transaction Model ${transaction.toMap()}'.logD;
    return DatabaseHelper().insertTransaction(transaction);
  }
}
