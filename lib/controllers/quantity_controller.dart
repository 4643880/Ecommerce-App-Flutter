import 'package:get/get.dart';

class QuantityController extends GetxController {
  // Initial Value
  RxString _quantity = "For One".obs;

  String get quantity => _quantity.value;

  setQuantity(String newDeliverySys) {
    _quantity.value = newDeliverySys;
  }
}
