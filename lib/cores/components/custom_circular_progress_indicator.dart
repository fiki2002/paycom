import 'package:flutter/material.dart';
import 'package:paycom/cores/constants/palette.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator(
      {Key? key, this.color, this.backGroundColor, this.value})
      : super(key: key);

  final Color? color;
  final Color? backGroundColor;
  final double? value;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 2.0,
      backgroundColor: backGroundColor ?? kcWhiteColor,
      color: color ?? kcWhiteColor,
      value: value,
    );
  }
}
