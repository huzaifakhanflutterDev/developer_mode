import 'package:developer_mode/controller/side_bar_controller.dart';
import 'package:developer_mode/dashboard_layouts/users_layouts/service_seekers/accepted_service_details_layout/accepted_service_details_screen.dart';
import 'package:developer_mode/dashboard_layouts/users_layouts/service_seekers/completed_services/completed_services_screen.dart';
import 'package:developer_mode/dashboard_layouts/users_layouts/service_seekers/profile_details_screen.dart';
import 'package:developer_mode/responsiveness/responsive_layout_screen.dart';
import 'package:developer_mode/utils/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'service_post_tab/service_post_screen.dart';

class ProfileDetailsScreen extends StatelessWidget {
  Map<String, dynamic> data;
  String type;

  ProfileDetailsScreen({required this.data, required this.type});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SideBarController());
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: ResponsiveLayoutScreen.isDesktop(context) ||
                      ResponsiveLayoutScreen.isTablet(context)
                  ? context.height * 1.15.sp
                  : context.height * 1.3.sp,
              color: Color(0xff1B8271),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: SvgPicture.asset(
                        "assets/svgs/arrow.svg",
                        height: !ResponsiveLayoutScreen.isMobile(context)
                            ? 20.sp
                            : 22.sp,
                      ).paddingOnly(left: 15.sp),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: !ResponsiveLayoutScreen.isMobile(context)
                            ? context.width * .45.sp
                            : context.width * .65.sp,
                      ),
                      height: !ResponsiveLayoutScreen.isMobile(context)
                          ? context.height * .75.sp
                          : context.height * .85.sp,
                      width: ResponsiveLayoutScreen.isDesktop(context)
                          ? context.width * .9.sp
                          : ResponsiveLayoutScreen.isTablet(context)
                              ? context.width * 1.65.sp
                              : context.width * 2.2.sp,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: Color(0xffF8F9FA),
                          surfaceTintColor: Colors.transparent,
                          minimumSize:
                              Size(context.width.sp, context.height * 0.065.sp),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              ResponsiveLayoutScreen.isDesktop(context)
                                  ? context.height * .2.sp
                                  : context.height * .25.sp,
                            ),
                          ),
                        ).copyWith(
                          elevation: ButtonStyleButton.allOrNull(0),
                        ),
                        onPressed: () {},
                        child: MyText(
                          text: controller.selectedIndex.value == 4
                              ? "Unblock User"
                              : "Block User",
                          textScale: ResponsiveLayoutScreen.isDesktop(context)
                              ? 2.75.sp
                              : ResponsiveLayoutScreen.isTablet(context)
                                  ? 4.25.sp
                                  : 4.85.sp,
                          color: Color(0xff1B8271),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildTabbar(context),
            Expanded(
              child: TabBarView(
                children: [
                  ProfileDetailsLayout(
                    data: data,
                    type: type,
                  ),
                  ServicePostScreen(
                    type: type,
                    data: data,
                  ),
                  AcceptedServiceDetailsLayout(
                    data: data,
                    type: type,
                  ),
                  CompletedServiceLayout(
                    data: data,
                    type: type,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabbar(BuildContext context) {
    var names = [
      "Profile Details",
      type == "Service Providers" ? "Completed Services" : "Service Posts",
      type == "Service Providers"
          ? "Applied Posts"
          : "Accepted Services details",
      type == "Service Providers"
          ? "Accepted Services details"
          : "Completed Services",
    ];
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Card(
          color: Color(0xffffffff),
          elevation: 0,
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: ResponsiveLayoutScreen.isDesktop(context)
                        ? context.width * 1.4.sp
                        : ResponsiveLayoutScreen.isTablet(context)
                            ? context.width * .335
                            : context.width * 3.sp,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          MyText(
                            text: data['name'],
                            weight: FontWeight.w600,
                            textScale: ResponsiveLayoutScreen.isDesktop(context)
                                ? 3.5.sp
                                : ResponsiveLayoutScreen.isTablet(context)
                                    ? 4.8.sp
                                    : 5.95.sp,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 12.sp),
                            padding: EdgeInsets.symmetric(horizontal: 10.sp),
                            decoration: BoxDecoration(
                                color: Color(0xff1B8271),
                                borderRadius: BorderRadius.circular(12.sp)),
                            child: MyText(
                              weight: FontWeight.w400,
                              spacing: .8,
                              textScale:
                                  ResponsiveLayoutScreen.isDesktop(context)
                                      ? 2.5.sp
                                      : ResponsiveLayoutScreen.isTablet(context)
                                          ? 3.8.sp
                                          : 4.75.sp,
                              text: "Verified",
                              family: "Satoshi",
                              color: Color(0xffFFFFFF),
                            ),
                          ),
                        ],
                      ),
                      if (!ResponsiveLayoutScreen.isDesktop(context))
                        SizedBox(
                          height: context.height * .3.sp,
                        ),
                      MyText(
                        text: "@ " + type.toString(),
                        color: Color(0xff9499A1),
                        weight: FontWeight.w400,
                        textScale: ResponsiveLayoutScreen.isDesktop(context)
                            ? 2.5.sp
                            : ResponsiveLayoutScreen.isTablet(context)
                                ? 3.8.sp
                                : 4.85.sp,
                      ),
                      TextButton.icon(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: null,
                        label: MyText(
                          text: data['address'],
                          color: Color(0xff9499A1),
                          weight: FontWeight.w400,
                          textScale: ResponsiveLayoutScreen.isDesktop(context)
                              ? 2.5.sp
                              : ResponsiveLayoutScreen.isTablet(context)
                                  ? 3.8.sp
                                  : 4.85.sp,
                        ),
                        icon: SvgPicture.asset("assets/svgs/map-pin.svg"),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15.sp),
              if (ResponsiveLayoutScreen.isDesktop(context)) Divider(),
              Row(
                mainAxisAlignment: ResponsiveLayoutScreen.isDesktop(context)
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: TabBar(
                      dividerHeight: 0,
                      indicatorPadding: EdgeInsets.zero,
                      isScrollable: true,
                      dividerColor: Colors.transparent,
                      physics: !ResponsiveLayoutScreen.isDesktop(context)
                          ? BouncingScrollPhysics()
                          : NeverScrollableScrollPhysics(),
                      unselectedLabelStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color(0xff9499A1),
                      ),
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        // fontSize: 14.sp,
                        color: Color(0xff000000),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 0.sp),
                      tabAlignment: TabAlignment.start,
                      labelPadding: ResponsiveLayoutScreen.isDesktop(context)
                          ? EdgeInsets.symmetric(horizontal: 12.sp)
                          : EdgeInsets.symmetric(horizontal: 15.sp),
                      labelColor: Color(0xff000000),
                      indicatorColor: Color(0xff000000),
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: [
                        ...List.generate(
                          names.length,
                          (index) {
                            return Tab(
                              child: Text(
                                names[index],
                                textScaler: TextScaler.linear(
                                  ResponsiveLayoutScreen.isDesktop(context)
                                      ? 3.sp
                                      : ResponsiveLayoutScreen.isTablet(context)
                                          ? 3.65.sp
                                          : 4.sp,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  if (ResponsiveLayoutScreen.isDesktop(context))
                    Expanded(
                      flex: 6,
                      child: SizedBox(),
                    ),
                ],
              ),
              Divider(
                height: 2.sp,
                color: Color(0xffDEE2E6),
              )
            ],
          ),
        ),
        Positioned(
          top: ResponsiveLayoutScreen.isDesktop(context)
              ? -context.height * .9.sp
              : ResponsiveLayoutScreen.isTablet(context)
                  ? -context.height * .9.sp
                  : -context.height * 1.sp,
          bottom: ResponsiveLayoutScreen.isDesktop(context)
              ? context.height * 1.1.sp
              : ResponsiveLayoutScreen.isTablet(context)
                  ? context.height * 1.25.sp
                  : context.height * 1.45.sp,
          left: ResponsiveLayoutScreen.isDesktop(context)
              ? context.width * .8.sp
              : ResponsiveLayoutScreen.isTablet(context)
                  ? context.width * 1.3.sp
                  : context.width * 1.7.sp,
          child: SizedBox(
            height: ResponsiveLayoutScreen.isDesktop(context)
                ? context.height * 1.sp
                : ResponsiveLayoutScreen.isTablet(context)
                    ? context.height * 1.7.sp
                    : context.height * 2.35.sp,
            width: ResponsiveLayoutScreen.isDesktop(context)
                ? context.width * 1.1.sp
                : ResponsiveLayoutScreen.isTablet(context)
                    ? context.width * 1.7.sp
                    : context.width * 2.35.sp,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.sp),
              child: Image.network(
                "https://picsum.photos/200",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//  'image'
