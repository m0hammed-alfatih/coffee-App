import 'package:coffee_app/controller/auth/verfiycodesignup_controller.dart';
import 'package:coffee_app/core/class/handlingdataview.dart';
import 'package:coffee_app/core/constant/color.dart';
import 'package:coffee_app/view/widget/auth/customtextbodyauth.dart';
import 'package:coffee_app/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerfiyCodeSignUp extends StatelessWidget {
  const VerfiyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.background,
        elevation: 0.0,
        title: Text("45".tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.dgray)),
      ),
      body: GetBuilder<VerifyCodeSignUpControllerImp>(
          builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: ListView(children: [
                  const SizedBox(height: 20),
                  const CustomTextTitleAuth(text: "Check code"),
                  const SizedBox(height: 10),
                  CustomTextBodyAuth(text: "${"46".tr}${controller.email}"),
                  const SizedBox(height: 15),
                  OtpTextField(
                    fieldWidth: 50.0,
                    borderRadius: BorderRadius.circular(10),
                    numberOfFields: 5,
                    borderColor: AppColor.primary,
                    showFieldAsBox: true,

                    textStyle: const TextStyle(
                      fontSize: 20,
                      locale: Locale('en', 'US'), // لضمان الكتابة من اليسار
                    ),
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    onSubmit: (String verificationCode) {
                      controller.goToSuccessSignUp(verificationCode);
                    },
                    // لضمان اتجاه الكتابة من اليسار
                  ),
                  const SizedBox(height: 40),
                  InkWell(
                    onTap: () {
                      controller.reSend();
                    },
                    child: const Center(
                        child: Text(
                      "Resend verfiy code",
                      style: TextStyle(color: AppColor.primary, fontSize: 20),
                    )),
                  )
                ]),
              ))),
    );
  }
}
