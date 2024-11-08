import 'package:developer_mode/dashboard_layouts/users_layouts/service_seekers/service_post_tab/invited_service_provider_layout.dart';
import 'package:developer_mode/dashboard_layouts/users_layouts/service_seekers/service_post_tab/post_details_layout.dart';
import 'package:developer_mode/responsiveness/responsive_layout_screen.dart';
import 'package:developer_mode/utils/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class PostDetailsTabsScreen extends StatelessWidget {
  Map<String, dynamic> data;
  String type;

  PostDetailsTabsScreen({required this.data, required this.type});

  @override
  Widget build(BuildContext context) {
    var names = [
      type == "Service Providers" ? "Service Details" : "Posts Details",
      if (type == "Service Seekers") "Invited Service Providers",
    ];
    return DefaultTabController(
      length: type == "Service Providers" ? 1 : 2,
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
              MyText(
                text: data['prof'],
                textScale: ResponsiveLayoutScreen.isDesktop(context)
                    ? 3.5.sp
                    : ResponsiveLayoutScreen.isTablet(context)
                        ? 5.25.sp
                        : 5.75.sp,
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
                      ? 2.9.sp
                      : ResponsiveLayoutScreen.isTablet(context)
                          ? 4.5.sp
                          : 4.85.sp,
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
                    child: TabBar(
                      indicatorPadding: EdgeInsets.zero,
                      textScaler: TextScaler.linear(
                        ResponsiveLayoutScreen.isDesktop(context)
                            ? 3.15.sp
                            : 3.8.sp,
                      ),
                      padding: EdgeInsets.zero,
                      labelPadding: EdgeInsets.symmetric(horizontal: 15.sp),
                      isScrollable: true,
                      dividerColor: Colors.transparent,
                      physics: !ResponsiveLayoutScreen.isDesktop(context)
                          ? BouncingScrollPhysics()
                          : NeverScrollableScrollPhysics(),
                      unselectedLabelStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color(0xff9499A1),
                      ),
                      tabAlignment: TabAlignment.start,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        // fontSize: 14.sp,
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
                                textScaler: TextScaler.linear(
                                  ResponsiveLayoutScreen.isDesktop(context)
                                      ? 3.15.sp
                                      : ResponsiveLayoutScreen.isTablet(context)
                                          ? 4.sp
                                          : 4.2.sp,
                                ),
                                names[index],
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
                      flex: 1,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Published ${DateFormat("MMM dd yyyy").format(
                            DateTime.now(),
                          )}",
                        ),
                      ),
                    ),
                ],
              ),
              Divider(
                height: 0,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    PostDetailsLayout(
                      data: data,
                      type: type,
                    ),
                    if (type == "Service Seekers")
                      InvitedServiceProviderLayout(type: type, data: data),
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
