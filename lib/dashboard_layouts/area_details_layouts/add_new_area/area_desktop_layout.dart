import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/my_elevated_button.dart';
import '../../../utils/my_text.dart';
import '../edit_screen_layout/edit_area_layout.dart';
import '../layout_responsive_item/add_new_area_layout.dart';

class AreaDesktopLayout extends StatelessWidget {
  const AreaDesktopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: context.width * 1.25.sp,
              child: ElevatedBtn(
                radius: 7.sp,
                color: Color(0xff1B8271),
                onPressed: () {
                  Get.to(() => AddNewAreaLayout());
                },
                text: MyText(
                  text: "Add new area",
                  textScale: 3.25.sp,
                  color: Color(0xffFFFFFF),
                ),
              ),
            ),
          ),
          SizedBox(height: context.height * .8.sp),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 6,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: context.height * .375.sp,
                crossAxisSpacing: context.width * .5.sp,
                childAspectRatio: 6.85.sp),
            itemBuilder: (context, index) {
              return _buildAreaDetails(context, index);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAreaDetails(BuildContext context, int index) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.sp),
      width: context.width * 2.sp,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        boxShadow: [
          BoxShadow(
            color: Color(0xff000000).withOpacity(0.1),
            blurRadius: 15,
            spreadRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Badge(
            padding: EdgeInsets.zero,
            alignment: Alignment.topLeft,
            isLabelVisible: true,
            backgroundColor: Color(0xff1B8271),
            label: Container(
              height: context.height * .6.sp,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                "assets/svgs/map-pin.svg",
                color: Color(0xffffffff),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Image.network(
                "https://picsum.photos/200" + "?random=$index",
                height: context.height * 1.1.sp,
                width: context.width * 1.1.sp,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width * .3.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      MyText(
                        text: "Toronto City",
                        textScale: 3.sp,
                        weight: FontWeight.w500,
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => showDeleteConfirmationDialog(context),
                          child: SvgPicture.asset(
                            "assets/svgs/delete.svg",
                          ),
                        ),
                      ),
                    ],
                  ),
                  MyText(
                    text: "Orange money",
                    weight: FontWeight.w400,
                    textScale: 2.75.sp,
                    color: Color(0xff1B8271),
                  ),
                  MyText(
                    text: r"$5",
                    weight: FontWeight.w400,
                    textScale: 2.75.sp,
                    color: Color(0xff000000).withOpacity(0.3),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(
                          context.width * .8.sp,
                          context.height * .6.sp,
                        ),
                        padding: EdgeInsets.zero,
                        backgroundColor: Color(0xff000000),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            context.height * .15.sp,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Get.to(EditAreaLayout());
                      },
                      child: MyText(
                        text: "Edit",
                        textScale: 2.7.sp,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //des
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
      padding: EdgeInsets.all(10.sp),
      // height: context.height * .15.sp,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xffDC2727).withOpacity(0.3),
      ),
      child: Center(
        child: Icon(
          Icons.cancel_outlined,
          color: Color(0xffDC2727),
          size: 15.sp,
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
            textScale: 3.5.sp,
            family: "Jakarta",
          ).paddingOnly(top: context.height * .5.sp),
          MyText(
            text: 'Do you want to delete Selected \nitem?',
            textScale: 3.sp,
            color: const Color(0xff8F8F8F),
            family: "Jakarta",
            align: TextAlign.center,
            weight: FontWeight.w400,
          ).paddingOnly(
            bottom: context.height * .5.sp,
            top: context.height * .25.sp,
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
              textScaler: TextScaler.linear(3.sp),
              style: TextStyle(
                  fontFamily: "Jakarta",
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ).paddingSymmetric(vertical: 10.sp),
          ),
          SizedBox(width: 12.sp),
          ElevatedButton(
            style: dialogButtonStyle(const Color(0xffFFFFFF), border: true),
            onPressed: () => Get.back(),
            child: Text(
              'Cancel',
              textScaler: TextScaler.linear(3.sp),
              style: TextStyle(
                fontFamily: "Jakarta",
                color: Color(0xff8F8F8F),
              ),
            ).paddingSymmetric(vertical: 10.sp),
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
