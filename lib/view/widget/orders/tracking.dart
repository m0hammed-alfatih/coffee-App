// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:coffee_app/controller/orders/tracking_controller.dart';
import 'package:coffee_app/core/class/handlingdataview.dart';
import 'package:coffee_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersTracking extends StatelessWidget {
  const OrdersTracking({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TrackingController());
    return Scaffold(
      appBar: AppBar(
        title: Text("تتبع الطلب".tr),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GetBuilder<TrackingController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Stack(
              children: [
                // خريطة جوجل
                GoogleMap(
                  polylines: controller.polylineSet,
                  mapType: MapType.terrain,
                  markers: controller.markers.toSet(),
                  initialCameraPosition: controller.cameraPosition!,
                  onMapCreated: (GoogleMapController controllermap) {
                    controller.gmc = controllermap;
                  },
                ),
                // زر عائم فوق الخريطة
                Positioned(
                  bottom: 30, // المسافة من الأسفل
                  left: 100, // المسافة من اليسار
                  right: 100, // المسافة من اليمين
                  child: GestureDetector(
                    onTap: () {
                      // controller.doneDelivery();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10), // حشو أصغر
                      decoration: BoxDecoration(
                        color: AppColor.primary, // لون الزر
                        borderRadius:
                            BorderRadius.circular(8), // حواف مستديرة أصغر
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 3, // ظلال أقل
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "تم التوصيل".tr,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
