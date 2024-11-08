import 'package:developer_mode/dashboard_layouts/users_layouts/service_seekers/profile_details_screen_tabs.dart';
import 'package:developer_mode/responsiveness/responsive_layout_screen.dart';
import 'package:developer_mode/utils/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ServiceProviderLayout extends StatelessWidget {
  Map<String, dynamic> data;
  String type;

  ServiceProviderLayout({required this.data, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MouseRegion(
        cursor: SystemMouseCursors.click, child: GestureDetector(
          onTap: () {
            Get.to(
              () => ProfileDetailsScreen(
                data: data,
                type: type,
              ),
            );
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            width: ResponsiveLayoutScreen.isDesktop(context)
                ? context.width * 1.25.sp
                : ResponsiveLayoutScreen.isTablet(context)
                    ? context.width * 2.5.sp
                    : context.width * 3.sp,
            margin: ResponsiveLayoutScreen.isDesktop(context)
                ? EdgeInsets.symmetric(
                    vertical: context.height * .75.sp, horizontal: 15.sp)
                : ResponsiveLayoutScreen.isTablet(context)
                    ? EdgeInsets.symmetric(
                        horizontal: context.width * .5.sp,
                        vertical: context.height * .5.sp,
                      )
                    : ResponsiveLayoutScreen.isMobile(context)
                        ? EdgeInsets.symmetric(
                            horizontal: context.width * .45.sp,
                            vertical: context.height * .3.sp,
                          )
                        : EdgeInsets.all(context.height * .425.sp),
            padding: EdgeInsets.symmetric(
              vertical: context.height * .5.sp,
              horizontal: context.width * .25.sp,
            ),
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(12.sp),
              border: Border.all(color: Color(0xff000000).withOpacity(0.15)),
              boxShadow: [
                if (ResponsiveLayoutScreen.isDesktop(context))
                  BoxShadow(
                    color: Color(0xff000000).withOpacity(0.1),
                    spreadRadius: 5.sp,
                    blurRadius: 15.sp,
                  ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: context.height * .4.sp,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: Image.network(
                    "https://picsum.photos/300/250",
                    height: ResponsiveLayoutScreen.isTablet(context)
                        ? context.height * 1.4.sp
                        : ResponsiveLayoutScreen.isDesktop(context)
                            ? context.height * 1.15.sp
                            : context.height * 1.35.sp,
                  ),
                ),
                SizedBox(
                  height: ResponsiveLayoutScreen.isDesktop(context)
                      ? context.height * .3.sp
                      : context.height * .5.sp,
                ),
                MyText(
                  text: data['name'],
                  weight: FontWeight.w700,
                  textScale: ResponsiveLayoutScreen.isDesktop(context)
                      ? 1
                      : ResponsiveLayoutScreen.isTablet(context)
                          ? 5.sp
                          : 1.75,
                  color: Color(0xff000041),
                ),
                SizedBox(
                  height: context.height * .25.sp,
                ),
                MyText(
                  text: data['address'],
                  weight: FontWeight.w400,
                  textScale: ResponsiveLayoutScreen.isDesktop(context)
                      ? 0.8
                      : ResponsiveLayoutScreen.isTablet(context)
                          ? 4.5.sp
                          : 1.5,
                  color: Color(0xff717579),
                ),
                MyText(
                  text: type,
                  weight: FontWeight.w600,
                  textScale: ResponsiveLayoutScreen.isDesktop(context)
                      ? 0.8
                      : ResponsiveLayoutScreen.isTablet(context)
                          ? 4.25.sp
                          : 1.2,
                  color: Color(0xff1B8271),
                ),
                SizedBox(
                  height: context.height * .65.sp,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedContainer(
                          padding: EdgeInsets.all(8.sp),
                          duration: Duration(milliseconds: 600),
                          decoration: BoxDecoration(
                            color: Color(0xff48B16A).withOpacity(0.1),
                          ),
                          child: SvgPicture.asset(
                            data["emailImg"],
                          ),
                        ),
                        SizedBox(
                          width: context.width * .4.sp,
                        ),
                        Text(
                          data["email"],
                          textScaler: TextScaler.linear(
                            ResponsiveLayoutScreen.isDesktop(context)
                                ? 0.7
                                : 0.895,
                          ),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: context.height * .35.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
