import 'package:daily_expense_monitor_app/features/domain/entities/transactions_entities.dart';
import 'package:daily_expense_monitor_app/features/domain/usecase/get_transactions_usecase.dart';
import 'package:get/get.dart';

class GetTransactionsController extends GetxController {
  GetTransactionsController({
    required this.getTransactions,
  });

  final GetTransactionsUseCase getTransactions;
  var transactions = <TransactionsEntities>[].obs;

  void loadTransactions() async {
    final result = await getTransactions.call();
    transactions.value = result;
  }

  @override
  void onInit() {
    super.onInit();
    loadTransactions();
  }
}
