import 'package:daily_expense_monitor_app/app/db/db_helper.dart';
import 'package:daily_expense_monitor_app/app/db/models/transaction_model.dart';
import 'package:daily_expense_monitor_app/features/data/datasource/transaction_datasource.dart';
import 'package:daily_expense_monitor_app/features/domain/entities/transactions_entities.dart';
import 'package:daily_expense_monitor_app/utils/logger.dart';

class TransactionDatasourceImpl implements TransactionDataSource {
  @override
  Future<List<TransactionsEntities>> getTransactions() async {
    final data = await DatabaseHelper().getTransactions();

    return data
        .map((model) => TransactionsEntities(
              id: model.id.toString(),
              title: model.title,
              amount: model.amount,
              date: DateTime.now(),
            ))
        .toList();
  }

  @override
  Future<int> addTransactions(TransactionsEntities transaction) {
    final transactionModel = TransactionModel.fromMap(transaction.toJson());
    'Transaction Model ${transaction.toJson()}'.logD;
    return DatabaseHelper().insertTransaction(transactionModel);
  }
}
