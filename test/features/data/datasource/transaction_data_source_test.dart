import 'package:daily_expense_monitor_app/features/data/repositories/transaction_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/mocks.dart';

void main() {
  late MockTransactionDataSource dataSource;
  late MockTransactionRepository dataRepository;
  late TransactionRepositoryImpl repository;

  setUp(() {
    dataSource = MockTransactionDataSource();
    dataRepository = MockTransactionRepository();
    repository = TransactionRepositoryImpl(dataSource);
  });

  test('fetchTransactions returns list', () async {
    when(() => dataSource.getTransactions()).thenAnswer((_) async => []);

    final result = await repository.getTransactions();

    expect(result, isA<List>());
  });

  test('addTransactions returns inserted id', () async {
    final transaction = FakeTransactionsEntities();
    when(() => dataSource.addTransactions(transaction))
        .thenAnswer((_) async => 1);

    final result = await dataSource.addTransactions(transaction);

    expect(result, 1);
  });
}
