import 'package:daily_expense_monitor_app/features/data/datasource/transaction_datasource.dart';
import 'package:daily_expense_monitor_app/features/domain/entities/transactions_entities.dart';
import 'package:daily_expense_monitor_app/features/domain/repositories/transaction_repository.dart';
import 'package:daily_expense_monitor_app/features/domain/usecase/get_transactions_usecase.dart';
import 'package:get/get.dart';

class GetTransactionsController extends GetxController {
  GetTransactionsController({
    required this.transactionDataSource,
    required this.transactionRepository,
    required this.getTransactions,
  });

  final TransactionDataSource transactionDataSource;
  final TransactionRepository transactionRepository;

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
