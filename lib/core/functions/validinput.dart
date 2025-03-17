import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "59".tr;
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "60".tr;
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "61".tr;
    }
  }

  if (val.isEmpty) {
    return "62".tr;
  }

  if (val.length < min) {
    return "63".tr;
  }

  if (val.length > max) {
    return "64".tr;
  }
}
