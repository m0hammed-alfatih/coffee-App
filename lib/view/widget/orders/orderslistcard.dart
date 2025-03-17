import 'package:coffee_app/controller/orders/pending_controller.dart';
import 'package:coffee_app/core/constant/color.dart';
import 'package:coffee_app/core/constant/routes.dart';
import 'package:coffee_app/data/model/ordersmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

class CardOrdersList extends GetView<OrdersPendingController> {
  final OrdersModel listdata;
  const CardOrdersList({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("${"124".tr} : #${listdata.ordersId}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  // Text(listdata.ordersDatetime!)
                  Text(
                    timeago.format(
                      DateTime.parse(listdata.ordersDatetime!),
                      locale: Get.locale?.languageCode ??
                          'en', // تحديد اللغة بناءً على اللغة النشطة
                    ),
                    style: const TextStyle(
                      color: AppColor.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              const Divider(),
              Text(
                  "${"125".tr}: ${controller.printOrderType(listdata.ordersType!)}"),
              Text("${"126".tr} : ${listdata.ordersPrice}  ${"139".tr}"),
              Text(
                  "${"127".tr} : ${listdata.ordersPricedelivery}  ${"139".tr} "),
              Text(
                  "${"128".tr}: ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)} "),
              Text(
                  "${"129".tr} : ${controller.printOrderStatus(listdata.ordersStatus!)} "),
              const Divider(),
              Row(
                children: [
                  Text("${"86".tr}: ${listdata.ordersTotalprice}  ${"139".tr} ",
                      style: const TextStyle(
                          color: AppColor.primary,
                          fontWeight: FontWeight.bold)),
                  const Spacer(),
                  MaterialButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.ordersdetails,
                          arguments: {"ordersmodel": listdata});
                    },
                    color: AppColor.third,
                    textColor: AppColor.second,
                    child: Text("130".tr),
                  ),
                  const SizedBox(width: 10),
                  if (listdata.ordersStatus! == "0")
                    MaterialButton(
                      onPressed: () {
                        controller.deleteOrder(listdata.ordersId!);
                      },
                      color: AppColor.third,
                      textColor: AppColor.second,
                      child: Text("131".tr),
                    ),
                  if (listdata.ordersStatus! == "3")
                    MaterialButton(
                      onPressed: () {
                        controller.goToPageTracking(listdata);
                      },
                      color: AppColor.third,
                      textColor: AppColor.second,
                      child: Text("1311".tr),
                    )
                ],
              ),
            ],
          )),
    );
  }
}
