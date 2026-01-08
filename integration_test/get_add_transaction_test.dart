import 'dart:math';

import 'package:daily_expense_monitor_app/daily_monitor_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'Add transaction flow works correctly',
    (WidgetTester tester) async {
      // Launch app
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      //  Verify FAB exists
      final fabFinder = find.byKey(const Key('add_transaction_fab'));
      expect(fabFinder, findsOneWidget);

      // Tap FAB
      await tester.tap(fabFinder);
      await tester.pumpAndSettle();

      // Generate random data
      final random = Random();
      final transactionName = 'Test Tx ${random.nextInt(10000)}';
      final transactionAmount = (random.nextDouble() * 1000).toStringAsFixed(2);

      // Enter transaction name
      await tester.enterText(
        find.byKey(const Key('transaction_name_field')),
        transactionName,
      );

      //Enter transaction amount
      await tester.enterText(
        find.byKey(const Key('transaction_amount_field')),
        transactionAmount,
      );

      await tester.pumpAndSettle();

      // Tap Add button
      await tester.tap(
        find.byKey(const Key('submit_transaction_button')),
      );

      // Wait for DB write + navigation
      await tester.pumpAndSettle();

      // Verify transaction appears in list
      expect(find.text(transactionName), findsOneWidget);
      expect(find.text('₹$transactionAmount'), findsOneWidget);
    },
  );
}
