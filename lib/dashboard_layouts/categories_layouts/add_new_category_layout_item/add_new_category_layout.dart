import 'package:developer_mode/controller/text_field_controller.dart';
import 'package:developer_mode/dashboard_layouts/categories_layouts/add_new_category_layout_item/add_new_category_desktop_item.dart';
import 'package:developer_mode/dashboard_layouts/categories_layouts/add_new_category_layout_item/add_new_category_mob_item.dart';
import 'package:developer_mode/dashboard_layouts/categories_layouts/add_new_category_layout_item/add_new_category_tab_item.dart';
import 'package:developer_mode/responsiveness/responsive_layout_screen.dart';
import 'package:developer_mode/utils/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddNewCategoryLayout extends StatelessWidget {
  String name, option, title;

  AddNewCategoryLayout({
    required this.title,
    required this.name,
    required this.option,
  });

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(MyTextFieldController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: !ResponsiveLayoutScreen.isDesktop(context)
            ? Color(0xffFFFFFF)
            : Color(0xff1B8271),
        surfaceTintColor: !ResponsiveLayoutScreen.isDesktop(context)
            ? Color(0xffFFFFFF)
            : Color(0xff1B8271),
        shadowColor: Color(0xff000000).withOpacity(0.4),
        elevation: !ResponsiveLayoutScreen.isDesktop(context) ? 10 : 0,
        title: MyText(
          text: "Welcome Admin",
          color: ResponsiveLayoutScreen.isDesktop(context)
              ? Color(0xffFFFFFF)
              : Color(0xff000000),
          weight: FontWeight.w500,
          textScale: ResponsiveLayoutScreen.isDesktop(context)
              ? 3.75.sp
              : ResponsiveLayoutScreen.isTablet(context)
                  ? 5.sp
                  : 5.5.sp,
          family: "Satoshi",
        ),
        automaticallyImplyLeading: false,
        centerTitle: false,
      ),
      body: ResponsiveLayoutScreen(
        mobile: AddNewCategoryMobItem(
          controller: controller,
          name: name,
          option: option,
          title: title,
        ),
        tablet: AddNewCategoryTabItem(
          controller: controller,
          name: name,
          option: option,
          title: title,
        ),
        desktop: AddNewCategoryDesktopItem(
          controller: controller,
          name: name,
          option: option,
          title: title,
        ),
      ),
    );
  }
}
