import 'package:daily_expense_monitor_app/app/db/models/transaction_model.dart';
import 'package:daily_expense_monitor_app/app/error/exceptions.dart';
import 'package:daily_expense_monitor_app/features/data/repositories/transaction_repository_impl.dart';
import 'package:daily_expense_monitor_app/features/domain/entities/transactions_entities.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/mocks.dart'
    show MockTransactionDataSource, FakeTransactionModel;

void main() {
  late MockTransactionDataSource mockDataSource;
  late TransactionRepositoryImpl repository;

  // Fixtures
  final tTransactionModel = TransactionModel(
    id: 1,
    title: 'Coffee',
    amount: 5.0,
    date: '2024-01-01',
  );

  const tTransactionEntity = TransactionsEntities(
    id: '1',
    title: 'Coffee',
    amount: 5.0,
    date: '2024-01-01',
  );

  setUpAll(() {
    registerFallbackValue(FakeTransactionModel());
  });

  setUp(() {
    mockDataSource = MockTransactionDataSource();
    repository = TransactionRepositoryImpl(mockDataSource); // ✅ real class
  });

  // ─────────────────────────────────────────────
  // getTransactions
  // ─────────────────────────────────────────────
  group('getTransactions |', () {
    test(
      'should call datasource.getTransactions once',
      () async {
        // arrange
        when(() => mockDataSource.getTransactions())
            .thenAnswer((_) async => [tTransactionModel]);

        // act
        await repository.getTransactions();

        // assert
        verify(() => mockDataSource.getTransactions()).called(1);
      },
    );

    test(
      'should return List<TransactionsEntities> mapped from datasource models',
      () async {
        // arrange
        when(() => mockDataSource.getTransactions())
            .thenAnswer((_) async => [tTransactionModel]);

        // act
        final result = await repository.getTransactions();

        // assert
        expect(result, isA<List<TransactionsEntities>>());
        expect(result.length, 1);
      },
    );

    test(
      'should correctly map each field from TransactionModel to TransactionsEntities',
      () async {
        // arrange
        when(() => mockDataSource.getTransactions())
            .thenAnswer((_) async => [tTransactionModel]);

        // act
        final result = await repository.getTransactions();
        final entity = result.first;

        // assert — this is where int id → String id conversion is verified
        expect(entity.id, '1'); // '${transaction.id}' cast
        expect(entity.title, 'Coffee');
        expect(entity.amount, 5.0);
        expect(entity.date, '2024-01-01');
      },
    );

    test(
      'should return empty list when datasource returns no records',
      () async {
        // arrange
        when(() => mockDataSource.getTransactions())
            .thenAnswer((_) async => []);

        // act
        final result = await repository.getTransactions();

        // assert
        expect(result, isEmpty);
      },
    );

    test(
      'should map multiple models to entities preserving order',
      () async {
        // arrange
        final models = [
          TransactionModel(
              id: 1, title: 'Coffee', amount: 5.0, date: '2024-01-01'),
          TransactionModel(
              id: 2, title: 'Lunch', amount: 12.5, date: '2024-01-02'),
        ];
        when(() => mockDataSource.getTransactions())
            .thenAnswer((_) async => models);

        // act
        final result = await repository.getTransactions();

        // assert
        expect(result.length, 2);
        expect(result[0].id, '1');
        expect(result[1].id, '2');
        expect(result[1].title, 'Lunch');
      },
    );

    test(
      'should propagate exception when datasource throws',
      () async {
        // arrange
        when(() => mockDataSource.getTransactions())
            .thenThrow(const DatabaseException('Can not load from database.'));

        // act & assert
        expect(
          () => repository.getTransactions(),
          throwsA(isA<DatabaseException>()),
        );
      },
    );
  });

  // ─────────────────────────────────────────────
  // addTransaction
  // ─────────────────────────────────────────────
  group('addTransaction |', () {
    test(
      'should return inserted row id from datasource',
      () async {
        // arrange
        when(() => mockDataSource.addTransactions(any()))
            .thenAnswer((_) async => 1);

        // act
        final result = await repository.addTransaction(tTransactionEntity);

        // assert
        expect(result, 1);
      },
    );

    test(
      'should call datasource.addTransactions once with the converted model',
      () async {
        // arrange
        when(() => mockDataSource.addTransactions(any()))
            .thenAnswer((_) async => 1);

        // act
        await repository.addTransaction(tTransactionEntity);

        // assert — verifies entity.toModel() was called and forwarded
        verify(() => mockDataSource.addTransactions(any())).called(1);
      },
    );

    test(
      'should forward the correctly converted TransactionModel to datasource',
      () async {
        // arrange
        when(() => mockDataSource.addTransactions(any()))
            .thenAnswer((_) async => 1);

        // act
        await repository.addTransaction(tTransactionEntity);

        // assert — capture and verify the model fields
        final captured = verify(
          () => mockDataSource.addTransactions(captureAny()),
        ).captured;

        final capturedModel = captured.first as TransactionModel;
        expect(capturedModel.title, tTransactionEntity.title);
        expect(capturedModel.amount, tTransactionEntity.amount);
        expect(capturedModel.date, tTransactionEntity.date);
      },
    );

    test(
      'should propagate exception when datasource throws',
      () async {
        // arrange
        when(() => mockDataSource.addTransactions(any())).thenThrow(
            const DatabaseException('Failed to complete transaction'));

        // act & assert
        expect(
          () => repository.addTransaction(tTransactionEntity),
          throwsA(isA<DatabaseException>()),
        );
      },
    );
  });
}
