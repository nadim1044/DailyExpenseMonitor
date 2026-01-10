import 'package:get/get.dart';

enum UiStatus { idle, loading, success, error }

class BaseController extends GetxController {
  final status = UiStatus.idle.obs;
  final errorMessage = ''.obs;

  void setLoading() => status.value = UiStatus.loading;

  void setSuccess() => status.value = UiStatus.success;

  void setError(String msg) {
    status.value = UiStatus.error;
    errorMessage.value = msg;
  }
}
