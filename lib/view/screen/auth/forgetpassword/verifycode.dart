import 'package:coffee_app/controller/forgetpassword/verifycode_controller.dart';
import 'package:coffee_app/core/constant/color.dart';
import 'package:coffee_app/view/widget/auth/customtextbodyauth.dart';
import 'package:coffee_app/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerfiyCode extends StatelessWidget {
  const VerfiyCode({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.background,
        elevation: 0.0,
        title: Text("44".tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.lgray)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(children: [
          const SizedBox(height: 50),
          CustomTextTitleAuth(text: "45".tr),
          const SizedBox(height: 10),
          CustomTextBodyAuth(text: "46".tr),
          const SizedBox(height: 15),
          OtpTextField(
            fieldWidth: 50.0,
            borderRadius: BorderRadius.circular(8),
            numberOfFields: 5,
            borderColor: AppColor.primary,
            showFieldAsBox: true,
            textStyle: const TextStyle(
              fontSize: 20.0,
              textBaseline: TextBaseline.alphabetic,
              locale:
                  Locale('en', 'US'), // لضمان اتجاه الكتابة من اليسار لليمين
            ),
            onCodeChanged: (String code) {
              //handle validation or checks here
            },
            onSubmit: (String verificationCode) {
              controller.goToResetPassword(verificationCode);
            },
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
      ),
    );
  }
}
