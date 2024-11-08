import 'package:developer_mode/dashboard_layouts/categories_layouts/categories_screen_items/category_desktop_item.dart';
import 'package:developer_mode/dashboard_layouts/categories_layouts/categories_screen_items/category_mob_item.dart';
import 'package:developer_mode/dashboard_layouts/categories_layouts/categories_screen_items/category_tab_item.dart';
import 'package:developer_mode/responsiveness/responsive_layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AllCategoriesLayout extends StatelessWidget {
  const AllCategoriesLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var names = [
      "UIUX",
      "Video Editing",
      "Graphic Designing",
      "Flutter Development",
      "Cyber Security",
      "Data Science",
      "Hacking",
      "Software Engineering",
      "Game Development"
    ];
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveLayoutScreen.isDesktop(context)
              ? context.width * .5.sp
              : ResponsiveLayoutScreen.isTablet(context)
                  ? context.width * .75.sp
                  : context.width * .95.sp,
          vertical: context.height * .75.sp,
        ),
        child: ResponsiveLayoutScreen(
          mobile: CategoryMobItem(names: names),
          tablet: CategoryTabItem(names: names),
          desktop: CategoryDesktopItem(names: names),
        ),
      ),
    );
   }
}
