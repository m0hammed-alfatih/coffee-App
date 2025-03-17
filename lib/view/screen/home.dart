import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffee_app/controller/home_controller.dart';
import 'package:coffee_app/core/class/handlingdataview.dart';
import 'package:coffee_app/core/constant/routes.dart';
import 'package:coffee_app/core/functions/translatefatabase.dart';
import 'package:coffee_app/data/model/itemsmodel.dart';
import 'package:coffee_app/linkapi.dart';
import 'package:coffee_app/view/widget/customappbar.dart';

import 'package:coffee_app/view/widget/home/customcardhome.dart';
import 'package:coffee_app/view/widget/home/customtitlehome.dart';
import 'package:coffee_app/view/widget/home/listcategorieshome.dart';
import 'package:coffee_app/view/widget/home/listitemshome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
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
                HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: !controller.isSearch
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomCardHome(
                                  title: controller.titleHomeCard,
                                  body: controller.bodyHomeCard),
                              CustomTitleHome(title: "72".tr),
                              ListCategoriesHome(),
                              CustomTitleHome(title: "73".tr),
                              ListItemsHome(),
                            ],
                          )
                        : ListItemsSearch(listdatamodel: controller.listdata))
              ],
            )));
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listdatamodel;
  const ListItemsSearch({super.key, required this.listdatamodel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdatamodel.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToPageProductDetails(listdatamodel[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              child: Card(
                  child: Container(
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Expanded(
                        child: CachedNetworkImage(
                            imageUrl:
                                "${AppLink.imagestItems}/${listdatamodel[index].itemsImage}")),
                    Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(translateDatabase(
                              listdatamodel[index].itemsNameAr!,
                              listdatamodel[index].itemsName!)),
                          subtitle: Text(translateDatabase(
                              listdatamodel[index].categoriesNamaAr!,
                              listdatamodel[index].categoriesName!)),
                        )),
                  ],
                ),
              )),
            ),
          );
        });
  }
}
