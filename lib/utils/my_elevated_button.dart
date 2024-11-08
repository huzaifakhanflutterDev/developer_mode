import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ElevatedBtn extends StatelessWidget {
  VoidCallback? onPressed;
  Widget text;
  Color color;
  double radius;

  ElevatedBtn({
    this.radius = 12,
    required this.onPressed,
    this.color = const Color(0xff1B8271),
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        surfaceTintColor: Colors.transparent,

        minimumSize: Size(context.width.sp, context.height * 0.065.sp),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ).copyWith(
        elevation: ButtonStyleButton.allOrNull(0),
      ),
      onPressed: onPressed,
      child: text.paddingSymmetric(
        horizontal: context.width * .00.sp,
        vertical: context.height * .4.sp,
      ),
    );
  }
}
