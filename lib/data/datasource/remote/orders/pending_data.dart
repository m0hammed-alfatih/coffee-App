import 'package:coffee_app/core/class/crud.dart';
import 'package:coffee_app/linkapi.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);
  getData(String userid) async {
    var response = await crud.postData(AppLink.pendingorders, {"id": userid});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String orderid) async {
    var response = await crud.postData(AppLink.ordersdelete, {"id": orderid});
    return response.fold((l) => l, (r) => r);
  }
}
