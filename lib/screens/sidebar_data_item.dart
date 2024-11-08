import 'package:developer_mode/controller/side_bar_controller.dart';
import 'package:developer_mode/responsiveness/responsive_layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SidebarDataItem extends StatelessWidget {
  Map<String, dynamic> data;
  int index;

  SidebarDataItem({required this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<SideBarController>();
    return Obx(
      () {
        var item = controller.selectedIndex.value;
        return AnimatedContainer(duration: Duration(milliseconds: 500),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.zero,
            color: item == index
                ? Color(0xff1B8271).withOpacity(0.1)
                : Color(0xffFFFFFF),
            border: item == index
                ? Border(
                    left: BorderSide(color: Color(0xff1B8271), width: 6.sp))
                : Border.all(color: Colors.transparent),
          ),
          child: ListTile(
            selectedColor: item == index
                ? Color(0xff1B8271).withOpacity(0.1)
                : Color(0xffFFFFFF),
            leading: SvgPicture.asset(
              data['img'],
              color: item == index ? Color(0xff1B8271) : Color(0xff898989),
            ),
            title: Text(
              data['name'],
              overflow: TextOverflow.ellipsis,
              textScaleFactor: 0.8,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: item == index
                    ? Color(0xff1B8271)
                    : Color(0xff202020).withOpacity(0.4),
              ),
            ),
            onTap: () {
              controller.selectedIndex.value = index;
              !ResponsiveLayoutScreen.isDesktop(context)
                  ? Navigator.pop(context)
                  : null;
            },
            selected: item == index,
          ),
        );
      },
    );
  }
}

List<Map<String, dynamic>> dataList = [
  {
    "img": "assets/svgs/users.svg",
    "name": "Users",
  },
  {
    "img": "assets/svgs/area.svg",
    "name": "Area Details",
  },
  {
    "img": "assets/svgs/id.svg",
    "name": "ID Verification",
  },
  {
    "img": "assets/svgs/categories.svg",
    "name": "Categories",
  },
  {
    "img": "assets/svgs/block.svg",
    "name": "Block Users",
  },
];
