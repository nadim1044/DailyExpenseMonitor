import 'package:daily_expense_monitor_app/features/data/datasource/transaction_datasource.dart';
import 'package:daily_expense_monitor_app/features/data/datasource/transaction_datasource_impl.dart';
import 'package:daily_expense_monitor_app/features/data/repositories/transaction_repository_impl.dart';
import 'package:daily_expense_monitor_app/features/domain/repositories/transaction_repository.dart';
import 'package:daily_expense_monitor_app/features/domain/usecase/get_transactions_usecase.dart';
import 'package:daily_expense_monitor_app/features/presentation/controllers/get_transactions_controller.dart';
import 'package:get/get.dart';

class GetTransactionsBinding extends Bindings {
  @override
  void dependencies() {
    // Data source
    Get.lazyPut<TransactionDataSource>(
      () => TransactionDatasourceImpl(),
    );

    // Repository
    Get.lazyPut<TransactionRepository>(
      () => TransactionRepositoryImpl(
        Get.find<TransactionDataSource>(),
      ),
    );

    // Use case
    Get.lazyPut<GetTransactionsUseCase>(
      () => GetTransactionsUseCase(
        Get.find<TransactionRepository>(),
      ),
    );

    Get.put(GetTransactionsController(
      transactionDataSource: Get.find<TransactionDataSource>(),
      transactionRepository: Get.find<TransactionRepository>(),
      getTransactions: Get.find<GetTransactionsUseCase>(),
    ));
  }
}
