import 'package:coffee_app/controller/onboarding_controller.dart';
import 'package:coffee_app/core/constant/color.dart';
import 'package:coffee_app/data/datasource/static/static.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onBoardingList.length,
                    (index) => AnimatedContainer(
                          margin: const EdgeInsets.only(right: 9),
                          duration: const Duration(milliseconds: 300),
                          width: controller.currentPage == index ? 30 : 7,
                          height: 7,
                          decoration: BoxDecoration(
                            color: controller.currentPage == index
                                ? AppColor.primary
                                : AppColor.lgray,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ))
              ],
            ));
  }
}
