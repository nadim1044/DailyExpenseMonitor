import 'package:daily_expense_monitor_app/app/db/models/transaction_model.dart';
import 'package:daily_expense_monitor_app/app/error/exceptions.dart';
import 'package:daily_expense_monitor_app/features/data/datasource/transaction_datasource_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/mocks.dart';

void main() {
  late MockDatabaseHelper mockDbHelper;
  late TransactionDatasourceImpl datasource;

  // Reusable fixtures
  final tTransactionModel = TransactionModel(
    id: 1,
    title: 'Coffee',
    amount: 5.0,
    date: '2024-01-01',
  );

  final tRawDbResult = [
    TransactionModel(id: 1, title: 'Coffee', amount: 5.0, date: '2024-01-01'),
    TransactionModel(id: 2, title: 'Lunch', amount: 12.5, date: '2024-01-02'),
  ];

  setUpAll(() {
    registerFallbackValue(FakeTransactionModel());
  });

  setUp(() {
    mockDbHelper = MockDatabaseHelper();
    datasource = TransactionDatasourceImpl(mockDbHelper);
  });

  // ─────────────────────────────────────────────
  // getTransactions
  // ─────────────────────────────────────────────
  group('getTransactions |', () {
    test(
      'should return a List<TransactionModel> and map fields correctly on success',
      () async {
        // arrange
        when(() => mockDbHelper.getTransactions())
            .thenAnswer((_) async => tRawDbResult);

        // act
        final result = await datasource.getTransactions();

        // assert
        expect(result, isA<List<TransactionModel>>());
        expect(result.length, tRawDbResult.length);
        expect(result.first.id, 1);
        expect(result.first.title, 'Coffee');
        expect(result.first.amount, 5.0);
        expect(result.first.date, '2024-01-01');
        verify(() => mockDbHelper.getTransactions()).called(1);
      },
    );

    test(
      'should return an empty list when the database has no records',
      () async {
        // arrange
        when(() => mockDbHelper.getTransactions()).thenAnswer((_) async => []);

        // act
        final result = await datasource.getTransactions();

        // assert
        expect(result, isEmpty);
        verify(() => mockDbHelper.getTransactions()).called(1);
      },
    );

    test(
      'should throw DatabaseException when db call throws',
      () async {
        // arrange
        when(() => mockDbHelper.getTransactions())
            .thenThrow(const DatabaseException('Disk I/O error'));

        // act & assert
        expect(
          () async => datasource.getTransactions(),
          throwsA(isA<DatabaseException>()),
        );
        verify(() => mockDbHelper.getTransactions()).called(1);
      },
    );

    test(
      'should throw DatabaseException with correct message when db call throws',
      () async {
        // arrange
        when(() => mockDbHelper.getTransactions())
            .thenThrow(Exception('Disk I/O error'));

        // act & assert
        expect(
          () async => datasource.getTransactions(),
          throwsA(
            isA<DatabaseException>().having(
              (e) => e.message,
              'message',
              'Can not load from database.',
            ),
          ),
        );
      },
    );
  });

  // ─────────────────────────────────────────────
  // addTransactions
  // ─────────────────────────────────────────────
  group('addTransactions |', () {
    test(
      'should return the inserted row id on success',
      () async {
        // arrange
        when(() => mockDbHelper.insertTransaction(tTransactionModel))
            .thenAnswer((_) async => 1);

        // act
        final result = await datasource.addTransactions(tTransactionModel);

        // assert
        expect(result, 1);
        verify(() => mockDbHelper.insertTransaction(tTransactionModel))
            .called(1);
      },
    );

    test(
      'should pass the correct TransactionModel to DatabaseHelper',
      () async {
        // arrange
        when(() => mockDbHelper.insertTransaction(any()))
            .thenAnswer((_) async => 1);

        // act
        await datasource.addTransactions(tTransactionModel);

        // assert — verify the exact model was forwarded
        final captured = verify(
          () => mockDbHelper.insertTransaction(captureAny()),
        ).captured;

        final capturedModel = captured.first as TransactionModel;
        expect(capturedModel.id, tTransactionModel.id);
        expect(capturedModel.title, tTransactionModel.title);
        expect(capturedModel.amount, tTransactionModel.amount);
      },
    );

    test(
      'should throw DatabaseException when insert fails',
      () async {
        // arrange
        when(() => mockDbHelper.insertTransaction(any()))
            .thenThrow(Exception('Constraint violation'));

        // act & assert
        expect(
          () async => datasource.addTransactions(tTransactionModel),
          throwsA(isA<DatabaseException>()),
        );
      },
    );

    test(
      'should throw DatabaseException with correct message when insert fails',
      () async {
        // arrange
        when(() => mockDbHelper.insertTransaction(any()))
            .thenThrow(Exception('Constraint violation'));

        // act & assert
        expect(
          () async => datasource.addTransactions(tTransactionModel),
          throwsA(
            isA<DatabaseException>().having(
              (e) => e.message,
              'message',
              'Failed to complete transaction',
            ),
          ),
        );
      },
    );
  });
}
