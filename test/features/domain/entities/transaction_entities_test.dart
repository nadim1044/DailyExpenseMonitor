import 'package:daily_expense_monitor_app/features/domain/entities/transactions_entities.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TransactionEntities', () {
    test('toJson converts correctly', () {
      final model = TransactionsEntities(
        id: '1',
        title: 'Tea',
        amount: 10.0,
        date: '2024-01-01',
      );

      final json = model.toJson();

      expect(json['title'], 'Tea');
      expect(json['amount'], 10.0);
    });
  });
}
