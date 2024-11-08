import 'package:developer_mode/responsiveness/responsive_layout_screen.dart';
import 'package:developer_mode/utils/my_text.dart';
import 'package:developer_mode/utils/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class ProfileDetailsLayout extends StatelessWidget {
  Map<String, dynamic> data;
  String type;

  ProfileDetailsLayout({required this.data, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveLayoutScreen.isDesktop(context)
              ? context.width * .45.sp
              : context.width * .725.sp,
          vertical: context.height * .25.sp,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (ResponsiveLayoutScreen.isDesktop(context))
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: ResponsiveLayoutScreen.isDesktop(context)
                          ? context.height * .45.sp
                          : context.height * .75.sp,
                    ),
                    Text(
                      data['name'],
                      textScaler: TextScaler.linear(4.5.sp),
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: context.height * .15.sp),
                    Text(
                      type,
                      textScaler: TextScaler.linear(3.75.sp),
                      style:
                          TextStyle(color: Color(0xff000000).withOpacity(0.6)),
                    ),
                  ],
                ),
              SizedBox(height: context.height * .65.sp),
              MyText(
                text: "Name:",
                textScale: ResponsiveLayoutScreen.isDesktop(context)
                    ? 2.95.sp
                    : ResponsiveLayoutScreen.isTablet(context)
                        ? 4.7.sp
                        : 5.75.sp,
                color: Color(0xff000000).withOpacity(0.5),
              ).paddingOnly(bottom: 8.sp),
              SizedBox(
                width: ResponsiveLayoutScreen.isDesktop(context)
                    ? context.width * 1.75.sp
                    : context.width - context.width * 1.5.sp,
                child: MyTextField(
                  weight: FontWeight.w400,
                  hint: data['name'],
                ),
              ),
              SizedBox(
                height: ResponsiveLayoutScreen.isDesktop(context)
                    ? context.height * .45.sp
                    : context.height * .75.sp,
              ),
              MyText(
                text: "Email :",
                textScale: ResponsiveLayoutScreen.isDesktop(context)
                    ? 2.95.sp
                    : ResponsiveLayoutScreen.isTablet(context)
                        ? 4.7.sp
                        : 5.75.sp,
                color: Color(0xff000000).withOpacity(0.5),
              ).paddingOnly(bottom: 8.sp),
              SizedBox(
                width: ResponsiveLayoutScreen.isDesktop(context)
                    ? context.width * 1.75.sp
                    : context.width - context.width * 1.5.sp,
                child: MyTextField(
                  weight: FontWeight.w400,
                  hint: data['email'],
                ),
              ),
              SizedBox(
                height: ResponsiveLayoutScreen.isDesktop(context)
                    ? context.height * .45.sp
                    : context.height * .75.sp,
              ),
              MyText(
                text: "Buyer registered date :",
                textScale: ResponsiveLayoutScreen.isDesktop(context)
                    ? 2.95.sp
                    : ResponsiveLayoutScreen.isTablet(context)
                        ? 4.7.sp
                        : 5.75.sp,
                color: Color(0xff000000).withOpacity(0.5),
              ).paddingOnly(bottom: 8.sp),
              SizedBox(
                width: ResponsiveLayoutScreen.isDesktop(context)
                    ? context.width * 1.75.sp
                    : context.width - context.width * 1.5.sp,
                child: MyTextField(
                  weight: FontWeight.w400,
                  hint: "${DateFormat("dd MMMM yyyy").format(DateTime.now())}",
                ),
              ),
              SizedBox(height: context.height * 1.sp),
            ],
          ),
        ),
      ),
    );
  }
}
