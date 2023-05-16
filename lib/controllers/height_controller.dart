import 'package:get/get.dart';

class HeightController extends GetxController {
  // Initial Value
  RxDouble _heightofTitleContainer = 230.0.obs;

  double get height => _heightofTitleContainer.value;

  setHeight(double newHeight) {
    _heightofTitleContainer.value = newHeight;
  }
}
