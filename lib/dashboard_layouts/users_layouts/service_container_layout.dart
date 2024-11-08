import 'package:developer_mode/responsiveness/responsive_layout_screen.dart';
import 'package:developer_mode/utils/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ServiceContainerLayout extends StatelessWidget {
  Map<String, dynamic> data;
  String value;
  String groupValue;
  Function(String) onChange;

  ServiceContainerLayout({
    required this.data,
    required this.value,
    required this.groupValue,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    var selected = value == groupValue;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          onChange(value);
        },
        child: AnimatedContainer(
          margin: EdgeInsets.all(context.height * .425.sp),
          padding: EdgeInsets.all(
            ResponsiveLayoutScreen.isDesktop(context)
                ? context.height * .35.sp
                : ResponsiveLayoutScreen.isTablet(context)
                    ? context.height * .4.sp
                    : context.height * .45.sp,
          ),
          decoration: BoxDecoration(
            color: selected ? Color(0xff1B8271) : Color(0xffFFFFFF),
            borderRadius: BorderRadius.circular(6.sp),
            boxShadow: [
              if (!selected)
                BoxShadow(
                  color: Color(0xff000000).withOpacity(0.1),
                  blurRadius: 4,
                  spreadRadius: 1,
                ),
            ],
          ),
          duration: Duration(milliseconds: 300),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MyText(
                    text: data['name'],
                    weight: FontWeight.w600,
                    family: "Satoshi",
                    textScale:
                        ResponsiveLayoutScreen.isDesktop(context) ? 1 : 1.25,
                    color: selected ? Color(0xffFFFFFF) : Color(0xff000000),
                  ),
                  SizedBox(
                    width: ResponsiveLayoutScreen.isDesktop(context)
                        ? context.width * .95.sp
                        : context.width * 1.35.sp,
                  ),
                  SvgPicture.asset(
                    !selected ? data['img'] : "assets/svgs/emoji.svg",
                    height: ResponsiveLayoutScreen.isTablet(context)
                        ? 20.sp
                        : 20.sp,
                  ),
                ],
              ),
              SizedBox(
                height: !ResponsiveLayoutScreen.isMobile(context)
                    ? context.height * .95.sp
                    : context.height * .75.sp,
              ),
              MyText(
                text: data['active'],
                weight: !ResponsiveLayoutScreen.isMobile(context)
                    ? FontWeight.w400
                    : FontWeight.w300,
                family: "Satoshi",
                textScale:
                    ResponsiveLayoutScreen.isDesktop(context) ? 0.8 : 1.2,
                color: selected ? Color(0xffFFFFFF) : Color(0xff000000),
              ),
              SizedBox(
                height: context.height * .3.sp,
              ),
              MyText(
                text: data['no'],
                family: "Satoshi",
                weight: !ResponsiveLayoutScreen.isMobile(context)
                    ? FontWeight.w400
                    : FontWeight.w300,
                textScale:
                    ResponsiveLayoutScreen.isDesktop(context) ? 0.8 : 1.2,
                color: selected ? Color(0xffFFFFFF) : Color(0xff000000),
              ),
              SizedBox(
                height: context.height * .8.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> serviceList = [
  {
    "name": "Service Seekers",
    "img": "assets/svgs/emoji_2.svg",
    "active": "Active Service Seekers",
    "no": "705",
  },
  {
    "name": "Service Providers",
    "img": "assets/svgs/emoji_2.svg",
    "active": "Active Service Providers",
    "no": "705",
  },
];
