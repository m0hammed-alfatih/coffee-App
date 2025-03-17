import 'package:coffee_app/controller/orders/pending_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

Future<void> requestPermissionNotification() async {
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print("🔔 حالة إذن الإشعارات: ${settings.authorizationStatus}");
}

void fcmconfig() {
  print("🔔 بدء الاستماع إلى الإشعارات...");
  FirebaseMessaging.onMessage.listen((message) {
    print("================== إشعار جديد =================");

    if (message.notification != null) {
      print("📢 العنوان: ${message.notification!.title}");
      print("📄 المحتوى: ${message.notification!.body}");

      // تشغيل نغمة الإشعار
      FlutterRingtonePlayer().playNotification();
      Get.snackbar(
        message.notification!.title ?? "إشعار جديد",
        message.notification!.body ?? "لديك إشعار جديد",
      );
    }

    refreshPageNotification(message.data);
  });
}

void refreshPageNotification(Map<String, dynamic> data) {
  print("============================= معرف الصفحة ");
  print(data['pageid']);
  print("============================= اسم الصفحة ");
  print(data['pagename']);
  print("============================= المسار الحالي ");
  print(Get.currentRoute);

  if (Get.currentRoute == "/orderspending" &&
      data['pagename'] == "refreshorderpending") {
    try {
      OrdersPendingController controller = Get.find();
      controller.refrehOrder(); // تأكد أن اسم الدالة صحيح
    } catch (e) {
      print("⚠️ خطأ أثناء تحديث الطلبات: $e");
    }
  }
}
