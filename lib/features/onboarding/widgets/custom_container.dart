import 'package:flutter/material.dart';
import 'package:paycom/cores/utils/sizer_utils.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: w(95),
      height: h(7),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(sp(2)),
      ),
    );
  }
}
