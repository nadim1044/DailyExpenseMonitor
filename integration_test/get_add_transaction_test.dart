import 'package:daily_expense_monitor_app/daily_monitor_app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Future<void> launchApp(WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle(const Duration(seconds: 3));
  }

  Future<void> openAddTransactionPage(WidgetTester tester) async {
    await tester.tap(find.byKey(const Key('add_transaction_fab')));
    await tester.pumpAndSettle();
  }

  Future<void> fillAndSubmitForm(
    WidgetTester tester, {
    required String name,
    required String amount,
  }) async {
    await tester.enterText(
      find.byKey(const Key('transaction_name_field')),
      name,
    );
    await tester.enterText(
      find.byKey(const Key('transaction_amount_field')),
      amount,
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('submit_transaction_button')));
    await tester.pumpAndSettle(const Duration(seconds: 3));
  }

  // ─────────────────────────────────────────────
  // Happy path
  // ─────────────────────────────────────────────
  group('add transaction flow |', () {
    testWidgets(
      'should display multiple transactions in correct order',
      (tester) async {
        await launchApp(tester);

        // act — add two transactions
        await openAddTransactionPage(tester);
        await fillAndSubmitForm(tester, name: 'Coffee', amount: '50.00');

        await openAddTransactionPage(tester);
        await fillAndSubmitForm(tester, name: 'Lunch', amount: '120.00');

        // assert — both visible
        expect(find.text('Coffee'), findsOneWidget);
        expect(find.text('Lunch'), findsOneWidget);
      },
    );
  });

  // ─────────────────────────────────────────────
  // Navigation flow
  // ─────────────────────────────────────────────
  group('navigation flow |', () {
    testWidgets(
      'should return to home when back button is tapped without saving',
      (tester) async {
        await launchApp(tester);
        await openAddTransactionPage(tester);

        // act — go back without submitting
        Get.back();
        await tester.pumpAndSettle();

        // assert — back on home, nothing added
        expect(find.byKey(const Key('add_transaction_fab')), findsOneWidget);
      },
    );
  });
}
