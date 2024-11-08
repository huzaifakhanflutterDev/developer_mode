import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/my_text.dart';
import '../service_seekers/profile_details_screen_tabs.dart';

class UserItemTabLayout extends StatelessWidget {
  Map<String, dynamic> data;

  String type;
  int index;

  UserItemTabLayout({
    required this.index,
    required this.type,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Get.to(
            () => ProfileDetailsScreen(
              data: data,
              type: type,
            ),
          );
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width: context.width * 1.25.sp,
          margin: EdgeInsets.all(context.height * .425.sp),
          padding: EdgeInsets.all(context.height * .5.sp),
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.circular(12.sp),
            border: Border.all(
              color: Color(0xff000000).withOpacity(0.1),
            ),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: Image.network(
                  data['image'] + "?random=$index",
                  height: context.height * 1.4.sp,
                ),
              ),
              Spacer(),
              MyText(
                text: data['name'],
                weight: FontWeight.bold,
                textScale: 5.sp,
                color: Color(0xff000041),
              ),
              Spacer(),
              MyText(
                text: data['address'],
                weight: FontWeight.w400,
                textScale: 4.5.sp,
                color: Color(0xff717579),
              ),
              MyText(
                text: type,
                weight: FontWeight.w600,
                textScale: 4.25.sp,
                color: Color(0xff1B8271),
              ),
              Spacer(),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedContainer(
                        padding: EdgeInsets.all(5.sp),
                        duration: Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          color: Color(0xff48B16A).withOpacity(0.1),
                        ),
                        child: SvgPicture.asset(
                          data["emailImg"],
                          height: context.height * .6.sp,
                        ),
                      ),
                      SizedBox(
                        width: context.width * .4.sp,
                      ),
                      Text(
                        data["email"],
                        textScaler: TextScaler.linear(
                          3.85.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "Dmsans",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
