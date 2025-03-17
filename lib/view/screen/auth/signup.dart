import 'package:coffee_app/controller/auth/signup_controller.dart';
import 'package:coffee_app/core/class/handlingdataview.dart';
import 'package:coffee_app/core/constant/color.dart';
import 'package:coffee_app/core/functions/alertexitapp.dart';
import 'package:coffee_app/core/functions/validinput.dart';
import 'package:coffee_app/view/widget/auth/custombutton.dart';
import 'package:coffee_app/view/widget/auth/customtextbodyauth.dart';
import 'package:coffee_app/view/widget/auth/customtextformauth.dart';

import 'package:coffee_app/view/widget/auth/customtexttitleauth.dart';
import 'package:coffee_app/view/widget/auth/textsginup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.background,
          elevation: 0.0,
          title: Text("22".tr,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: AppColor.lgray)),
        ),
        body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<SignUpControllerImp>(
              builder: (controller) => HandlingDataRequest(
                    statusRequest: controller.statusRequest,
                    widget: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      child: Form(
                        key: controller.formstate,
                        child: ListView(children: [
                          const SizedBox(height: 40),
                          CustomTextTitleAuth(text: "23".tr),
                          const SizedBox(height: 20),
                          CustomTextBodyAuth(text: "24".tr),
                          const SizedBox(height: 20),
                          CustomTextFormAuth(
                            isNumber: false,

                            valid: (val) {
                              return validInput(val!, 3, 20, "username");
                            },
                            mycontroller: controller.username,
                            hinttext: "53".tr,
                            iconData: Icons.person_outline,
                            labeltext: "52".tr,
                            // mycontroller: ,
                          ),
                          CustomTextFormAuth(
                            isNumber: false,

                            valid: (val) {
                              return validInput(val!, 3, 40, "email");
                            },
                            mycontroller: controller.email,
                            hinttext: "27".tr,
                            iconData: Icons.email_outlined,
                            labeltext: "28".tr,
                            // mycontroller: ,
                          ),
                          CustomTextFormAuth(
                            isNumber: true,
                            valid: (val) {
                              return validInput(val!, 7, 11, "phone");
                            },
                            mycontroller: controller.phone,
                            hinttext: "29".tr,
                            iconData: Icons.phone_android_outlined,
                            labeltext: "30".tr,
                            // mycontroller: ,
                          ),
                          CustomTextFormAuth(
                            isNumber: false,

                            valid: (val) {
                              return validInput(val!, 3, 30, "password");
                            },
                            mycontroller: controller.password,
                            hinttext: "32".tr,
                            iconData: Icons.lock_outline,
                            labeltext: "34".tr,
                            // mycontroller: ,
                          ),
                          CustomButtomAuth(
                              text: "22".tr,
                              onPressed: () {
                                controller.signUp();
                              }),
                          const SizedBox(height: 40),
                          CustomTextSignUpOrSignIn(
                            textone: "36".tr,
                            texttwo: "37".tr,
                            onTap: () {
                              controller.goToSignIn();
                            },
                          ),
                        ]),
                      ),
                    ),
                  )),
        ));
  }
}
