import 'package:get/get.dart';

class SauceController extends GetxController {
  // Initial Value
  List<String> _listOfSouces = [];

  List<String> get listOfSouces => _listOfSouces;

  setAddSauces(String newSouceName) {
    _listOfSouces.add(newSouceName);
    update();
  }

  setRemoveSauces(String newSouceName) {
    _listOfSouces.remove(newSouceName);
    update();
  }
}
