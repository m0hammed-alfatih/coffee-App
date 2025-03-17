import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffee_app/controller/favorite_controller.dart';
import 'package:coffee_app/controller/offers_controller.dart';
import 'package:coffee_app/core/constant/color.dart';
import 'package:coffee_app/core/constant/imageasset.dart';
import 'package:coffee_app/core/functions/translatefatabase.dart';
import 'package:coffee_app/data/model/itemsmodel.dart';
import 'package:coffee_app/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListItemsOffer extends GetView<OffersController> {
  final ItemsModel itemsModel;
  final int index;

  const CustomListItemsOffer({
    super.key,
    required this.itemsModel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToPageProductDetails(itemsModel);
      },
      child: Card(
        elevation: 2, // Adding shadow to the card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Rounded corners
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10), // Increase padding
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Hero Image
                  Hero(
                    tag: "${itemsModel.itemsId}_$index",
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(12), // زوايا مستديرة للصورة
                      child: Container(
                        width: double.infinity, // امتداد الصورة بعرض البطاقة
                        height: 150, // ارتفاع محدد للصورة
                        decoration: BoxDecoration(
                          color: Colors
                              .grey[200], // خلفية رمادية خفيفة في حالة التحميل
                          image: DecorationImage(
                            image: NetworkImage(
                                "${AppLink.imagestItems}/${itemsModel.itemsImage!}"),
                            fit: BoxFit
                                .cover, // جعل الصورة تغطي الحاوية مع المحافظة على التناسب
                          ),
                        ),
                        child: CachedNetworkImage(
                          imageUrl:
                              "${AppLink.imagestItems}/${itemsModel.itemsImage!}",
                          fit: BoxFit.cover, // تغطية الحاوية بالكامل
                          placeholder: (context, url) => const Center(
                            child:
                                CircularProgressIndicator(), // مؤشر تحميل دائري
                          ),
                          errorWidget: (context, url, error) => const Center(
                            child: Icon(Icons.error,
                                color: Colors.red, size: 50), // أيقونة خطأ
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),
                  // Item Name
                  Text(
                    translateDatabase(
                        itemsModel.itemsNameAr, itemsModel.itemsName),
                    style: const TextStyle(
                      color: AppColor.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  // Delivery Time
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.timer_sharp,
                          color: AppColor.dgray, size: 20),
                      const SizedBox(width: 6),
                      Text(
                        "${controller.deliverytime} ${"150".tr}",
                        style: const TextStyle(
                            fontSize: 14, color: AppColor.dgray),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Price and Favorite Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Prices
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (itemsModel.itemsPrice !=
                              itemsModel.itemsPriceDiscount)
                            Text(
                              "${itemsModel.itemsPrice} ${"139".tr}",
                              style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          Text(
                            "${itemsModel.itemsPriceDiscount} ${"139".tr}",
                            style: const TextStyle(
                              color: AppColor.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      // Favorite Icon
                      GetBuilder<FavoriteController>(
                        builder: (controller) => IconButton(
                          onPressed: () {
                            if (controller.isFavorite[itemsModel.itemsId] ==
                                "1") {
                              controller.setFavorite(itemsModel.itemsId, "0");
                              controller.removeFavorite(itemsModel.itemsId!);
                            } else {
                              controller.setFavorite(itemsModel.itemsId, "1");
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
                ],
              ),
            ),
            // Discount Badge
            if (itemsModel.itemsDiscount != "0")
              Positioned(
                top: 8,
                right: controller.lang == "ar" ? 8 : null,
                left: controller.lang == "en" ? 8 : null,
                child: Image.asset(
                  controller.lang == "en"
                      ? AppImageAsset.saleOne
                      : AppImageAsset.saleOneAr,
                  width: 55,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
