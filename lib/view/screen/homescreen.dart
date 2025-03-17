import 'dart:io';

import 'package:coffee_app/controller/homescreen_controller.dart';
import 'package:coffee_app/core/constant/color.dart';
import 'package:coffee_app/core/constant/routes.dart';
import 'package:coffee_app/view/widget/home/custombottomappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
            floatingActionButton: FloatingActionButton(
                backgroundColor: AppColor.primary,
                shape: const CircleBorder(eccentricity: 1),
                onPressed: () {
                  Get.toNamed(AppRoute.cart);
                },
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColor.stroke,
                )),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: const CustomBottomAppBarHome(),
            body: WillPopScope(
              child: controller.listPage.elementAt(controller.currentpage),
              onWillPop: () {
                Get.defaultDialog(
                  title: "101".tr,
                  titleStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColor.primary,
                  ),
                  middleText: "142".tr,
                  onCancel: () {},
                  cancelTextColor: AppColor.second,
                  confirmTextColor: AppColor.second,
                  buttonColor: AppColor.third,
                  textConfirm: "143".tr,
                  textCancel: "144".tr,
                  onConfirm: () {
                    exit(0);
                  },
                );
                return Future.value(false);
              },
            )));
  }
}
