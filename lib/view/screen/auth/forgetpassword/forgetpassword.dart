import 'package:coffee_app/controller/forgetpassword/forgetpassword_controller.dart';
import 'package:coffee_app/core/class/handlingdataview.dart';
import 'package:coffee_app/core/constant/color.dart';
import 'package:coffee_app/core/functions/validinput.dart';
import 'package:coffee_app/view/widget/auth/custombutton.dart';
import 'package:coffee_app/view/widget/auth/customtextbodyauth.dart';
import 'package:coffee_app/view/widget/auth/customtextformauth.dart';
import 'package:coffee_app/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.background,
          elevation: 0.0,
          title: Text("38".tr,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: AppColor.lgray)),
        ),
        body: GetBuilder<ForgetPasswordControllerImp>(
            builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(children: [
                        const SizedBox(height: 50),
                        CustomTextTitleAuth(text: "39".tr),
                        const SizedBox(height: 10),
                        CustomTextBodyAuth(text: "40".tr),
                        const SizedBox(height: 15),
                        CustomTextFormAuth(
                          isNumber: false,

                          valid: (val) {
                            return validInput(val!, 5, 100, "email");
                          },
                          mycontroller: controller.email,
                          hinttext: "41".tr,
                          iconData: Icons.email_outlined,
                          labeltext: "42".tr,
                          // mycontroller: ,
                        ),
                        CustomButtomAuth(
                            text: "43".tr,
                            onPressed: () {
                              controller.checkemail();
                            }),
                        const SizedBox(height: 40),
                      ]),
                    ),
                  ),
                )));
  }
}
