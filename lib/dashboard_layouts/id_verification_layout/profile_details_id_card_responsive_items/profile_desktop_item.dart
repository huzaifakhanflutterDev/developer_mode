import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/my_text.dart';
import '../../../utils/my_text_field.dart';

class ProfileDesktopItem extends StatelessWidget {
  Map<String, dynamic> data;
  String type;

  ProfileDesktopItem({required this.data, required this.type});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(context.height * .75.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.height * .45.sp),
            Text(
              data['name'],
              textScaler: TextScaler.linear(4.5.sp),
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: context.height * .15.sp),
            Text(
              type,
              textScaler: TextScaler.linear(3.75.sp),
            ),
            SizedBox(height: context.height * .65.sp),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: "Name:",
                      textScale: 2.95.sp,
                      color: Color(0xff000000).withOpacity(0.5),
                    ),
                    SizedBox(
                      height: context.height * .85.sp,
                      width: context.width * 1.75.sp,
                      child: MyTextField(
                        hint: data['name'],
                      ),
                    ),
                    SizedBox(height: context.height * .45.sp),
                    MyText(
                      text: "Email :",
                      textScale: 2.95.sp,
                      color: Color(0xff000000).withOpacity(0.5),
                    ),
                    SizedBox(
                      height: context.height * .85.sp,
                      width: context.width * 1.75.sp,
                      child: MyTextField(
                        hint: data['email'],
                      ),
                    ),
                    SizedBox(height: context.height * .45.sp),
                    MyText(
                      text: "Buyer registered date :",
                      textScale: 2.95.sp,
                      color: Color(0xff000000).withOpacity(0.5),
                    ),
                    SizedBox(
                      height: context.height * .85.sp,
                      width: context.width * 1.75.sp,
                      child: MyTextField(
                        hint:
                            "${DateFormat("dd MMMM yyyy").format(DateTime.now())}",
                      ),
                    ),
                    SizedBox(height: context.height * 1.sp),
                  ],
                ),
                SizedBox(width: context.width * 1.25.sp),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: "Identity Card :",
                      textScale: 2.95.sp,
                      color: Color(0xff000000).withOpacity(0.5),
                    ),
                    SizedBox(height: context.height * .45.sp),
                    SizedBox(
                      width: context.width * 1.45.sp,
                      height: context.height * 1.65.sp,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.sp),
                        child: Image.network(
                          "https://picsum.photos/350/220",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
