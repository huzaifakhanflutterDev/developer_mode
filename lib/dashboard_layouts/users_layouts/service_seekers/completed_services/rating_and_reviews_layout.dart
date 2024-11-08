import 'package:developer_mode/utils/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../../responsiveness/responsive_layout_screen.dart';

class RatingAndReviewsLayout extends StatelessWidget {
  const RatingAndReviewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imgs = ["assets/images/men.png", "assets/images/person.png"];
    var names = ["Muhammad Ali ", "Romanditta "];
    var profs = ["(Service Provider)", "(Service Seeker)"];
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: context.height * .5.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (ResponsiveLayoutScreen.isMobile(context))
              MyText(
                text:
                    "${DateFormat("MMM dd, yyyy").format(DateTime.now())}",
                textScale: 5.5.sp,
                weight: FontWeight.w400,
                color: Color(0xff848484),
              ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: imgs.length,
              itemBuilder: (_, index) {
                return ListTile(
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10.sp),
                      child: Image.asset(imgs[index])),
                  titleAlignment: ListTileTitleAlignment.top,
                  title: Text.rich(
                    textScaler: TextScaler.linear(
                        ResponsiveLayoutScreen.isDesktop(context)
                            ? 3.2.sp
                            : 4.2.sp),
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
                        itemSize: context.height * .525.sp,
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
                            : 4.35.sp,
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
    );
  }
}
