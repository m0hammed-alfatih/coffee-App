import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/core/class/statusrequest.dart';

import 'package:coffee_app/core/functions/getdecodepolyline.dart';
import 'package:coffee_app/core/services/services.dart';
import 'package:coffee_app/data/model/ordersmodel.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingController extends GetxController {
  Set<Polyline> polylineSet = {};
  MyServices myServices = Get.find();

  GoogleMapController? gmc;
  Timer? timer;
  StatusRequest statusRequest = StatusRequest.success;
  late OrdersModel ordersModel;

  double? deslong;
  double? deslat;

  double? currentlat;
  double? currentlong;

  List<Marker> markers = [];
  CameraPosition? cameraPosition;

  intialData() {
    cameraPosition = CameraPosition(
      target: LatLng(double.parse(ordersModel.addressLat!),
          double.parse(ordersModel.addressLong!)),
      zoom: 12.4746,
    );

    markers.add(Marker(
        markerId: MarkerId("current"),
        position: LatLng(double.parse(ordersModel.addressLat!),
            double.parse(ordersModel.addressLong!))));
  }

  initPolyline() async {
    deslat = double.parse(ordersModel.addressLat!);
    deslong = double.parse(ordersModel.addressLong!);
    await Future.delayed(Duration(seconds: 1));
    polylineSet = await getPolyline(currentlat, currentlong, deslat, deslong);
    update();
  }

  getLocationDelivery() {
    FirebaseFirestore.instance
        .collection("delivery")
        .doc(ordersModel.ordersId)
        .snapshots()
        .listen((event) {
      if (event.exists) {
        deslat = event.get('lat');
        deslong = event.get('long');
        updateMarkerDelivery(deslat!, deslong!);
      }
    });
  }

  updateMarkerDelivery(double newlat, double newlong) {
    markers.removeWhere((element) => element.markerId.value == "dest");
    markers.add(Marker(
      markerId: MarkerId("dest"),
      position: LatLng(newlat, newlong),
      //icon: customIcon // استخدام اللون المخصص
    ));
    update();
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    intialData();
    getLocationDelivery();
    initPolyline();
    super.onInit();
  }

  @override
  void onClose() {
    gmc!.dispose();

    super.onClose();
  }
}
