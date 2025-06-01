import 'package:daily_expense_monitor_app/features/domain/entities/transactions_entities.dart';

class TransactionModel extends TransactionsEntities {
  TransactionModel({
    required super.id,
    required super.title,
    required super.amount,
    required super.date,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      title: json['title'],
      amount: json['amount'],
      date: DateTime.parse(json['date']),
    );
  }
}
