import 'package:coffee_app/controller/favorite_controller.dart';
import 'package:coffee_app/controller/offers_controller.dart';
import 'package:coffee_app/core/class/handlingdataview.dart';
import 'package:coffee_app/core/constant/routes.dart';
import 'package:coffee_app/view/screen/home.dart';
import 'package:coffee_app/view/widget/customappbar.dart';

import 'package:coffee_app/view/widget/offers/customlistitemsoffers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OffersController());
    Get.put(FavoriteController());
    return GetBuilder<OffersController>(
        builder: (controller) => Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                children: [
                  CustomAppBar(
                    mycontroller: controller.search!,
                    titleappbar: "74".tr,
                    // onPressedIcon: () {},
                    onPressedSearch: () {
                      controller.onSearchItems();
                    },
                    onChanged: (val) {
                      controller.checkSearch(val);
                    },
                    onPressedIconFavorite: () {
                      Get.toNamed(AppRoute.myfavroite);
                    },
                  ),
                  SizedBox(height: 20),
                  !controller.isSearch
                      ? HandlingDataView(
                          statusRequest: controller.statusRequest,
                          widget: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.data.length,
                            itemBuilder: (context, index) =>
                                CustomListItemsOffer(
                              itemsModel: controller.data[index],
                              index: index, // Pass the index here
                            ),
                          ))
                      : ListItemsSearch(listdatamodel: controller.listdata)
                ],
              ),
            ));
  }
}
