import 'package:daily_expense_monitor_app/features/data/datasource/transaction_datasource.dart';
import 'package:daily_expense_monitor_app/features/data/datasource/transaction_datasource_impl.dart';
import 'package:daily_expense_monitor_app/features/data/repositories/transaction_repository_impl.dart';
import 'package:daily_expense_monitor_app/features/domain/entities/transactions_entities.dart';
import 'package:daily_expense_monitor_app/features/domain/repositories/transaction_repository.dart';
import 'package:daily_expense_monitor_app/features/domain/usecase/get_transactions_usecase.dart';
import 'package:get/get.dart';

class GetTransactionsController extends GetxController {
  final TransactionDataSource transactionDataSource =
      TransactionDatasourceImpl();
  late final TransactionRepository transactionRepository;

  late final GetTransactionsUseCase getTransactions;
  var transactions = <TransactionsEntities>[].obs;

  void loadTransactions() async {
    final result = await getTransactions.call();
    transactions.value = result;
  }

  @override
  void onInit() {
    super.onInit();
    transactionRepository = TransactionRepositoryImpl(transactionDataSource);
    getTransactions = GetTransactionsUseCase(transactionRepository);
    loadTransactions();
  }
}
