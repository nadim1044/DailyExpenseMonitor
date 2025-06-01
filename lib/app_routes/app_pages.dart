// lib/routes/pages.dart

import 'package:daily_expense_monitor_app/app_routes/app_routes.dart';
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
    ),
    GetPage(
      name: AppRoutes.addTransaction,
      page: () => AddTransactionPage(),
    ),
    GetPage(
      name: AppRoutes.transactionDetails,
      page: () => const TransactionDetailsPage(),
    ),
  ];
}
