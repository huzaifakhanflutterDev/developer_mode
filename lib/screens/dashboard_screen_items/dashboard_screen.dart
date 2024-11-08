import 'package:developer_mode/controller/side_bar_controller.dart';
import 'package:developer_mode/responsiveness/responsive_layout_screen.dart';
import 'package:developer_mode/screens/sidebar_menu_layout.dart';
import 'package:developer_mode/utils/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SideBarController());
    return Scaffold(
      endDrawer: !ResponsiveLayoutScreen.isDesktop(context) ? SidebarMenuLayout() : null,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Color(0xffFFFFFF),
        surfaceTintColor: Color(0xffFFFFFF),
        elevation: 20,
        leadingWidth: context.width * 1.25.sp,
        shadowColor: Color(0xff000000).withOpacity(0.25),
        leading: ResponsiveLayoutScreen.isDesktop(context)
            ? SvgPicture.asset(
                "assets/svgs/logo.svg",
              )
            : null,
        title: MyText(
          text: "Welcome Admin",
          textScale: ResponsiveLayoutScreen.isDesktop(context) ? 1.7 : 2,
          weight: FontWeight.w500,
        ).paddingOnly(right: context.width * .75.sp),
      ),
      body: Row(
        children: [
          if (context.width >= 1000)
            Expanded(
              child: SidebarMenuLayout(),
            ),
          Expanded(
            flex: 6,
            child: Obx(
              () {
                return Center(
                  child:
                      controller.sideBarScreens[controller.selectedIndex.value],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
