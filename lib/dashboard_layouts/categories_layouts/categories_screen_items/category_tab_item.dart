import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/my_elevated_button.dart';
import '../../../utils/my_text.dart';
import '../add_new_category_layout_item/add_new_category_layout.dart';

class CategoryTabItem extends StatelessWidget {
  List<String> names;

  CategoryTabItem({required this.names});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(
              text: "All Categories",
              weight: FontWeight.w500,
              textScale: 5.sp,
            ),
            SizedBox(
              width: context.width * 2.sp,
              child: ElevatedBtn(
                radius: 8.sp,
                color: Color(0xff1B8271),
                onPressed: () {
                  Get.to(
                    () => AddNewCategoryLayout(
                      name: "Add new Categories",
                      option: 'Add Options',
                      title: "Add options & choose right option",
                    ),
                  );
                },
                text: MyText(
                  text: "Add new category",
                  weight: FontWeight.w400,
                  textScale: 4.sp,
                  color: Color(0xffFFFFFF),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: context.height * .8.sp),
        ListView.separated(
          itemCount: names.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return _buildCategoryData(context, index, names[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(height: context.height * 1.sp);
          },
        ),
      ],
    );
  }

  Widget _buildCategoryData(BuildContext context, int index, String names) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyText(
          text: names,
          weight: FontWeight.w400,
          textScale: 4.5.sp,
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(6.sp),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff1B8271),
              ),
              child: Icon(
                Icons.done,
                size: 14.sp,
                color: Color(0xffFFFFFF),
              ),
            ),
            SizedBox(width: context.width * .75.sp),
            SizedBox(
              width: context.width * 1.45.sp,
              height: 25,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: Color(0xff000000),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      context.height * .3.sp,
                    ),
                  ),
                ),
                onPressed: () {
                  Get.to(
                    () => AddNewCategoryLayout(
                      name: 'Edit Categories',
                      option: "Options",
                      title: "Edit options & choose right option",
                    ),
                  );
                },
                icon: Icon(
                  Icons.edit_outlined,
                  color: Color(0xffFFFFFF),
                  size: 15.sp,
                ),
                label: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: context.width * .2.sp),
                  child: MyText(
                    text: "Edit",
                    textScale: 4.5.sp,
                    weight: FontWeight.w400,
                    color: Color(0xffFFFFFF),
                  ),
                ),
              ),
            ),
            SizedBox(width: context.width * .75.sp),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => showDeleteConfirmationDialog(context),
                child: Container(
                  padding: EdgeInsets.all(10.sp),
                  height: 35,
                  width: 32,
                  decoration: BoxDecoration(
                    color: Color(0xffFF2828).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.sp),
                  ),
                  child: SvgPicture.asset(
                    "assets/svgs/delete.svg",
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

//tab
  void showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 4.sp),
          backgroundColor: const Color(0xffFFFFFF),
          title: buildDialogTitle(context),
          content: buildDialogContent(context),
          actions: buildDialogActions(context),
        );
      },
    );
  }

  Widget buildDialogTitle(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.sp),
      // height: context.height * .15.sp,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xffDC2727).withOpacity(0.3),
      ),
      child: Center(
        child: Icon(
          Icons.cancel_outlined,
          color: Color(0xffDC2727),
          size: 18.sp,
        ),
      ),
    );
  }

  Widget buildDialogContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyText(
            text: "Are you sure?",
            weight: FontWeight.w600,
            textScale: 5.25.sp,
            family: "Jakarta",
          ).paddingOnly(top: context.height * .5.sp),
          MyText(
            text: 'Do you want to delete Selected \nitem?',
            textScale: 4.25.sp,
            color: const Color(0xff8F8F8F),
            family: "Jakarta",
            align: TextAlign.center,
            weight: FontWeight.w400,
          ).paddingOnly(
            bottom: context.height * .65.sp,
            top: context.height * .35.sp,
          ),
        ],
      ),
    );
  }

  List<Widget> buildDialogActions(BuildContext context) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: dialogButtonStyle(
              const Color(0xffE84343),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'I’m sure',
              textScaler: TextScaler.linear(3.75.sp),
              style: TextStyle(
                  fontFamily: "Jakarta",
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ).paddingSymmetric(vertical: 9.sp),
          ),
          SizedBox(width: 12.sp),
          ElevatedButton(
            style: dialogButtonStyle(const Color(0xffFFFFFF), border: true),
            onPressed: () => Get.back(),
            child: Text(
              'Cancel',
              textScaler: TextScaler.linear(4.sp),
              style: TextStyle(
                fontFamily: "Jakarta",
                color: Color(0xff8F8F8F),
              ),
            ).paddingSymmetric(vertical: 8.sp),
          ),
        ],
      ),
    ];
  }

  ButtonStyle dialogButtonStyle(Color color, {bool border = false}) {
    return ButtonStyle(
      minimumSize: WidgetStateProperty.all(
        Size(Get.width * .195.sp, Get.height * .034.sp),
      ),
      elevation: WidgetStatePropertyAll(0),
      backgroundColor: WidgetStateProperty.all(color),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28.9),
          side: border
              ? BorderSide(color: const Color(0xff7A7A7A).withOpacity(0.45))
              : BorderSide.none,
        ),
      ),
    );
  }
}
