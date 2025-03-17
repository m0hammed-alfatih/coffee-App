import 'package:coffee_app/controller/auth/successsignup_controller.dart';
import 'package:coffee_app/core/constant/color.dart';
import 'package:coffee_app/view/widget/auth/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
        Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.background,
        elevation: 0.0,
        title: Text('22'.tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.lgray)),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 26),
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          const Center(
              child: Icon(
            Icons.account_circle,
            size: 260,
            color: AppColor.primary,
          )),
          const SizedBox(height: 50),
          Text("57".tr,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 30)),
          Text("54".tr),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: CustomButtomAuth(
                text: "56".tr,
                onPressed: () {
                  controller.goToPageLogin();
                }),
          ),
          const SizedBox(height: 60)
        ]),
      ),
    );
  }
}
