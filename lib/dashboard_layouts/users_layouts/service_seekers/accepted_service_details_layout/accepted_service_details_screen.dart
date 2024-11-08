import 'package:developer_mode/dashboard_layouts/users_layouts/service_seekers/accepted_service_details_layout/accepted_tabs.dart';
import 'package:developer_mode/utils/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../responsiveness/responsive_layout_screen.dart';

class AcceptedServiceDetailsLayout extends StatelessWidget {
  Map<String, dynamic> data;
  String type;

  AcceptedServiceDetailsLayout({required this.data, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 10.sp),
        child: SingleChildScrollView(
          physics: ResponsiveLayoutScreen.isMobile(context)
              ? AlwaysScrollableScrollPhysics()
              : NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: context.height * .5.sp,
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    Get.to(
                      () => AcceptedTabs(
                        data: data,
                        type: type,
                      ),
                    );
                  },
                  child: !ResponsiveLayoutScreen.isMobile(context)
                      ? Row(
                          children: List.generate(
                            2,
                            (index) {
                              return _buildingBody(context, index);
                            },
                          ),
                        )
                      : Column(
                          children: List.generate(
                            2,
                            (index) {
                              return _buildingBody(context, index);
                            },
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildingBody(BuildContext context, int index) {
    return Container(
      margin: !ResponsiveLayoutScreen.isMobile(context)
          ? EdgeInsets.only(
              left: ResponsiveLayoutScreen.isDesktop(context)
                  ? context.width * .4.sp
                  : context.width * .55.sp,
            )
          : EdgeInsets.symmetric(
              vertical: context.height * .75.sp,
              horizontal: context.width * .65.sp),
      padding: EdgeInsets.all(
        ResponsiveLayoutScreen.isDesktop(context)
            ? context.width * .3.sp
            : context.width * .4.sp,
      ),
      width: ResponsiveLayoutScreen.isDesktop(context)
          ? context.width * 1.8.sp
          : ResponsiveLayoutScreen.isTablet(context)
              ? type == "Service Providers"
                  ? context.width * 2.65.sp
                  : context.width * 2.65.sp
              : null,
      height: ResponsiveLayoutScreen.isDesktop(context)
          ? context.height * 2.2.sp
          : type == "Service Providers"
              ? context.height * 2.475.sp
              : ResponsiveLayoutScreen.isTablet(context)
                  ? context.height * 2.35.sp
                  : context.height * 2.6.sp,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff000000).withOpacity(0.2)),
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(12.sp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (type == "Service Providers")
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      right: ResponsiveLayoutScreen.isDesktop(context)
                          ? context.width * .175.sp
                          : context.width * .5.sp),
                  height:
                      ResponsiveLayoutScreen.isDesktop(context) ? 25.sp : 34.sp,
                  width:
                      ResponsiveLayoutScreen.isDesktop(context) ? 25.sp : 34.sp,
                  decoration: BoxDecoration(
                    color: Color(0xffF7F7F7),
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  child: Center(
                    child: CircleAvatar(
                      radius: !ResponsiveLayoutScreen.isDesktop(context)
                          ? 20.sp
                          : 15.75.sp,
                      backgroundImage: NetworkImage(
                        data['image'] + "?random=$index",
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: data['name'],
                      textScale: ResponsiveLayoutScreen.isDesktop(context)
                          ? 2.875.sp
                          : ResponsiveLayoutScreen.isTablet(context)
                              ? 4.5.sp
                              : 4.75.sp,
                      family: "Mont",
                    ),
                    MyText(
                      text: data['prof'].toString(),
                      textScale: ResponsiveLayoutScreen.isDesktop(context)
                          ? 3.45.sp
                          : ResponsiveLayoutScreen.isTablet(context)
                              ? 5.sp
                              : 5.25.sp,
                      weight: FontWeight.w700,
                      family: "Mont",
                    ),
                    MyText(
                      text: data['address'],
                      textScale: ResponsiveLayoutScreen.isDesktop(context)
                          ? 2.75.sp
                          : ResponsiveLayoutScreen.isTablet(context)
                              ? 4.25.sp
                              : 5.sp,
                      weight: FontWeight.w400,
                      color: Color(0xff797C86),
                      family: "Mont",
                    ),
                  ],
                )
              ],
            ),
          if (type == "Service Seekers")
            MyText(
              text: "Figma",
              textScale: ResponsiveLayoutScreen.isDesktop(context)
                  ? 3.15.sp
                  : ResponsiveLayoutScreen.isTablet(context)
                      ? 4.5.sp
                      : 5.5.sp,
              weight: FontWeight.w500,
            ),
          if (type == "Service Seekers")
            MyText(
              text: data['prof'].toString(),
              textScale: ResponsiveLayoutScreen.isDesktop(context)
                  ? 3.45.sp
                  : ResponsiveLayoutScreen.isTablet(context)
                      ? 4.85.sp
                      : 6.25.sp,
              weight: FontWeight.w700,
            ),
          if (type == "Service Seekers")
            MyText(
              text: data['address'],
              textScale: ResponsiveLayoutScreen.isDesktop(context)
                  ? 2.75.sp
                  : ResponsiveLayoutScreen.isTablet(context)
                      ? 4.sp
                      : 5.25.sp,
              weight: FontWeight.w400,
              color: Color(0xff797C86),
            ),
          Spacer(),
          _buildElevatedButtonData(context),
          Spacer(),
          SizedBox(height: context.height * .25.sp),
          MyText(
            text: data['budget'],
            family: "Satoshi",
            textScale: ResponsiveLayoutScreen.isDesktop(context)
                ? 2.8.sp
                : ResponsiveLayoutScreen.isTablet(context)
                    ? type == "Service Providers"
                        ? 4.25.sp
                        : 4.sp
                    : 4.5.sp,
            weight: FontWeight.w500,
            color: Color(0xff000000).withOpacity(0.5),
          ),
          Spacer(),
          SizedBox(height: context.height * .5.sp),
          Text(
            data['desc'],
            textScaler: TextScaler.linear(
              ResponsiveLayoutScreen.isDesktop(context)
                  ? 2.9.sp
                  : type == "Service Providers"
                      ? 3.65.sp
                      : ResponsiveLayoutScreen.isTablet(context)
                          ? 3.5.sp
                          : 4.sp,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(color: Color(0xff797C86)),
          ),
          Spacer(),
          _buildAvailableRow(context),
          Spacer(),
        ],
      ),
    );
  }

  Widget _buildAvailableRow(BuildContext context) {
    return Row(
      mainAxisAlignment: type == "Service Seekers"
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 7.sp),
          margin: EdgeInsets.all(context.height * .25.sp),
          decoration: BoxDecoration(
            color: Color(0xffF8F9FA),
            borderRadius: BorderRadius.circular(5.sp),
          ),
          child: Center(
            child: MyText(
              text: type == "Service Providers" ? "Available" : "In-Progress",
              color: Color(0xff1B8271),
              textScale: ResponsiveLayoutScreen.isDesktop(context)
                  ? 2.75.sp
                  : ResponsiveLayoutScreen.isTablet(context)
                      ? type == "Service Providers"
                          ? 3.97.sp
                          : 3.5.sp
                      : 5.sp,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildElevatedButtonData(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: context.width * .0.sp,
        vertical: !ResponsiveLayoutScreen.isMobile(context)
            ? context.height * .35.sp
            : context.height * .5.sp,
      ),
      decoration: BoxDecoration(
          color: Color(0xffF8F9FA), borderRadius: BorderRadius.circular(5.sp)),
      child: MyText(
        text: data['time'],
        textScale: ResponsiveLayoutScreen.isDesktop(context)
            ? 2.8.sp
            : ResponsiveLayoutScreen.isTablet(context)
                ? type == "Service Providers"
                    ? 3.975.sp
                    : 3.75.sp
                : 5.sp,
        color: Color(0xff000000),
      ).paddingAll(10.sp),
    );
  }
}
