import 'package:coffee_app/core/class/crud.dart';
import 'package:coffee_app/linkapi.dart';

class OfferData {
  Crud crud;

  OfferData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.offers, {});
    return response.fold((l) => l, (r) => r);
  }
}
