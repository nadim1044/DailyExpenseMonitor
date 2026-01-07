// lib/routes/pages.dart

import 'package:daily_expense_monitor_app/app_routes/app_routes.dart';
import 'package:daily_expense_monitor_app/features/presentation/binding/add_transaction_binding.dart';
import 'package:daily_expense_monitor_app/features/presentation/binding/get_transactions_binding.dart';
import 'package:daily_expense_monitor_app/features/presentation/page/add_transaction_page.dart';
import 'package:daily_expense_monitor_app/features/presentation/page/transaction_details_page.dart';
import 'package:daily_expense_monitor_app/features/presentation/page/transactions_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const Scaffold(
        body: Scaffold(),
      ),
    ),
    GetPage(
      name: AppRoutes.transactions,
      page: () => const TransactionsPage(),
      binding: GetTransactionsBinding(),
    ),
    GetPage(
        name: AppRoutes.addTransaction,
        page: () => AddTransactionPage(),
        binding: AddTransactionBinding()),
    GetPage(
      name: AppRoutes.transactionDetails,
      page: () => TransactionDetailsPage(),
    ),
  ];
}
