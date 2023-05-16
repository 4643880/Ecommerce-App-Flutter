import 'package:get/get.dart';

class SauceController extends GetxController {
  // Initial Value
  List<String> _listOfSouces = [];

  List<String> get listOfSouces => _listOfSouces;

  setSauces(String newSouceName) {
    _listOfSouces.add(newSouceName);
    update();
  }
}
