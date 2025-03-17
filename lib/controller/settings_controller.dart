import 'package:coffee_app/core/constant/routes.dart';
import 'package:coffee_app/core/services/services.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();

  logout() {
    myServices.sharedPreferences.remove("userToken");

    Get.offAllNamed(AppRoute.login);
  }
}
