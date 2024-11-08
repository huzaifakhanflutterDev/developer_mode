import 'package:developer_mode/dashboard_layouts/users_layouts/user_items/user_item.dart';
import 'package:developer_mode/utils/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class BlockScreenMobItem extends StatelessWidget {
  Rx<String> selectedOption;

  BlockScreenMobItem({required this.selectedOption});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.width * .75.sp,
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
                      textScale: 5.5.sp,
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
                    width: 52.sp,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      minVerticalPadding: 7,
                      minTileHeight: 0.sp,
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
                          textScale: 4.75.sp,
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
                  constraints: BoxConstraints(
                    maxWidth: context.width * 5.sp,
                    minWidth: context.width * 2.675.sp,
                  ),
                  padding: EdgeInsets.zero,
                  menuPadding: EdgeInsets.symmetric(vertical: 0.sp),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      padding: EdgeInsets.zero,
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 10.sp,
                        ),
                        title: MyText(
                          text: "Service Providers",
                          textScale: 4.75.sp,
                          color: Color(0xff1D1B20).withOpacity(0.6),
                        ),
                        onTap: null,
                      ),
                      value: "Service Providers",
                    ),
                    PopupMenuItem(
                      padding: EdgeInsets.zero,
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 10.sp,
                        ),
                        title: MyText(
                          text: "Service Seekers",
                          textScale: 4.75.sp,
                          color: Color(0xff1D1B20).withOpacity(0.6),
                        ),
                        onTap: null,
                      ),
                      value: "Service Seekers",
                    ),
                  ],
                ),
              ],
            ).paddingSymmetric(horizontal: 12.sp),
            SizedBox(
              height: context.height * .75.sp,
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
                  crossAxisCount: 2,
                  childAspectRatio: 4.25.sp,
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
