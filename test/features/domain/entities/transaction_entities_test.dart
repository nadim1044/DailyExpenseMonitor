import 'package:daily_expense_monitor_app/app/db/models/transaction_model.dart';
import 'package:daily_expense_monitor_app/features/domain/entities/transactions_entities.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TransactionsEntities |', () {
    // Fixture
    const tEntity = TransactionsEntities(
      id: '1',
      title: 'Tea',
      amount: 10.0,
      date: '2024-01-01',
    );

    // ─────────────────────────────────────────
    // toJson
    // ─────────────────────────────────────────
    group('toJson |', () {
      test('should return a Map with all correct fields', () {
        final json = tEntity.toJson();

        expect(json['title'], 'Tea');
        expect(json['amount'], 10.0);
        expect(json['date'], '2024-01-01');
      });

      test('should contain exactly the expected keys', () {
        final json = tEntity.toJson();

        expect(json.keys, containsAll(['id', 'title', 'amount', 'date']));
        expect(json.length, 4); // no unexpected extra keys
      });

      test('should handle zero amount', () {
        const entity = TransactionsEntities(
          id: '2',
          title: 'Free',
          amount: 0.0,
          date: '2024-01-01',
        );

        final json = entity.toJson();

        expect(json['amount'], 0.0);
      });

      test('should handle empty title', () {
        const entity = TransactionsEntities(
          id: '3',
          title: '',
          amount: 5.0,
          date: '2024-01-01',
        );

        final json = entity.toJson();

        expect(json['title'], '');
      });
    });

    // ─────────────────────────────────────────
    // toModel
    // ─────────────────────────────────────────
    group('toModel |', () {
      test('should return a TransactionModel with all fields correctly mapped',
          () {
        final model = tEntity.toModel();

        expect(model, isA<TransactionModel>());
        expect(model.title, tEntity.title);
        expect(model.amount, tEntity.amount);
        expect(model.date, tEntity.date);
      });
    });

    // ─────────────────────────────────────────
    // Equality
    // ─────────────────────────────────────────
    group('equality |', () {
      test('two entities with same fields should be equal', () {
        const entity1 = TransactionsEntities(
          id: '1',
          title: 'Tea',
          amount: 10.0,
          date: '2024-01-01',
        );
        const entity2 = TransactionsEntities(
          id: '1',
          title: 'Tea',
          amount: 10.0,
          date: '2024-01-01',
        );

        expect(entity1, equals(entity2));
      });

      test('two entities with different amounts should not be equal', () {
        const entity1 = TransactionsEntities(
          id: '1',
          title: 'Tea',
          amount: 10.0,
          date: '2024-01-01',
        );
        const entity2 = TransactionsEntities(
          id: '1',
          title: 'Tea',
          amount: 99.0,
          date: '2024-01-01',
        );

        expect(entity1, isNot(equals(entity2)));
      });
    });
  });
}
