import 'package:coffee_app/core/constant/apptheme.dart';
import 'package:coffee_app/core/functions/fcmconfig.dart';
import 'package:coffee_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

class LocaleController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  ThemeData appTheme = themeEnglish;

  changeLang(String langcode) async {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);

    // تعيين الثيم بناءً على اللغة
    appTheme = langcode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);

    // تحديث اللغة في timeago
    setTimeagoLocale(langcode);

    // تحديث اللغة في GetX
    Get.updateLocale(locale);
  }

  void setTimeagoLocale(String langcode) {
    if (langcode == "ar") {
      timeago.setLocaleMessages('ar', timeago.ArMessages());
    } else if (langcode == "en") {
      timeago.setLocaleMessages('en', timeago.EnMessages());
    }
  }

  requestPerLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("تنبيه", "الرجاء تشغيل خدمة تحديد الموقع");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("تنبيه", "الرجاء اعطاء صلاحية الموقع للتطبيق");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Get.snackbar("تنبيه", "لا يمكن استعمال التطبيق من دون الموقع");
    }
  }

  @override
  void onInit() async {
    // طلب الإذن للإشعارات
    requestPermissionNotification();
    fcmconfig();
    requestPerLocation();

    // إعداد اللغة الافتراضية
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");

    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic;
      setTimeagoLocale("ar");
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
      appTheme = themeEnglish;
      setTimeagoLocale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
      setTimeagoLocale(Get.deviceLocale!.languageCode);
    }

    super.onInit();
  }
}
