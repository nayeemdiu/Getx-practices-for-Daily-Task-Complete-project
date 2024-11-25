import 'package:flutter/material.dart';
import 'package:getx_practiece/Getx%20all%20code/utils/color.dart';

class CustomTitleText extends StatelessWidget {
  final String text;

  const CustomTitleText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppColor.appColor,
        fontSize: 23,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
