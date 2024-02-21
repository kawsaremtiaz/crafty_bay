import 'package:crafty_bay/data/models/response_data.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class DeleteCartListController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  bool get inProgress => _inProgress;
  String get errorMessage => _errorMessage;

  Future<bool> deleteCartProduct(int productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final ResponseData response =
    await NetworkCaller().getRequest(Urls.deleteCartList(productId));
    if (response.isSuccess) {
      update();
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}