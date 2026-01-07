import 'package:daily_expense_monitor_app/features/domain/entities/transactions_entities.dart';
import 'package:daily_expense_monitor_app/res/dimension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionDetailsPage extends StatelessWidget {
  TransactionDetailsPage({super.key});

  final transaction = Get.arguments as TransactionsEntities;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Details'),
      ),
      body: Padding(
          padding: EdgeInsets.all(AppSize.h12),
          child: Text(
            'Transaction Info \n${transaction.toJson()}',
            style: TextStyle(fontSize: AppSize.sp18),
          )),
    );
  }
}
