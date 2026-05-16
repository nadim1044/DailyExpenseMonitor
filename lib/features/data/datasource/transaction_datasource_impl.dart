import 'package:daily_expense_monitor_app/app/db/db_helper.dart';
import 'package:daily_expense_monitor_app/app/db/models/transaction_model.dart';
import 'package:daily_expense_monitor_app/app/error/exceptions.dart';
import 'package:daily_expense_monitor_app/features/data/datasource/transaction_datasource.dart';
import 'package:daily_expense_monitor_app/utils/logger.dart';

class TransactionDatasourceImpl implements TransactionDataSource {
  const TransactionDatasourceImpl(this._dbHelper);

  final DatabaseHelper _dbHelper;

  @override
  Future<List<TransactionModel>> getTransactions() async {
    try {
      final data = await _dbHelper.getTransactions();
      return data
          .map((model) => TransactionModel(
                id: model.id,
                title: model.title,
                amount: model.amount,
                date: model.date,
              ))
          .toList();
    } catch (e) {
      throw const DatabaseException('Can not load from database.');
    }
  }

  @override
  Future<int> addTransactions(TransactionModel transaction) {
    'Transaction Model ${transaction.toMap()}'.logD;
    try {
      return _dbHelper.insertTransaction(transaction);
    } catch (e) {
      throw const DatabaseException('Failed to complete transaction');
    }
  }
}
