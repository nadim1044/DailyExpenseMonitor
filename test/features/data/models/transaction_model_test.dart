import 'package:daily_expense_monitor_app/app/db/models/transaction_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TransactionModel', () {
    final tModel = TransactionModel(
      title: 'Coffee',
      amount: 10,
      date: DateTime.now().toIso8601String(),
      id: 1,
    );

    test(
      'toMap',
      () {
        final modelMap = tModel.toMap();

        expect(modelMap['id'], 1);
        expect(modelMap['amount'], 10);
        expect(modelMap['title'], 'Coffee');
      },
    );

    test(
      'fromMap',
      () {
        final json = {
          'id': 1,
          'title': 'Coffee',
          'amount': 120.0,
          'date': '2024-01-01'
        };
        final fromMapModel = TransactionModel.fromMap(json);

        expect(fromMapModel.title, 'Coffee');
        expect(fromMapModel.amount, 120.0);
        expect(fromMapModel.date, '2024-01-01');
        expect(fromMapModel.id, 1);
      },
    );
  });
}
