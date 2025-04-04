import 'package:coffee_app/controller/settings_controller.dart';
import 'package:coffee_app/core/constant/color.dart';
import 'package:coffee_app/core/constant/imageasset.dart';
import 'package:coffee_app/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Container(
      child: ListView(
        children: [
          Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(height: Get.width / 3, color: AppColor.primary),
                Positioned(
                    top: Get.width / 3.9,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey[100],
                        backgroundImage: AssetImage(AppImageAsset.avatar),
                      ),
                    )),
              ]),
          SizedBox(height: 100),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.orderspending);
                  },
                  trailing: Icon(Icons.card_travel),
                  title: Text("75".tr),
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.ordersarchive);
                  },
                  trailing: Icon(Icons.card_travel),
                  title: Text("76".tr),
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.addressview);
                  },
                  trailing: Icon(Icons.location_on_outlined),
                  title: Text("77".tr),
                ),
                ListTile(
                  onTap: () {},
                  trailing: Icon(Icons.help_outline_rounded),
                  title: Text("78".tr),
                ),
                ListTile(
                  onTap: () async {
                    await launchUrl(Uri.parse("tel:+218927205134"));
                  },
                  trailing: Icon(Icons.phone_callback_outlined),
                  title: Text("79".tr),
                ),
                ListTile(
                  onTap: () {
                    controller.logout();
                  },
                  title: Text(
                    "80".tr,
                    style: TextStyle(color: Colors.red),
                  ),
                  trailing: Icon(
                    Icons.exit_to_app,
                    color: Colors.red,
                  ),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
