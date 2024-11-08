import 'package:developer_mode/dashboard_layouts/users_layouts/user_items/user_item_desktop_layout.dart';
import 'package:developer_mode/dashboard_layouts/users_layouts/user_items/user_item_mob_layout.dart';
import 'package:developer_mode/dashboard_layouts/users_layouts/user_items/user_item_tab_layout.dart';
import 'package:developer_mode/responsiveness/responsive_layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserItem extends StatelessWidget {
  Map<String, dynamic> data;

  String type;
  int index;

  UserItem({
    required this.index,
    required this.type,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutScreen(
      mobile: UserItemMobLayout(
        data: data,
        index: index,
        type: type,
      ),
      tablet: UserItemTabLayout(
        data: data,
        index: index,
        type: type,
      ),
      desktop: UserItemDesktopLayout(
        index: index,
        type: type,
        data: data,
      ),
    );
  }
}

List<Map<String, dynamic>> itemsDataList = List.generate(
  ResponsiveLayoutScreen.isDesktop(Get.context!) ? 12 : 6,
  (index) {
    return {
      "image": "https://picsum.photos/250?men",
      "name": "Chyntia Smiley",
      "address": "Canada, Toronto",
      "emailImg": "assets/svgs/email_1.svg",
      "email": "angelamoss@mail.com",
      "desc":
          "of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions",
      "budget": r"$60/h - $70/h",
      "time": "Monday - Friday",
      "prof": "UIUX Designer",
    };
  },
);
