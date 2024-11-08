import 'package:developer_mode/dashboard_layouts/id_verification_layout/profile_details_id_card_responsive_items/profile_desktop_item.dart';
import 'package:developer_mode/dashboard_layouts/id_verification_layout/profile_details_id_card_responsive_items/profile_mob_item.dart';
import 'package:developer_mode/dashboard_layouts/id_verification_layout/profile_details_id_card_responsive_items/profile_tab_item.dart';
import 'package:developer_mode/responsiveness/responsive_layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/my_text.dart';

class ProfileDetailsIdCard extends StatelessWidget {
  Map<String, dynamic> data;
  String type;

  ProfileDetailsIdCard({required this.data, required this.type});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: ResponsiveLayoutScreen.isDesktop(context)
                  ? context.height * 1.sp
                  : ResponsiveLayoutScreen.isTablet(context)
                      ? context.height * 1.15.sp
                      : context.height * 1.25.sp,
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
                        height: 20.sp,
                      ),
                    ).paddingOnly(left: 12.sp),
                    Container(
                      margin: EdgeInsets.all(context.height * .5.sp),
                      height: ResponsiveLayoutScreen.isDesktop(context)
                          ? context.height * .685.sp
                          : ResponsiveLayoutScreen.isDesktop(context)
                              ? context.height * .7.sp
                              : context.height * .8.sp,
                      width: ResponsiveLayoutScreen.isDesktop(context)
                          ? context.width * .9.sp
                          : ResponsiveLayoutScreen.isTablet(context)
                              ? context.width * 1.6.sp
                              : context.width * 2.2.sp,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: Color(0xffF8F9FA),
                          surfaceTintColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ).copyWith(
                          elevation: ButtonStyleButton.allOrNull(0),
                        ),
                        onPressed: () {},
                        child: MyText(
                          text: "Block User",
                          textScale: ResponsiveLayoutScreen.isDesktop(context)
                              ? 2.95.sp
                              : ResponsiveLayoutScreen.isDesktop(context)
                                  ? 3.85.sp
                                  : 4.75.sp,
                          color: Color(0xff1B8271),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildTabbar(context),
            _buildTabbarView(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTabbar(BuildContext context) {
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
                        ? context.width * 1.3.sp
                        : ResponsiveLayoutScreen.isTablet(context)
                            ? context.width * .32
                            : context.width * .45,
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
                                    : 6.sp,
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
                                          : 4.85.sp,
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
                                : 5.sp,
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
                                  : 5.sp,
                        ),
                        icon: SvgPicture.asset("assets/svgs/map-pin.svg"),
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                    ],
                  ),
                ],
              ),
              if (ResponsiveLayoutScreen.isDesktop(context)) Divider(),
              Row(
                mainAxisAlignment: ResponsiveLayoutScreen.isDesktop(context)
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: TabBar(
                      isScrollable: true,
                      dividerColor: Colors.transparent,
                      tabAlignment: TabAlignment.start,
                      physics: NeverScrollableScrollPhysics(),
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xff000000),
                      ),
                      labelPadding: EdgeInsets.symmetric(
                        horizontal: 20.sp,
                      ),
                      labelColor: Color(0xff000000),
                      indicatorColor: Color(0xff000000),
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: [
                        Tab(
                          child: MyText(
                            text: "Profile Details & ID Card",
                            textScale: ResponsiveLayoutScreen.isDesktop(context)
                                ? 3.sp
                                : ResponsiveLayoutScreen.isDesktop(context)
                                    ? 2.sp
                                    : 5.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (ResponsiveLayoutScreen.isDesktop(context))
                    Expanded(
                      flex: 5,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: context.width * .45.sp),
                          child: SizedBox(
                            width: ResponsiveLayoutScreen.isDesktop(context)
                                ? context.width * .08
                                : ResponsiveLayoutScreen.isTablet(context)
                                    ? context.width * .2
                                    : context.width * .3,
                            height: 35,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                backgroundColor: Color(0xff000000),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    context.height * .15.sp,
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              child: MyText(
                                text: "Approve ID",
                                textScale:
                                    ResponsiveLayoutScreen.isDesktop(context)
                                        ? .75
                                        : 1.15,
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              if (ResponsiveLayoutScreen.isDesktop(context))
                Divider(
                  height: 2.sp,
                  color: Color(0xffDEE2E6),
                )
            ],
          ),
        ),
        Positioned(
          top: ResponsiveLayoutScreen.isDesktop(context)
              ? -context.height * .8.sp
              : ResponsiveLayoutScreen.isTablet(context)
                  ? -context.height * .9.sp
                  : -context.height * 1.sp,
          bottom: ResponsiveLayoutScreen.isDesktop(context)
              ? context.height * 1.15.sp
              : ResponsiveLayoutScreen.isTablet(context)
                  ? context.height * 1.3.sp
                  : context.height * 1.45.sp,
          left: ResponsiveLayoutScreen.isDesktop(context)
              ? context.width * .75.sp
              : ResponsiveLayoutScreen.isTablet(context)
                  ? context.width * 1.275.sp
                  : context.width * 1.65.sp,
          child: SizedBox(
            height: ResponsiveLayoutScreen.isDesktop(context)
                ? context.height * 1.1.sp
                : ResponsiveLayoutScreen.isTablet(context)
                    ? context.height * 1.7.sp
                    : context.height * 2.35.sp,
            width: ResponsiveLayoutScreen.isDesktop(context)
                ? context.width * 1.sp
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

  Widget _buildTabbarView(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.sp),
        child: TabBarView(
          children: [
            ResponsiveLayoutScreen(
              mobile: ProfileMobItem(
                data: data,
                type: type,
              ),
              tablet: ProfileTabItem(
                data: data,
                type: type,
              ),
              desktop: ProfileDesktopItem(
                data: data,
                type: type,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
