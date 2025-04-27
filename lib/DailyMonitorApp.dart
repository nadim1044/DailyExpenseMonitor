import 'package:daily_expense_monitor_app/app_routes/app_pages.dart';
import 'package:daily_expense_monitor_app/app_routes/app_routes.dart';
import 'package:daily_expense_monitor_app/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Manager',
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
      routingCallback: (routes) {
        'Routes ${routes?.current}'.logD;
        if (routes?.current != null && routes?.current == AppRoutes.splash) {
          Future.microtask(() {
            Get.toNamed(AppRoutes.transactionDetails);
          });
        }
      },
    );
  }
}
