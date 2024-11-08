import 'package:developer_mode/responsiveness/responsive_layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'sidebar_data_item.dart';

class SidebarMenuLayout extends StatelessWidget {
  const SidebarMenuLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(duration: Duration(milliseconds: 100),
      width: !ResponsiveLayoutScreen.isDesktop(context) ? context.width * 3.75.sp : null,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        boxShadow: [
          BoxShadow(
            color: Color(0xff000000).withOpacity(0.075),
            blurRadius: 25,
            spreadRadius: 18,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: context.height * .65.sp,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: dataList.length,
            itemBuilder: (context, index) {
              return SidebarDataItem(
                data: dataList[index],
                index: index,
              );
            },
          ),
        ],
      ),
    );
  }
}
