// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:coffee_app/controller/orders/details_controller.dart';
import 'package:coffee_app/core/class/handlingdataview.dart';
import 'package:coffee_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("121".tr),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GetBuilder<OrdersDetailsController>(
            builder: ((controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Table(
                            children: [
                              TableRow(children: [
                                Text("122".tr,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.primary,
                                        fontWeight: FontWeight.bold)),
                                Text("123".tr,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.primary,
                                        fontWeight: FontWeight.bold)),
                                Text("83".tr,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.primary,
                                        fontWeight: FontWeight.bold)),
                              ]),
                              ...List.generate(
                                  controller.data.reversed.length,
                                  (index) => TableRow(children: [
                                        Text(
                                            "${controller.data[index].itemsNameAr}",
                                            textAlign: TextAlign.center),
                                        Text(
                                            "${controller.data[index].countitems}",
                                            textAlign: TextAlign.center),
                                        Text(
                                            "${controller.data[index].itemsprice}",
                                            textAlign: TextAlign.center),
                                      ]))
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                                "${"86".tr}: ${controller.ordersModel.ordersTotalprice}دل",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColor.primary,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (controller.ordersModel.ordersType == "0")
                    Card(
                      child: Container(
                          child: ListTile(
                        title: Text("97".tr,
                            style: TextStyle(
                                color: AppColor.primary,
                                fontWeight: FontWeight.bold)),
                        subtitle: Text(
                            "${controller.ordersModel.addressCity} ${controller.ordersModel.addressStreet}"),
                      )),
                    ),
                  if (controller.ordersModel.ordersType == "0")
                    Card(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        height: 300,
                        width: double.infinity,
                        child: GoogleMap(
                          mapType: MapType.normal,
                          markers: controller.markers.toSet(),
                          initialCameraPosition: controller.cameraPosition!,
                          onMapCreated: (GoogleMapController controllermap) {
                            controller.completercontroller!
                                .complete(controllermap);
                          },
                        ),
                      ),
                    )
                ])))),
      ),
    );
  }
}
