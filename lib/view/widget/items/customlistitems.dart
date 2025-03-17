import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffee_app/controller/favorite_controller.dart';
import 'package:coffee_app/controller/items_controller.dart';
import 'package:coffee_app/core/constant/color.dart';
import 'package:coffee_app/core/constant/imageasset.dart';
import 'package:coffee_app/core/functions/translatefatabase.dart';
import 'package:coffee_app/data/model/itemsmodel.dart';
import 'package:coffee_app/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  // final bool active;
  const CustomListItems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.goToPageProductDetails(itemsModel);
        },
        child: Card(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Hero(
                        tag: "${itemsModel.itemsId}",
                        child: CachedNetworkImage(
                          imageUrl:
                              "${AppLink.imagestItems}/${itemsModel.itemsImage!}",
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                          translateDatabase(
                              itemsModel.itemsNameAr, itemsModel.itemsName),
                          style: const TextStyle(
                              color: AppColor.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 4,
                          ),
                          Text("${controller.deliverytime} ${"150".tr}",
                              textAlign: TextAlign.center),
                          Container(
                            margin: EdgeInsets.only(top: 3),
                            child: Icon(
                              Icons.timer_sharp,
                              color: AppColor.dgray,
                              size: 20,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                  width: 5), // مساحة صغيرة بين السعرين
                              Text(
                                "${itemsModel.itemsPriceDiscount} ${"139".tr}",
                                style: const TextStyle(
                                  color: AppColor.primary, // لون السعر الحالي
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold, // خط عريض
                                ),
                              ),
                              const SizedBox(width: 5),
                              if (itemsModel.itemsPrice !=
                                  itemsModel.itemsPriceDiscount)
                                Text(
                                  "${itemsModel.itemsPrice}",
                                  style: const TextStyle(
                                    decoration:
                                        TextDecoration.lineThrough, // لخط مشطوب
                                    color: Colors.grey, // لون رمادي
                                    fontSize: 15, // حجم صغير
                                  ),
                                ),
                            ],
                          ),
                          GetBuilder<FavoriteController>(
                            builder: (controller) => IconButton(
                              onPressed: () {
                                if (controller.isFavorite[itemsModel.itemsId] ==
                                    "1") {
                                  controller.setFavorite(
                                      itemsModel.itemsId, "0");
                                  controller
                                      .removeFavorite(itemsModel.itemsId!);
                                } else {
                                  controller.setFavorite(
                                      itemsModel.itemsId, "1");
                                  controller.addFavorite(itemsModel.itemsId!);
                                }
                              },
                              icon: Icon(
                                controller.isFavorite[itemsModel.itemsId] == "1"
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color: AppColor.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
              if (itemsModel.itemsDiscount != "0")
                Positioned(
                    top: 4,
                    right: controller.lang == "ar" ? 4 : null,
                    left: controller.lang == "en" ? 4 : null,
                    child: Image.asset(
                      controller.lang == "ar"
                          ? AppImageAsset.saleOneAr
                          : AppImageAsset.saleOne,
                      width: 40,
                    ))
            ],
          ),
        ));
  }
}

// logical thinking

// GetBuilder<FavoriteController>(
//                         builder: (controller) => IconButton(
//                             onPressed: () {
//                                 if (controller.isFavorite[itemsModel.itemsId] == "1" ) {
//                                   controller.setFavorite(
//                                       itemsModel.itemsId, "0");
//                                 } else {
//                                   controller.setFavorite(
//                                       itemsModel.itemsId, "1");
//                                 }
//                             },
//                             icon: Icon(
//                               controller.isFavorite[itemsModel.itemsId] == "1"
//                                   ? Icons.favorite
//                                   : Icons.favorite_border_outlined,
//                               color: AppColor.primaryColor,
//                             )))
