import 'package:daily_expense_monitor_app/features/data/datasource/transaction_datasource.dart';
import 'package:daily_expense_monitor_app/features/domain/entities/transactions_entities.dart';
import 'package:daily_expense_monitor_app/features/domain/repositories/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionDataSource dataSource;

  TransactionRepositoryImpl(this.dataSource);

  @override
  Future<List<TransactionsEntities>> getTransactions() {
    return dataSource.getTransactions();
  }
}
