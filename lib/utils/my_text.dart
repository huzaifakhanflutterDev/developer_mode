import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MyText extends StatelessWidget {
  String text;
  double size, textScale;
  FontWeight weight;
  Color color;
  TextAlign align;
  double spacing;
  String family;
  FontStyle style;
  TextOverflow overflow;

  MyText({
    this.overflow = TextOverflow.ellipsis,
    this.textScale = 0.7,
    this.family = "Poppin",
    this.align = TextAlign.start,
    this.spacing = 0.0,
    required this.text,
    this.size = 13,
    this.weight = FontWeight.w500,
    this.color = const Color(0xff000000),
    this.style = FontStyle.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      textScaleFactor: textScale,
      overflow: overflow,
      style: TextStyle(
        letterSpacing: spacing,
        fontWeight: weight,
        fontSize: size.sp,
        color: color,
        fontFamily: family,
        fontStyle: style,
      ),
    ).paddingSymmetric(vertical: context.height * .1.sp);
  }
}
