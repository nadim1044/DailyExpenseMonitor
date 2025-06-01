class TransactionsEntities {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  TransactionsEntities({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'date': date.toIso8601String(), // ISO format for DateTime
    };
  }
}
