import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paycom/cores/constants/color.dart';
import 'package:paycom/cores/constants/font_size.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
    this.text, {
    Key? key,
    this.fontSize = kfsTinyText,
    this.textColor = kcPrimaryColor,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.justify,
    this.maxLines,
    this.overflow,
    this.decoration,
    this.height,
  }) : super(key: key);

  final String text;
  final double? fontSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        color: textColor,
        fontWeight: fontWeight,
        decoration: decoration,
        height: height,
      ),
      textAlign: textAlign,
      overflow: overflow,
      softWrap: true,
      maxLines: maxLines,
      textScaleFactor: 0.8,
    );
  }
}

class TwoSpanTextWidget extends StatelessWidget {
  const TwoSpanTextWidget(
    this.text,
    this.text2, {
    Key? key,
    this.fontSize = kfsTinyText,
    this.fontSize2 = kfsTinyText,
    this.textColor = kcPrimaryColor,
    this.textColor2 = kcPrimaryColor,
    this.fontWeight = FontWeight.w400,
    this.fontWeight2 = FontWeight.w400,
    this.textAlign = TextAlign.justify,
    this.maxLines,
    this.overflow,
    this.decoration,
  }) : super(key: key);

  final String text;
  final String text2;
  final double? fontSize;
  final double? fontSize2;
  final Color? textColor;
  final Color? textColor2;
  final FontWeight? fontWeight;
  final FontWeight? fontWeight2;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: text,
        style: GoogleFonts.openSans(
          fontSize: fontSize,
          color: textColor,
          fontWeight: fontWeight,
          decoration: decoration,
        ),
        children: <InlineSpan>[
          TextSpan(
            text: text2,
            style: GoogleFonts.openSans(
              fontSize: fontSize2,
              color: textColor2,
              fontWeight: fontWeight2,
              decoration: decoration,
            ),
          )
        ],
      ),
    );
  }
}
