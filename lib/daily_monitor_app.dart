import 'package:daily_expense_monitor_app/app_routes/app_pages.dart';
import 'package:daily_expense_monitor_app/app_routes/app_routes.dart';
import 'package:daily_expense_monitor_app/res/theme_dark.dart';
import 'package:daily_expense_monitor_app/res/theme_light.dart';
import 'package:daily_expense_monitor_app/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'l10n/arb/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Expense Manager',
          supportedLocales: AppLocalizations.supportedLocales,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.light,
          initialRoute: AppRoutes.transactions,
          getPages: AppPages.pages,
          localizationsDelegates: const [
            ...AppLocalizations.localizationsDelegates,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          routingCallback: (routes) {
            'Routes ${routes?.current}'.logD;
            if (routes?.current != null &&
                routes?.current == AppRoutes.splash) {
              Future.microtask(() {
                Get.offNamed(AppRoutes.transactions);
              });
            }
          },
        );
      },
    );
  }
}
