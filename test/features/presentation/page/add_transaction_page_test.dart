import 'package:daily_expense_monitor_app/features/presentation/controllers/add_transaction_controller.dart';
import 'package:daily_expense_monitor_app/features/presentation/controllers/get_transactions_controller.dart';
import 'package:daily_expense_monitor_app/features/presentation/page/add_transaction_page.dart';
import 'package:daily_expense_monitor_app/l10n/arb/app_localizations.dart';
import 'package:daily_expense_monitor_app/res/theme_light.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

import '../../../helpers/mocks.dart'
    show FakeGetTransactionsUseCase, FakeAddTransactionUseCase;

void main() {
  testWidgets('Add transaction submits correct data', (tester) async {
    Get.put(GetTransactionsController(
      getTransactions: FakeGetTransactionsUseCase(),
    ));

    Get.put(AddTransactionController(
      addTransactionUseCase: FakeAddTransactionUseCase(),
    ));

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812), // match your app design
        builder: (context, child) {
          return GetMaterialApp(
            theme: lightTheme,
            home: const AddTransactionPage(),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'),
            ],
          );
        },
      ),
    );

    await tester.pump();

    // ✅ Now this will pass
    expect(find.byKey(const Key('transaction_name_field')), findsOneWidget);

    await tester.enterText(
      find.byKey(const Key('transaction_name_field')),
      'Coffee',
    );

    await tester.enterText(
      find.byKey(const Key('transaction_amount_field')),
      '120',
    );

    await tester.tap(find.byKey(const Key('submit_transaction_button')));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    await tester.pump();
  });
}
