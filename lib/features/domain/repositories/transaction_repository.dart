import 'package:daily_expense_monitor_app/features/domain/entities/transactions_entities.dart';

abstract class TransactionRepository {
  Future<List<TransactionsEntities>> getTransactions();
}
