import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffee_app/controller/productdetails_controller.dart';
import 'package:coffee_app/core/constant/color.dart';
import 'package:coffee_app/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopProductPageDetails extends GetView<ProductDetailsControllerImp> {
  const TopProductPageDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,
          decoration: const BoxDecoration(color: AppColor.second),
        ),
        Positioned(
            top: 30.0,
            right: Get.width / 10,
            left: Get.width / 10,
            child: Hero(
              tag: "${controller.itemsModel.itemsId}",
              child: CachedNetworkImage(
                imageUrl:
                    "${AppLink.imagestItems}/${controller.itemsModel.itemsImage!}",
                height: 250,
                fit: BoxFit.fill,
              ),
            ))
      ],
    );
  }
}
