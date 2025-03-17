import 'package:coffee_app/controller/auth/login_controller.dart';
import 'package:coffee_app/core/class/handlingdataview.dart';
import 'package:coffee_app/core/constant/color.dart';
import 'package:coffee_app/core/functions/alertexitapp.dart';
import 'package:coffee_app/core/functions/validinput.dart';
import 'package:coffee_app/view/widget/auth/custombutton.dart';
import 'package:coffee_app/view/widget/auth/customtextbodyauth.dart';
import 'package:coffee_app/view/widget/auth/customtextformauth.dart';
import 'package:coffee_app/view/widget/auth/customtexttitleauth.dart';
import 'package:coffee_app/view/widget/auth/logoauth.dart';
import 'package:coffee_app/view/widget/auth/textsginup.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.background,
          elevation: 0.0,
          title: Text("11".tr,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: AppColor.lgray)),
        ),
        body: WillPopScope(
            onWillPop: alertExitApp,
            child: GetBuilder<LoginControllerImp>(
                builder: (controller) => HandlingDataRequest(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                        child: Form(
                          key: controller.formstate,
                          child: ListView(children: [
                            const LogoAuth(),
                            const SizedBox(height: 20),
                            CustomTextTitleAuth(text: "12".tr),
                            const SizedBox(height: 10),
                            CustomTextBodyAuth(text: "13".tr),
                            const SizedBox(height: 40),
                            CustomTextFormAuth(
                              isNumber: false,

                              valid: (val) {
                                return validInput(val!, 5, 100, "email");
                              },
                              mycontroller: controller.email,
                              hinttext: "14".tr,
                              iconData: Icons.email_outlined,
                              labeltext: "15".tr,
                              // mycontroller: ,
                            ),
                            GetBuilder<LoginControllerImp>(
                                builder: (controller) => CustomTextFormAuth(
                                      obscureText: controller.isshowpassword,
                                      onTapIcon: () {
                                        controller.showPassword();
                                      },
                                      isNumber: false,

                                      valid: (val) {
                                        return validInput(
                                            val!, 5, 30, "password");
                                      },
                                      mycontroller: controller.password,
                                      hinttext: "16".tr,
                                      iconData: Icons.lock_outline,
                                      labeltext: "17".tr,
                                      // mycontroller: ,
                                    )),
                            // "18".tr,
                            InkWell(
                              onTap: () {
                                controller.goToForgetPassword();
                              },
                              child: Text(
                                "18".tr,
                                textAlign: TextAlign.end,
                              ),
                            ),
                            CustomButtomAuth(
                                text: "19".tr,
                                onPressed: () {
                                  controller.login();
                                }),
                            const SizedBox(height: 40),
                            CustomTextSignUpOrSignIn(
                              textone: "20".tr,
                              texttwo: "21".tr,
                              onTap: () {
                                controller.goToSignUp();
                              },
                            )
                          ]),
                        ),
                      ),
                    ))));
  }
}
