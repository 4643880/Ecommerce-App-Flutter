import 'package:get/get.dart';
import 'package:otp_project/controllers/auth_controller.dart';
import 'package:otp_project/controllers/souces_controller.dart';
import '../controllers/height_controller.dart';
import '../controllers/quantity_controller.dart';

Future<void> init() async {
  Get.put(QuantityController());
  Get.put(HeightController());
  Get.put(SauceController());
  Get.put(AuthController());
}
