import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/mocks.dart';

void main() {
  late MockTransactionRepository dataRepository;
  setUp(
    () {
      dataRepository = MockTransactionRepository();
    },
  );

  test(
    'Get Transactions',
    () async {
      when(() => dataRepository.getTransactions()).thenAnswer(
        (_) async => [],
      );

      final result = await dataRepository.getTransactions();

      expect(result, isA<List>());
    },
  );

  test('addTransactions returns inserted id', () async {
    final transaction = FakeTransactionsEntities();
    when(() => dataRepository.addTransaction(transaction))
        .thenAnswer((_) async => 1);

    final result = await dataRepository.addTransaction(transaction);

    expect(result, 1);
  });
}
