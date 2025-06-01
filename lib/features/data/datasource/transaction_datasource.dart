import 'package:daily_expense_monitor_app/features/domain/entities/transactions_entities.dart';

abstract class TransactionDataSource {
  Future<List<TransactionsEntities>> getTransactions();

  Future<int> addTransactions(TransactionsEntities transaction);
}
