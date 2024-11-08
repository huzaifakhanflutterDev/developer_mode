import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/my_text.dart';
import '../service_seekers/profile_details_screen_tabs.dart';

class UserItemDesktopLayout extends StatelessWidget {
  Map<String, dynamic> data;

  String type;
  int index;

  UserItemDesktopLayout({
    required this.index,
    required this.type,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
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
              Image.network(
                data['image'] + "?random=$index",
                height: context.height * 1.15.sp,
              ),
              // SizedBox(
              //   height: context.height * .35.sp,
              // ),
              Spacer(),
              MyText(
                text: data['name'],
                weight: FontWeight.w700,
                textScale: 1,
                color: Color(0xff000041),
              ),
              // SizedBox(
              //   height: context.height * .15.sp,
              // ),
              Spacer(),
              MyText(
                text: data['address'],
                weight: FontWeight.w400,
                textScale: 0.825,
                color: Color(0xff717579),
              ),
              MyText(
                text: type,
                weight: FontWeight.w600,
                textScale: 0.75,
                color: Color(0xff1B8271),
              ),
              // SizedBox(
              //   height: context.height * .4.sp,
              // ),
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
                        duration: Duration(milliseconds: 600),
                        decoration: BoxDecoration(
                          color: Color(0xff48B16A).withOpacity(0.1),
                        ),
                        child: SvgPicture.asset(
                          data["emailImg"],
                        ),
                      ),
                      SizedBox(
                        width: context.width * .2.sp,
                      ),
                      Text(
                        data["email"],
                        textScaler: TextScaler.linear(
                          0.7,
                        ),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
