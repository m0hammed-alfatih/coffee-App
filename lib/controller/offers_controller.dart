import 'package:coffee_app/controller/home_controller.dart';
import 'package:coffee_app/core/class/statusrequest.dart';
import 'package:coffee_app/core/functions/handingdatacontroller.dart';
import 'package:coffee_app/core/services/services.dart';
import 'package:coffee_app/data/datasource/remote/offers_data.dart';
import 'package:coffee_app/data/model/itemsmodel.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersController extends SearchMixController {
  OfferData offerData = OfferData(Get.find());
  MyServices myServices = Get.find();
  String? lang;
  String deliverytime = "";
  List<ItemsModel> data = [];
  initialData() {
    // myServices.sharedPreferences.clear() ;
  }

  late StatusRequest statusRequest;
  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await offerData.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata2 = response['data'];
        data.addAll(listdata2
            .map((e) => ItemsModel.fromJson(e as Map<String, dynamic>)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    deliverytime = myServices.sharedPreferences.getString("deliverytime")!;
    lang = myServices.sharedPreferences.getString("lang");
    search = TextEditingController();
    getData();
    super.onInit();
  }
}
