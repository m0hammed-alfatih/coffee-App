import 'package:coffee_app/core/class/statusrequest.dart';
import 'package:coffee_app/core/constant/routes.dart';
import 'package:coffee_app/core/functions/handingdatacontroller.dart';
import 'package:coffee_app/core/services/services.dart';
import 'package:coffee_app/data/datasource/remote/orders/pending_data.dart';
import 'package:coffee_app/data/model/ordersmodel.dart';
import 'package:get/get.dart';

class OrdersPendingController extends GetxController {
  OrdersPendingData ordersPendingData = OrdersPendingData(Get.find());

  List<OrdersModel> data = [];

  late StatusRequest statusRequest;
  goToPageTracking(OrdersModel ordersModel) {
    Get.toNamed(AppRoute.orderstracking,
        arguments: {"ordersmodel": ordersModel});
  }

  MyServices myServices = Get.find();

  String printOrderType(String val) {
    if (val == "0") {
      return "95".tr;
    } else {
      return "96".tr;
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "92".tr;
    } else {
      return "93".tr;
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "132".tr;
    } else if (val == "1") {
      return "133".tr;
    } else if (val == "2") {
      return "134".tr;
    } else if (val == "3") {
      return "135".tr;
    } else {
      return "136".tr;
    }
  }

  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersPendingData
        .getData(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deleteOrder(String orderid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersPendingData.deleteData(orderid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        refrehOrder();
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  refrehOrder() {
    getOrders();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
