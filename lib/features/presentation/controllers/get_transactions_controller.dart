import 'package:daily_expense_monitor_app/app/error/exceptions.dart';
import 'package:daily_expense_monitor_app/features/domain/entities/transactions_entities.dart';
import 'package:daily_expense_monitor_app/features/domain/usecase/get_transactions_usecase.dart';
import 'package:daily_expense_monitor_app/features/presentation/controllers/base_controller.dart';
import 'package:get/get.dart';

class GetTransactionsController extends BaseController {
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
    setLoading();
    Future.delayed(const Duration(seconds: 3)).then(
      (value) {
        try {
          loadTransactions();
        } on DatabaseException catch (e) {
          Get.snackbar(
            'Failed',
            e.message,
            snackPosition: SnackPosition.BOTTOM,
          );
        } finally {
          setSuccess();
        }
      },
    );
  }
}
