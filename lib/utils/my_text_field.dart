import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyTextField extends StatelessWidget {
  String hint;
  Widget? suffix;
  TextEditingController? controller;

  String? Function(String?)? validator;
  Color fillColor;
  double? font;
  FontWeight weight;

  MyTextField({
    this.controller,
    this.weight = FontWeight.w500,
    this.fillColor = Colors.transparent,
    this.validator,
    this.font = 12,
    this.suffix,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 18.sp),
      decoration: BoxDecoration(
        color: Color(0xffD9D9D9).withOpacity(0.3),
        borderRadius: BorderRadius.circular(8.sp),
      ),
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          hoverColor: Color(0xffffffff),
          focusColor: Color(0xffffffff),
          border: InputBorder.none,
          hintText: hint,
          // filled: true,
          // fillColor: Color(0xffD9D9D9).withOpacity(0.3),
          hintStyle: TextStyle(
            fontSize: font,
            fontWeight: weight,
          ),
          suffixIcon: suffix,
        ),
      ),
    );
  }
}
