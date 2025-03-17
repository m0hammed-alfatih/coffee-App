import 'package:coffee_app/view/screen/home.dart';
import 'package:coffee_app/view/screen/notification.dart';
import 'package:coffee_app/view/screen/offers.dart';
import 'package:coffee_app/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const HomePage(),
    NotificationView(),
    OffersView(),
    Settings()
  ];

  List bottomappbar = [
    {"title": "68".tr, "icon": Icons.home},
    {"title": "71".tr, "icon": Icons.notifications},
    {"title": "69".tr, "icon": Icons.shopify},
    {"title": "70".tr, "icon": Icons.settings}
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
