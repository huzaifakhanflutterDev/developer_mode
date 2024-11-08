import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/my_elevated_button.dart';
import '../../../utils/my_text.dart';
import '../edit_screen_layout/edit_area_layout.dart';
import '../layout_responsive_item/add_new_area_layout.dart';

class AreaTabletItem extends StatelessWidget {
  const AreaTabletItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 15.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: context.width * 2.sp,
              child: ElevatedBtn(
                radius: 7.sp,
                color: Color(0xff1B8271),
                onPressed: () {
                  Get.to(() => AddNewAreaLayout());
                },
                text: MyText(
                  text: "Add new area",
                  textScale: 4.5.sp,
                  color: Color(0xffFFFFFF),
                ),
              ),
            ),
          ),
          SizedBox(height: context.height * .85.sp),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 6,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: context.height * .65.sp,
              crossAxisSpacing: context.width * .75.sp,
              childAspectRatio: 9.sp,
            ),
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
          SizedBox(
            width: context.width * .2.sp,
            height: context.height * 1.25.sp,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.sp),
            child: Badge(
              padding: EdgeInsets.all(7.sp),
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
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: IntrinsicWidth(
                  stepWidth: context.width * 2.25.sp,
                  child: Image.network(
                    "https://picsum.photos/200/300?random=$index",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width * .4.sp),
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
                        textScale: 4.5.sp,
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
                    textScale: 4.75.sp,
                    color: Color(0xff1B8271),
                  ),
                  MyText(
                    text: r"$5",
                    weight: FontWeight.w400,
                    textScale: 4.75.sp,
                    color: Color(0xff000000).withOpacity(0.3),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(
                          context.width * 1.75.sp,
                          context.height * .85.sp,
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
                        textScale: 4.5.sp,
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
