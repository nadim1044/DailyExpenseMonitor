import 'package:daily_expense_monitor_app/app/db/models/transaction_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TransactionModel', () {
    test('fromJson parses correctly', () {
      final json = {
        'id': 1,
        'title': 'Coffee',
        'amount': 120.0,
        'date': '2024-01-01'
      };

      final model = TransactionModel.fromMap(json);

      expect(model.title, 'Coffee');
      expect(model.amount, 120.0);
    });

    test('toJson converts correctly', () {
      final model = TransactionModel(
        id: 1,
        title: 'Coffee',
        amount: 120.0,
        date: '2024-01-01',
      );

      final json = model.toMap();

      expect(json['title'], 'Coffee');
      expect(json['amount'], 120.0);
    });
  });
}
