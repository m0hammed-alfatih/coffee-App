import 'package:coffee_app/core/constant/color.dart';

import 'package:flutter/material.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final String textbutton;
  final IconData icondata;
  final bool? active;
  const CustomButtonAppBar(
      {super.key,
      required this.textbutton,
      required this.icondata,
      required this.onPressed,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(icondata,
            color: active == true ? AppColor.primary : AppColor.dgray),
        Text(textbutton,
            style: TextStyle(
                fontSize: 8,
                color: active == true ? AppColor.primary : AppColor.dgray))
      ]),
    );
  }
}
