import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/my_elevated_button.dart';
import '../../../utils/my_text.dart';
import '../../../utils/my_text_field.dart';

class ProfileMobItem extends StatelessWidget {
  Map<String, dynamic> data;
  String type;

  ProfileMobItem({required this.data, required this.type});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(context.height * .75.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(height: context.height * .75.sp),
            Text(
              data['name'],
              textScaler: TextScaler.linear(5.75.sp),
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: context.height * .15.sp),
            Text(
              type,
              textScaler: TextScaler.linear(5.sp),
            ),
            SizedBox(height: context.height * .65.sp),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: "Name:",
                  textScale: 5.5.sp,
                  color: Color(0xff000000).withOpacity(0.5),
                ),
                MyTextField(
                  hint: data['name'],
                ),
                SizedBox(height: context.height * .75.sp),
                MyText(
                  text: "Email :",
                   textScale: 5.5.sp,
                  color: Color(0xff000000).withOpacity(0.5),
                ),
                MyTextField(
                  hint: data['email'],
                ),
              SizedBox(height: context.height * .75.sp),
                MyText(
                  text: "Buyer registered date :",
                   textScale: 5.5.sp,
                  color: Color(0xff000000).withOpacity(0.5),
                ),
                MyTextField(
                  hint: "${DateFormat("dd MMMM yyyy").format(DateTime.now())}",
                ),
                SizedBox(height: context.height * 1.sp),
              ],
            ),
            SizedBox(width: context.width * 1.sp),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: "Identity Card :",
                   textScale: 5.5.sp,
                  color: Color(0xff000000).withOpacity(0.5),
                ),
              SizedBox(height: context.height * .5.sp),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.sp),
                  child: Image.network(
                    "https://picsum.photos/200/110",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(height: context.height * 1.sp),
            ElevatedBtn(
              radius: 10.sp,
              onPressed: () {},
              text: Text(
                "Approve ID",
                textScaler: TextScaler.linear(4.15.sp),
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                ),
              ),
            ).paddingSymmetric(horizontal: context.width * 1.25.sp),
          ],
        ),
      ),
    );
  }
}
