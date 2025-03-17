import 'package:coffee_app/controller/orders/archive_controller.dart';
import 'package:coffee_app/core/constant/color.dart';
import 'package:coffee_app/core/constant/routes.dart';
import 'package:coffee_app/data/model/ordersmodel.dart';
import 'package:coffee_app/view/widget/orders/dialograting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

class CardOrdersListArchive extends GetView<OrdersArchiveController> {
  final OrdersModel listdata;

  const CardOrdersListArchive({super.key, required this.listdata});

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
                  "${"125".tr} : ${controller.printOrderType(listdata.ordersType!)}"),
              Text("${"126".tr}: ${listdata.ordersPrice}  ${"139".tr}"),
              Text(
                  "${"127".tr}: ${listdata.ordersPricedelivery}  ${"139".tr} "),
              Text(
                  "${"128".tr} : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)} "),
              Text(
                  "${"129".tr} : ${controller.printOrderStatus(listdata.ordersStatus!)} "),
              const Divider(),
              Row(
                children: [
                  Text("${"86".tr} : ${listdata.ordersTotalprice}  ${"139".tr}",
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
                  SizedBox(
                    width: 10,
                  ),
                  if (listdata.ordersRating == "0")
                    MaterialButton(
                      onPressed: () {
                        ShowDialogRating(context, listdata.ordersId!);
                      },
                      color: AppColor.third,
                      textColor: AppColor.second,
                      child: Text("145".tr),
                    ),
                ],
              ),
            ],
          )),
    );
  }
}
