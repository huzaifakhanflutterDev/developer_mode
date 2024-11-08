import 'package:developer_mode/dashboard_layouts/users_layouts/service_seekers/profile_details_screen_tabs.dart';
import 'package:developer_mode/responsiveness/responsive_layout_screen.dart';
import 'package:developer_mode/utils/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class InvitedServiceProviderLayout extends StatelessWidget {
  Map<String, dynamic> data;

  String type;

  InvitedServiceProviderLayout({
    required this.type,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (type == "Service Seekers")
              Text(
                "25 Invited Providers ",
                textScaler: TextScaler.linear(
                  ResponsiveLayoutScreen.isDesktop(context) ? 3.25.sp : 4.25.sp,
                ),
                style: TextStyle(
                  color: Color(0xff848484),
                ),
              ).paddingSymmetric(
                  vertical: context.height * .5.sp,
                  horizontal: context.width * .25.sp),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: type == "Service Providers" ? 1 : 8,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    ResponsiveLayoutScreen.isDesktop(context) ? 6 : 2,
                childAspectRatio:
                    ResponsiveLayoutScreen.isDesktop(context) ? 2.8.sp : 4.sp,
              ),
              itemBuilder: (_, index) {
                return _buildBody(context, index);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, int index) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          var newType = type == "Service Providers"
              ? "Service Seekers"
              : "Service Providers";
          Get.to(
            () => type == "Service Providers"
                ? ProfileDetailsScreen(data: data, type: newType)
                : ProfileDetailsScreen(data: data, type: newType),
          );
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 600),
          width: ResponsiveLayoutScreen.isDesktop(context)
              ? context.width * 1.25.sp
              : context.width * 2.5.sp,
          margin: ResponsiveLayoutScreen.isDesktop(context)
              ? EdgeInsets.all(context.height * .3.sp)
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
          padding: EdgeInsets.all(context.height * .5.sp),
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.circular(12.sp),
            boxShadow: [
              ResponsiveLayoutScreen.isDesktop(context)
                  ? BoxShadow(
                      color: Color(0xff000000).withOpacity(0.1),
                      spreadRadius: 5.sp,
                      blurRadius: 15.sp,
                    )
                  : BoxShadow(
                      color: Color(0xff000000).withOpacity(.2),
                      spreadRadius: 2.sp,
                      blurRadius: 1.sp,
                    ),
            ],
          ),
          child: Column(
            children: [
              Spacer(),
              ClipRRect(
                borderRadius: BorderRadius.circular(9.sp),
                child: Image.network(
                  "https://picsum.photos/250/220/?random=$index",
                  height: ResponsiveLayoutScreen.isTablet(context)
                      ? context.height * 1.6.sp
                      : ResponsiveLayoutScreen.isDesktop(context)
                          ? context.height * 1.15.sp
                          : context.height * 1.35.sp,
                ),
              ),
              Spacer(),
              // SizedBox(
              //   height: ResponsiveLayoutScreen.isDesktop(context)
              //       ? context.height * .15.sp
              //       : context.height * .35.sp,
              // ),
              MyText(
                text: data['name'],
                weight: FontWeight.w600,
                textScale: ResponsiveLayoutScreen.isDesktop(context)
                    ? 1
                    : ResponsiveLayoutScreen.isTablet(context)
                        ? 1.8
                        : 1.75,
                color: Color(0xff000041),
              ),
              // SizedBox(
              //   height: ResponsiveLayoutScreen.isDesktop(context)
              //       ? context.height * .15.sp
              //       : context.height * .35.sp,
              // ),
              Spacer(),
              MyText(
                text: data['address'],
                weight: FontWeight.w400,
                textScale: ResponsiveLayoutScreen.isDesktop(context)
                    ? 0.75
                    : ResponsiveLayoutScreen.isTablet(context)
                        ? 1.3
                        : 1.5,
                color: Color(0xff717579),
              ),
              // Spacer(),
              MyText(
                text: type == "Service Providers"
                    ? "Service Seekers"
                    : "Service Providers",
                weight: FontWeight.w600,
                textScale: ResponsiveLayoutScreen.isDesktop(context)
                    ? 0.7
                    : ResponsiveLayoutScreen.isTablet(context)
                        ? 1.3
                        : 1.2,
                color: Color(0xff1B8271),
              ),
              Spacer(),
              // SizedBox(
              //   height: context.height * .4.sp,
              // ),
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
                        duration: Duration(milliseconds: 600),
                        decoration: BoxDecoration(
                          color: Color(0xff48B16A).withOpacity(0.1),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(2),
                          child: SvgPicture.asset(
                            data["emailImg"],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: !ResponsiveLayoutScreen.isMobile(context)
                            ? context.width * .25.sp
                            : context.width * .5.sp,
                      ),
                      Text(
                        data["email"],
                        textScaler: TextScaler.linear(
                          ResponsiveLayoutScreen.isDesktop(context)
                              ? 0.7
                              : 3.75.sp,
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
              Spacer(),
              // Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
