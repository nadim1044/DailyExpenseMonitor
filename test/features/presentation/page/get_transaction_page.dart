import 'package:daily_expense_monitor_app/daily_monitor_app.dart';
import 'package:daily_expense_monitor_app/features/domain/entities/transactions_entities.dart';
import 'package:daily_expense_monitor_app/features/presentation/controllers/get_transactions_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

import '../../../helpers/mocks.dart';

void main() {
  testWidgets(
    'Check the empty page',
    (widgetTester) async {
      Get.put<GetTransactionsController>(
        GetTransactionsController(
          getTransactions: FakeGetTransactionsUseCase(),
        ),
      );
      await widgetTester.pumpWidget(
        const MyApp(),
      );

      expect(find.text('No Transaction'), findsWidgets);
    },
  );

  testWidgets('shows list when transactions exist', (tester) async {
    final controller = Get.find<GetTransactionsController>();

    controller.transactions.value = [
      TransactionsEntities(
        title: 'Coffee',
        date: DateTime.now().toIso8601String(),
        amount: 10,
        id: '',
      ),
    ];

    await tester.pumpWidget(
      const MyApp(),
    );

    await tester.pump();

    expect(find.text('Coffee'), findsOneWidget);
  });
}
