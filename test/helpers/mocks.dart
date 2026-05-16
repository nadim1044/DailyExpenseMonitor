import 'package:daily_expense_monitor_app/app/db/db_helper.dart';
import 'package:daily_expense_monitor_app/app/db/models/transaction_model.dart';
import 'package:daily_expense_monitor_app/features/data/datasource/transaction_datasource.dart';
import 'package:daily_expense_monitor_app/features/domain/entities/transactions_entities.dart';
import 'package:daily_expense_monitor_app/features/domain/repositories/transaction_repository.dart';
import 'package:daily_expense_monitor_app/features/domain/usecase/add_transaction_usecase.dart';
import 'package:daily_expense_monitor_app/features/domain/usecase/get_transactions_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockTransactionRepository extends Mock implements TransactionRepository {}

class MockTransactionDataSource extends Mock implements TransactionDataSource {}

class FakeTransactionModel extends Fake implements TransactionModel {}

class FakeTransactionsEntities extends Fake implements TransactionsEntities {}

class FakeGetTransactionsUseCase extends Mock
    implements GetTransactionsUseCase {
  @override
  Future<List<TransactionsEntities>> call() async {
    return <TransactionsEntities>[];
  }
}

class FakeAddTransactionUseCase extends Mock implements AddTransactionUseCase {
  int callCount = 0;
  TransactionsEntities? lastSubmitted;

  @override
  Future<int> call(TransactionsEntities transaction) async {
    callCount++;
    lastSubmitted = transaction;
    return 1;
  }
}

class MockDatabaseHelper extends Mock implements DatabaseHelper {}
