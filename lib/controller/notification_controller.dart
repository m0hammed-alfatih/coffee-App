import 'package:coffee_app/core/class/statusrequest.dart';
import 'package:coffee_app/core/functions/handingdatacontroller.dart';
import 'package:coffee_app/core/services/services.dart';
import 'package:coffee_app/data/datasource/remote/orders/notification_data.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  NotificationData notificationData = NotificationData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await notificationData
        .getData(myServices.sharedPreferences.getString("id")!);

    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  void deleteNotification(int index) {
    data.removeAt(index);
    update(); // تحديث الواجهة
  }

  void restoreNotification(int index, Map<String, dynamic> notification) {
    data.insert(index, notification);
    update();
  }

  void clearNotifications() {
    data.clear();
    update(); // تحديث الواجهة
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
