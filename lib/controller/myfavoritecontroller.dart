import 'package:coffee_app/core/class/statusrequest.dart';
import 'package:coffee_app/core/functions/handingdatacontroller.dart';
import 'package:coffee_app/core/services/services.dart';
import 'package:coffee_app/data/datasource/remote/myfavorite_data.dart';
import 'package:coffee_app/data/model/myfavorite.dart';
import 'package:get/get.dart';

class MyFavoriteController extends GetxController {
  MyFavoriteData favoriteData = MyFavoriteData(Get.find());

  List<MyFavoriteModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();
  String deliverytime = "";
//  key => id items
//  Value => 1 OR 0

  getData() async {
    data.clear();
    deliverytime = myServices.sharedPreferences.getString("deliverytime")!;
    statusRequest = StatusRequest.loading;
    var response = await favoriteData
        .getData(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => MyFavoriteModel.fromJson(e)));
        print("data");
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deleteFromFavorite(String favroiteid) {
    // data.clear();
    // statusRequest = StatusRequest.loading;
    favoriteData.deleteData(favroiteid);
    data.removeWhere((element) => element.favoriteId == favroiteid);
    update();
  }

  // goToPageProductDetails(itemsModel) {
  //   Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  // }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
