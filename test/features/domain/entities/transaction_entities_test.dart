import 'package:daily_expense_monitor_app/app/db/models/transaction_model.dart';
import 'package:daily_expense_monitor_app/features/domain/entities/transactions_entities.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TransactionsEntities |', () {
    // Fixture
    final tEntity = TransactionsEntities(
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

        expect(json['id'], '1');
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
        final entity = TransactionsEntities(
          id: '2',
          title: 'Free',
          amount: 0.0,
          date: '2024-01-01',
        );

        final json = entity.toJson();

        expect(json['amount'], 0.0);
      });

      test('should handle empty title', () {
        final entity = TransactionsEntities(
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

      test('should correctly convert String id to int', () {
        // Entity holds id as String, Model holds it as int
        final model = tEntity.toModel();

        expect(model.id, 1); // '1' → 1
      });

      test('should throw when id is not a valid integer string', () {
        final badEntity = TransactionsEntities(
          id: 'abc', // not parseable
          title: 'Tea',
          amount: 10.0,
          date: '2024-01-01',
        );

        expect(() => badEntity.toModel(), throwsFormatException);
      });
    });

    // ─────────────────────────────────────────
    // Equality
    // ─────────────────────────────────────────
    group('equality |', () {
      test('two entities with same fields should be equal', () {
        final entity1 = TransactionsEntities(
          id: '1',
          title: 'Tea',
          amount: 10.0,
          date: '2024-01-01',
        );
        final entity2 = TransactionsEntities(
          id: '1',
          title: 'Tea',
          amount: 10.0,
          date: '2024-01-01',
        );

        expect(entity1, equals(entity2));
      });

      test('two entities with different amounts should not be equal', () {
        final entity1 = TransactionsEntities(
          id: '1',
          title: 'Tea',
          amount: 10.0,
          date: '2024-01-01',
        );
        final entity2 = TransactionsEntities(
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
