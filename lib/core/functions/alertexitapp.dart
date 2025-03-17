import 'dart:io';

import 'package:coffee_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "101".tr,
      titleStyle:
          const TextStyle(color: AppColor.primary, fontWeight: FontWeight.bold),
      middleText: "142".tr,
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                    const Color.fromARGB(255, 197, 26, 46))),
            onPressed: () {
              exit(0);
            },
            child:
                Text(style: TextStyle(color: AppColor.background), "143".tr)),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(AppColor.primary)),
            onPressed: () {
              Get.back();
            },
            child: Text(style: TextStyle(color: AppColor.background), "144".tr))
      ]);
  return Future.value(true);
}
