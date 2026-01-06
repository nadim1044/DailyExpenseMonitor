import 'package:daily_expense_monitor_app/features/domain/repositories/transaction_repository.dart';
import 'package:daily_expense_monitor_app/features/domain/usecase/add_transaction_usecase.dart';
import 'package:daily_expense_monitor_app/features/presentation/controllers/add_transaction_controller.dart';
import 'package:get/get.dart';

class AddTransactionBinding extends Bindings {
  @override
  void dependencies() {
    // Use case
    Get.lazyPut<AddTransactionUseCase>(
      () => AddTransactionUseCase(
        Get.find<TransactionRepository>(),
      ),
    );

    Get.lazyPut(
      () => AddTransactionController(
          addTransactionUseCase: Get.find<AddTransactionUseCase>()),
      fenix: true,
    );
  }
}
