import 'package:daily_expense_monitor_app/features/domain/entities/transactions_entities.dart';
import 'package:daily_expense_monitor_app/features/domain/repositories/transaction_repository.dart';

class GetTransactionsUseCase {
  final TransactionRepository repository;

  GetTransactionsUseCase(this.repository);

  Future<List<TransactionsEntities>> call() async {
    return await repository.getTransactions();
  }
}
