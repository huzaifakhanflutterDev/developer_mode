import 'package:developer_mode/dashboard_layouts/users_layouts/user_items/user_item.dart';
import 'package:developer_mode/utils/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class BlockScreenDesktopItem extends StatelessWidget {
  Rx<String> selectedOption;

  BlockScreenDesktopItem({required this.selectedOption});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.width * .4.sp,
          vertical: context.height * .75.sp,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () {
                    return MyText(
                      text: "All ${selectedOption.value}",
                      textScale: 1.5,
                    );
                  },
                ),
                PopupMenuButton(
                  position: PopupMenuPosition.under,
                  popUpAnimationStyle: AnimationStyle(
                    duration: Duration(milliseconds: 400),
                    curve: Curves.fastOutSlowIn,
                    reverseDuration: Duration(milliseconds: 200),
                  ),
                  child: Container(
                    width: 45.sp,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      minVerticalPadding: 7,
                      minTileHeight: 21.sp,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      tileColor: Color(0xff000000).withOpacity(0.1),
                      titleAlignment: ListTileTitleAlignment.center,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 0.sp, horizontal: 12.sp),
                      title: Obx(() {
                        return MyText(
                          text: selectedOption.value,
                          textScale: 2.95.sp,
                          weight: FontWeight.w500,
                          family: "Roboto",
                        );
                      }),
                      trailing: Icon(Icons.arrow_drop_down),
                      onTap: null,
                    ),
                  ),
                  color: Colors.white,
                  onSelected: (value) {
                    selectedOption.value = value;
                  },
                  initialValue: selectedOption.value,
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(
                    maxWidth: context.width * 1.5.sp,
                    minWidth: context.width * 1.19.sp,
                  ),
                  menuPadding: EdgeInsets.symmetric(vertical: 7.sp),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      padding: EdgeInsets.zero,
                      child: ListTile(
                        splashColor: Colors.white,
                        focusColor: Colors.white,
                        selectedColor: Colors.white,
                        mouseCursor: SystemMouseCursors.click,
                        autofocus: false,
                        selectedTileColor: Colors.transparent,
                        hoverColor: Color(0xffFFFFFF),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 10.sp,
                        ),
                        title: MyText(
                          text: "Service Seekers",
                          textScale: 2.95.sp,
                          color: Color(0xff1D1B20).withOpacity(0.6),
                        ),
                        onTap: null,
                      ),
                      value: "Service Seekers",
                    ),
                    PopupMenuItem(
                      padding: EdgeInsets.zero,
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 10.sp,
                        ),
                        title: MyText(
                          text: "Service Providers",
                          textScale: 2.95.sp,
                          color: Color(0xff1D1B20).withOpacity(0.6),
                        ),
                        onTap: null,
                      ),
                      value: "Service Providers",
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: context.height * .5.sp,
            ),
            SingleChildScrollView(
              scrollDirection:
                  context.width <= 290.0 ? Axis.horizontal : Axis.vertical,
              physics: context.width <= 290.0
                  ? BouncingScrollPhysics()
                  : NeverScrollableScrollPhysics(),
              child: GridView.builder(
                itemCount: itemsDataList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  childAspectRatio: context.width >= 1200
                      ? .712
                      : context.width >= 1100
                          ? .66
                          : context.width >= 1080
                              ? .68
                              : context.width >= 980
                                  ? .7
                                  : context.width >= 900
                                      ? .745
                                      : context.width >= 800
                                          ? .7
                                          : .64,
                ),
                itemBuilder: (context, index) {
                  return Obx(
                    () {
                      return UserItem(
                        type: selectedOption.value,
                        data: itemsDataList[index],
                        index: index,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
