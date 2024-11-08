import 'package:developer_mode/dashboard_layouts/users_layouts/service_seekers/accepted_service_details_layout/chats_item/chats_layout.dart';
import 'package:developer_mode/dashboard_layouts/users_layouts/service_seekers/completed_services/rating_and_reviews_layout.dart';
import 'package:developer_mode/dashboard_layouts/users_layouts/service_seekers/service_post_tab/post_details_layout.dart';
import 'package:developer_mode/responsiveness/responsive_layout_screen.dart';
import 'package:developer_mode/utils/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class CompletedTabs extends StatelessWidget {
  Map<String, dynamic> data;
  String type;

  CompletedTabs({required this.data, required this.type});

  @override
  Widget build(BuildContext context) {
    var names = [
      "Service Details",
      "Chats",
      if (type == "Service Seekers") "Review & Ratings",
    ];
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Center(
              child: SvgPicture.asset(
                "assets/svgs/arrow.svg",
                height: 35,
              ),
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ResponsiveLayoutScreen.isDesktop(context)
                ? context.width * .4.sp
                : ResponsiveLayoutScreen.isTablet(context)
                    ? context.width * .6.sp
                    : context.width * .9.sp,
            vertical: context.height * .5.sp,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: data['prof'],
                    textScale: ResponsiveLayoutScreen.isDesktop(context)
                        ? 3.5.sp
                        : 5.5.sp,
                    weight: FontWeight.w700,
                    color: Color(0xff080B23),
                  ),
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: null,
                    label: MyText(
                      text: data['address'],
                      textScale: ResponsiveLayoutScreen.isDesktop(context)
                          ? 2.85.sp
                          : 4.5.sp,
                      weight: FontWeight.w400,
                      color: Color(0xff848484),
                    ),
                    icon: SvgPicture.asset(
                      "assets/svgs/map-pin.svg",
                      color: Color(0xff848484),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: ResponsiveLayoutScreen.isDesktop(context)
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: ResponsiveLayoutScreen.isDesktop(context)
                            ? 3
                            : ResponsiveLayoutScreen.isTablet(context)
                                ? 4
                                : 0,
                        child: TabBar(
                          padding: EdgeInsets.zero,
                          labelPadding: EdgeInsets.symmetric(
                            horizontal:
                                !ResponsiveLayoutScreen.isDesktop(context)
                                    ? 15.sp
                                    : 12.sp,
                          ),
                          tabAlignment: TabAlignment.start,
                          isScrollable: true,
                          dividerColor: Colors.grey[200],
                          physics: !ResponsiveLayoutScreen.isDesktop(context)
                              ? BouncingScrollPhysics()
                              : NeverScrollableScrollPhysics(),
                          unselectedLabelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff9499A1),
                          ),
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff1B8271),
                          ),
                          labelColor: Color(0xff1B8271),
                          indicatorColor: Color(0xff1B8271),
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
                                          ? 3.15.sp
                                          : ResponsiveLayoutScreen.isTablet(
                                                  context)
                                              ? 4.sp
                                              : 4.2.sp,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          flex:
                              ResponsiveLayoutScreen.isDesktop(context) ? 3 : 1,
                          child: SizedBox()),
                      !ResponsiveLayoutScreen.isMobile(context)
                          ? Expanded(
                              flex: 2,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: MyText(
                                  text:
                                      "Published ${DateFormat("MMM dd yyyy").format(DateTime.now())}",
                                  textScale:
                                      ResponsiveLayoutScreen.isDesktop(context)
                                          ? 3.sp
                                          : 4.5.sp,
                                  weight: FontWeight.w400,
                                  color: Color(0xff848484),
                                ),
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
                  Divider(
                    height: 0,
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    PostDetailsLayout(
                      data: data,
                      type: type,
                    ),
                    ChatsLayout(),
                    if (type == "Service Seekers") RatingAndReviewsLayout(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
