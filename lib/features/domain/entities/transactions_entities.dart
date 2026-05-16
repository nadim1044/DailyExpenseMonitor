import 'package:daily_expense_monitor_app/app/db/models/transaction_model.dart';
import 'package:equatable/equatable.dart';

class TransactionsEntities extends Equatable {
  final String id;
  final String title;
  final double amount;
  final String date;

  TransactionsEntities({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': int.tryParse(id),
      'title': title,
      'amount': amount,
      'date': date,
    };
  }

  TransactionModel toModel() {
    return TransactionModel(title: title, amount: amount, date: date);
  }

  @override
  List<Object?> get props => [id, title, amount, date];
}
