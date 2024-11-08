import 'package:developer_mode/responsiveness/responsive_layout_screen.dart';
import 'package:developer_mode/screens/dashboard_screen_items/dashboard_screen.dart';
import 'package:developer_mode/utils/my_elevated_button.dart';
import 'package:developer_mode/utils/my_text.dart';
import 'package:developer_mode/utils/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildLoginBody(context),
    );
  }

  Widget _buildLoginBody(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
        width: ResponsiveLayoutScreen.isDesktop(context)
            ? context.width * 2.2.sp
            : context.width * 3.65.sp,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              "assets/svgs/logo.svg",
              height: !ResponsiveLayoutScreen.isDesktop(context)
                  ? context.height * 1.5.sp
                  : null,
            ),
            SizedBox(height: context.height * .85.sp),
            MyText(
              textScale: ResponsiveLayoutScreen.isDesktop(context)
                  ? 1.4
                  : ResponsiveLayoutScreen.isTablet(context)
                      ? 1.75
                      : 2,
              text: "Sign into Admin Dashboard",
              // size: .sp,
              weight: FontWeight.w500,
              color: Color(0xff000000).withOpacity(0.5),
            ),
            SizedBox(height: context.height * .85.sp),
            MyTextField(
              hint: "Email",
              suffix: Container(
                width: context.width * .25.sp,
                child: Center(
                  child: SvgPicture.asset(
                    "assets/svgs/email.svg",
                    height: ResponsiveLayoutScreen.isDesktop(context) ||
                            ResponsiveLayoutScreen.isTablet(context)
                        ? 13
                        : 15,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: context.height * .45.sp),
            MyTextField(
              hint: "Password",
              suffix: Container(
                width: context.width * .25.sp,
                child: Center(
                  child: SvgPicture.asset(
                    "assets/svgs/password.svg",
                    height: ResponsiveLayoutScreen.isDesktop(context) ||
                            ResponsiveLayoutScreen.isTablet(context)
                        ? 14
                        : 18,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: context.height * 1.sp),
            ElevatedBtn(
              onPressed: () {
                Get.to(() => DashboardScreen());
              },
              radius: 5.sp,
              color: Color(0xff1B8271),
              text: MyText(
                text: "Sign in",
                textScale: ResponsiveLayoutScreen.isDesktop(context)
                    ? 1.13
                    : ResponsiveLayoutScreen.isTablet(context)
                        ? 1.5
                        : 2,
                weight: FontWeight.w400,
                color: Color(0xffFFFFFF),
              ),
            ).paddingSymmetric(
              horizontal: ResponsiveLayoutScreen.isDesktop(context)
                  ? context.width * 1.2.sp
                  : ResponsiveLayoutScreen.isTablet(context)
                      ? context.width * 2.sp
                      : context.width * 1.75.sp,
            ),
          ],
        ),
      ),
    );
  }
}
