import 'package:developer_mode/dashboard_layouts/users_layouts/service_seekers/profile_details_screen_tabs.dart';
import 'package:developer_mode/responsiveness/responsive_layout_screen.dart';
import 'package:developer_mode/utils/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class PostDetailsLayout extends StatelessWidget {
  Map<String, dynamic> data;
  String type;

  PostDetailsLayout({required this.data, required this.type});

  @override
  Widget build(BuildContext context) {
    var names = ["Muhammad Ali ", "Romandetta "];
    var profs = ["(Service Provider)", "(Service Seeker)"];

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.sp),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: context.height * .5.sp,
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    var newType = type == "Service Providers"
                        ? "Service Seekers"
                        : "Service Providers";
                    Get.to(
                      () => newType == "Service Seekers"
                          ? ProfileDetailsScreen(data: data, type: newType)
                          : ProfileDetailsScreen(data: data, type: newType),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(20.sp),
                    decoration: BoxDecoration(
                      color: Color(0xffF6F6F6),
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 26.sp,
                          backgroundImage: NetworkImage(
                            "https://picsum.photos/200/?random=7",
                          ),
                        ),
                        SizedBox(
                            width: ResponsiveLayoutScreen.isDesktop(context)
                                ? context.width * .5.sp
                                : context.width * .75.sp),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              text: data['name'],
                              weight: FontWeight.w700,
                              textScale:
                                  ResponsiveLayoutScreen.isDesktop(context)
                                      ? 3.5.sp
                                      : ResponsiveLayoutScreen.isTablet(context)
                                          ? 5.sp
                                          : 5.95.sp,
                            ),
                            TextButton.icon(
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero),
                              onPressed: null,
                              label: MyText(
                                text: data['address'],
                                color: Color(0xff9499A1),
                                weight: FontWeight.w400,
                                textScale: ResponsiveLayoutScreen.isDesktop(
                                        context)
                                    ? 2.5.sp
                                    : ResponsiveLayoutScreen.isTablet(context)
                                        ? 4.25.sp
                                        : 4.85.sp,
                              ),
                              icon: SvgPicture.asset("assets/svgs/map-pin.svg"),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 9.sp),
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.sp,
                                vertical: 9.sp,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xff000000),
                                borderRadius: BorderRadius.circular(30.sp),
                              ),
                              child: MyText(
                                weight: FontWeight.w300,
                                spacing: .99,
                                textScale: ResponsiveLayoutScreen.isDesktop(
                                        context)
                                    ? 2.5.sp
                                    : ResponsiveLayoutScreen.isTablet(context)
                                        ? 3.9.sp
                                        : 4.75.sp,
                                text: type == "Service Providers"
                                    ? "Service Seekers"
                                    : "Service Providers",
                                family: "Satoshi",
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: context.height * .65.sp,
              ),
              MyText(
                text: "Description",
                textScale: ResponsiveLayoutScreen.isDesktop(context)
                    ? 3.sp
                    : ResponsiveLayoutScreen.isTablet(context)
                        ? 4.5.sp
                        : 5.25.sp,
                weight: FontWeight.w500,
              ),
              SizedBox(
                height: ResponsiveLayoutScreen.isDesktop(context)
                    ? context.height * .2.sp
                    : context.height * .55.sp,
              ),
              Text(
                data['desc'],
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                textScaler: TextScaler.linear(
                  ResponsiveLayoutScreen.isDesktop(context)
                      ? 3.15.sp
                      : ResponsiveLayoutScreen.isTablet(context)
                          ? 3.7.sp
                          : 3.9.sp,
                ),
                style: TextStyle(color: Color(0xff848484)),
              ),
              SizedBox(
                height: ResponsiveLayoutScreen.isDesktop(context)
                    ? context.height * .5.sp
                    : context.height * .75.sp,
              ),
              MyText(
                text: "Service Time",
                weight: FontWeight.w500,
                textScale: ResponsiveLayoutScreen.isDesktop(context)
                    ? 3.sp
                    : ResponsiveLayoutScreen.isTablet(context)
                        ? 4.5.sp
                        : 5.25.sp,
              ),
              SizedBox(
                height: context.height * .2.sp,
              ),
              Container(
                decoration: BoxDecoration(color: Color(0xffF7F7F7)),
                child: MyText(
                  text: data['time'],
                  textScale: ResponsiveLayoutScreen.isDesktop(context)
                      ? 2.75.sp
                      : ResponsiveLayoutScreen.isTablet(context)
                          ? 3.8.sp
                          : 4.5.sp,
                  color: Color(0xff000000).withOpacity(0.5),
                ).paddingSymmetric(horizontal: 15.sp, vertical: 8.sp),
              ),
              SizedBox(
                height: ResponsiveLayoutScreen.isDesktop(context)
                    ? context.height * .5.sp
                    : context.height * .75.sp,
              ),
              if (type == "Service Seekers")
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: "Budget",
                      weight: FontWeight.w500,
                      textScale: ResponsiveLayoutScreen.isDesktop(context)
                          ? 3.sp
                          : ResponsiveLayoutScreen.isTablet(context)
                              ? 4.5.sp
                              : 5.25.sp,
                    ),
                    SizedBox(
                      height: context.height * .2.sp,
                    ),
                    MyText(
                      text: data['budget'],
                      family: "Satoshi",
                      textScale: ResponsiveLayoutScreen.isDesktop(context)
                          ? 3.sp
                          : ResponsiveLayoutScreen.isTablet(context)
                              ? 3.8.sp
                              : 4.5.sp,
                      color: Color(0xff000000).withOpacity(0.5),
                    ),
                  ],
                ),
              if (type == "Service Providers")
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              text: "Budget",
                              weight: FontWeight.w500,
                              textScale:
                                  ResponsiveLayoutScreen.isDesktop(context)
                                      ? 3.sp
                                      : ResponsiveLayoutScreen.isTablet(context)
                                          ? 4.5.sp
                                          : 5.25.sp,
                            ),
                            SizedBox(
                              height: context.height * .2.sp,
                            ),
                            MyText(
                              text: data['budget'],
                              family: "Satoshi",
                              textScale:
                                  ResponsiveLayoutScreen.isDesktop(context)
                                      ? 3.sp
                                      : ResponsiveLayoutScreen.isTablet(context)
                                          ? 3.8.sp
                                          : 4.5.sp,
                              color: Color(0xff000000).withOpacity(0.5),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: context.height * .5.sp,
                        ),
                        MyText(
                          text: "Category",
                          weight: FontWeight.w500,
                          textScale: ResponsiveLayoutScreen.isDesktop(context)
                              ? 3.sp
                              : ResponsiveLayoutScreen.isTablet(context)
                                  ? 4.5.sp
                                  : 5.25.sp,
                        ),
                        SizedBox(
                          height: context.height * .2.sp,
                        ),
                        Container(
                          decoration: BoxDecoration(color: Color(0xffF7F7F7)),
                          child: MyText(
                            text: data['prof'],
                            textScale: ResponsiveLayoutScreen.isDesktop(context)
                                ? 2.75.sp
                                : ResponsiveLayoutScreen.isTablet(context)
                                    ? 3.8.sp
                                    : 4.5.sp,
                            color: Color(0xff000000).withOpacity(0.5),
                          ).paddingSymmetric(horizontal: 15.sp, vertical: 8.sp),
                        ),
                        SizedBox(
                          height: context.height * .5.sp,
                        ),
                      ],
                    ),
                    if (ResponsiveLayoutScreen.isDesktop(context))
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: "Service Images",
                            weight: FontWeight.w500,
                            textScale: ResponsiveLayoutScreen.isDesktop(context)
                                ? 3.sp
                                : ResponsiveLayoutScreen.isTablet(context)
                                    ? 4.5.sp
                                    : 5.25.sp,
                          ).paddingSymmetric(horizontal: 5.sp),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                              3,
                              (index) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(14.sp),
                                  child: Image.network(
                                    data['image'] + "?random=${index * 6}",
                                    height: context.height * 1.25.sp,
                                  ),
                                ).paddingAll(10.sp);
                              },
                            ),
                          ).paddingOnly(right: context.width * 1.25.sp),
                        ],
                      ),
                  ],
                ),
              if (type == "Service Providers")
                if (!ResponsiveLayoutScreen.isDesktop(context))
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: ResponsiveLayoutScreen.isDesktop(context)
                            ? context.height * .5.sp
                            : context.height * .75.sp,
                      ),
                      MyText(
                        text: "Service Images",
                        weight: FontWeight.w500,
                        textScale: ResponsiveLayoutScreen.isDesktop(context)
                            ? 3.sp
                            : ResponsiveLayoutScreen.isTablet(context)
                                ? 4.5.sp
                                : 5.25.sp,
                      ).paddingSymmetric(horizontal: 12.sp),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          3,
                          (index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(14.sp),
                              child: Image.network(
                                data['image'] + "?random=${index * 6}",
                                height: context.height * 1.25.sp,
                              ),
                            ).paddingAll(10.sp);
                          },
                        ),
                      ).paddingOnly(right: context.width * 1.25.sp),
                    ],
                  ),
              if (type == "Service Providers")
                SizedBox(
                  height: context.height * .5.sp,
                ),
              if (type == "Service Providers")
                MyText(
                  text: "Reviews (520)",
                  weight: FontWeight.w600,
                  family: "Satoshi",
                  textScale: ResponsiveLayoutScreen.isDesktop(context)
                      ? 4.sp
                      : ResponsiveLayoutScreen.isTablet(context)
                          ? 4.5.sp
                          : 6.sp,
                ),
              SizedBox(
                height: context.height * .5.sp,
              ),
              if (type == "Service Providers")
                Row(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: ResponsiveLayoutScreen.isDesktop(
                                          context) ||
                                      ResponsiveLayoutScreen.isTablet(context)
                                  ? context.height * .6.sp
                                  : context.height * .75.sp,
                              backgroundColor: Color(0xff555555),
                              child: MyText(
                                text: "4.8",
                                weight: FontWeight.w400,
                                textScale: ResponsiveLayoutScreen.isDesktop(
                                        context)
                                    ? 3.25.sp
                                    : ResponsiveLayoutScreen.isTablet(context)
                                        ? 3.8.sp
                                        : 5.sp,
                                color: Color(0xffFFFFFF),
                              ),
                            ).paddingOnly(
                                bottom:
                                    ResponsiveLayoutScreen.isDesktop(context)
                                        ? context.height * .5.sp
                                        : context.height * .65.sp),
                            MyText(
                              text: "520 reviews",
                              textScale:
                                  ResponsiveLayoutScreen.isDesktop(context)
                                      ? 3.sp
                                      : ResponsiveLayoutScreen.isTablet(context)
                                          ? 3.8.sp
                                          : 5.sp,
                            ).paddingAll(4.sp),
                            RatingBarIndicator(
                              itemBuilder: (_, index) {
                                return Icon(
                                  Icons.star_rounded,
                                  color: Color(0xffFFC107),
                                );
                              },
                              itemCount: 5,
                              rating: 5,
                              itemSize:
                                  ResponsiveLayoutScreen.isDesktop(context)
                                      ? context.height * .525.sp
                                      : ResponsiveLayoutScreen.isTablet(context)
                                          ? context.height * .65.sp
                                          : context.height * .7.sp,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: ResponsiveLayoutScreen.isDesktop(context)
                              ? context.width * 1.75.sp
                              : ResponsiveLayoutScreen.isTablet(context)
                                  ? context.width * 2.5.sp
                                  : context.width * 3.35.sp,
                          child: Column(
                            children: List.generate(
                              5,
                              (index) {
                                var ratings = [
                                  "Excellent",
                                  "Very Good",
                                  "Good",
                                  "Poor",
                                  "Bad",
                                ];
                                var values = [0.7, .999, .675, .55, .4, .275];
                                var points = [105, 175, 127, 125, 110, 98];
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    MyText(
                                      text: ratings[index],
                                      color: Color(0xffA6A3B8),
                                      family: "Satoshi",
                                      textScale:
                                          ResponsiveLayoutScreen.isDesktop(
                                                  context)
                                              ? 2.65.sp
                                              : ResponsiveLayoutScreen.isTablet(
                                                      context)
                                                  ? 4.25.sp
                                                  : 5.25.sp,
                                      weight: FontWeight.w400,
                                    ),
                                    SizedBox(width: 10),
                                    SizedBox(
                                      width: ResponsiveLayoutScreen.isDesktop(
                                              context)
                                          ? context.width * 1.25.sp
                                          : ResponsiveLayoutScreen.isTablet(
                                                  context)
                                              ? context.width * 1.6.sp
                                              : context.width * 2.15.sp,
                                      child: LinearProgressIndicator(
                                        color: Color(0xffFFC107),
                                        value: values[index],
                                        backgroundColor: Color(0xffECECEC),
                                        minHeight: 9.sp,
                                        borderRadius:
                                            BorderRadius.circular(12.sp),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    MyText(
                                      text: points[index].toString(),
                                      textScale:
                                          ResponsiveLayoutScreen.isDesktop(
                                                  context)
                                              ? 2.65.sp
                                              : ResponsiveLayoutScreen.isTablet(
                                                      context)
                                                  ? 4.25.sp
                                                  : 5.25.sp,
                                      color: Color(0xffA6A3B8),
                                    ),
                                  ],
                                ).paddingSymmetric(
                                  vertical: context.height * .2.sp,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              if (type == "Service Providers")
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: profs.length,
                  itemBuilder: (_, index) {
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10.sp),
                        child: Image.network(
                            data['image'] + "?random=${index + 5}"),
                      ),
                      titleAlignment: ListTileTitleAlignment.top,
                      title: Text.rich(
                        textScaler: TextScaler.linear(
                          ResponsiveLayoutScreen.isDesktop(context)
                              ? 3.25.sp
                              : ResponsiveLayoutScreen.isTablet(context)
                                  ? 3.5.sp
                                  : 4.sp,
                        ),
                        TextSpan(
                          children: [
                            TextSpan(
                              text: names[index],
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: "Mont",
                              ),
                            ),
                            TextSpan(
                              text: profs[index],
                              style: TextStyle(
                                fontFamily: "Mont",
                              ),
                            ),
                          ],
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: context.height * .3.sp,
                          ),
                          RatingBarIndicator(
                            rating: 4,
                            itemBuilder: (context, index) => Icon(
                              Icons.star_rounded,
                              color: Color(0xffFFBD1F),
                            ),
                            itemCount: 5,
                            itemSize: ResponsiveLayoutScreen.isDesktop(context)
                                ? context.height * .45.sp
                                : context.height * .65.sp,
                            direction: Axis.horizontal,
                          ),
                          SizedBox(
                            height: context.height * .3.sp,
                          ),
                          MyText(
                            text:
                                "Far far away, behind the word mountains, \nfar from the countries Vokalia and \nConsonant, there live the blind texts",
                            color: Color(0xff3B3B3B),
                            weight: FontWeight.w300,
                            textScale: ResponsiveLayoutScreen.isDesktop(context)
                                ? 3.2.sp
                                : ResponsiveLayoutScreen.isTablet(context)
                                    ? 4.5.sp
                                    : 5.sp,
                            family: "Mont",
                          )
                        ],
                      ),
                    ).paddingSymmetric(vertical: context.height * .5.sp);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
