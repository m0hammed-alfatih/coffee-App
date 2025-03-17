import 'package:coffee_app/controller/onboarding_controller.dart';
import 'package:coffee_app/view/widget/ondoarding/custombutton.dart';
import 'package:coffee_app/view/widget/ondoarding/customslider.dart';
import 'package:coffee_app/view/widget/ondoarding/dotcontroller.dart';
import 'package:coffee_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return const Scaffold(
        backgroundColor: AppColor.background,
        body: SafeArea(
          child: Column(children: [
            Expanded(
              flex: 3,
              child: CustomSliderOnBoarding(),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Spacer(flex: 2),
                    CustomDotControllerOnBoarding(),
                    Spacer(flex: 2),
                    CustomButtonOnBoarding()
                  ],
                ))
          ]),
        ));
  }
}
