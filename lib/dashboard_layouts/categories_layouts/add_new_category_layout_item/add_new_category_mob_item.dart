import 'package:developer_mode/controller/text_field_controller.dart';
import 'package:developer_mode/dashboard_layouts/categories_layouts/add_options/add_options_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/my_elevated_button.dart';
import '../../../utils/my_text.dart';
import '../../../utils/my_text_field.dart';

class AddNewCategoryMobItem extends StatelessWidget {
  MyTextFieldController controller;
  String name, option, title;

  AddNewCategoryMobItem({
    required this.title,
    required this.controller,
    required this.name,
    required this.option,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(context.height * .5.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton.icon(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Color(0xff000000),
              ),
              label: MyText(
                text: name,
                weight: FontWeight.w700,
                textScale: 5.75.sp,
              ),
            ),
            SizedBox(
              height: context.height * .75.sp,
            ),
            MyText(
              text: "Category name :",
              textScale: 5.5.sp,
              color: Color(0xff000000).withOpacity(0.5),
            ),
            SizedBox(
              height: context.height * .25.sp,
            ),
            MyTextField(
              controller: TextEditingController(text: "UIUX"),
              hint: "",
              font: 15.sp,
            ),
            MyText(
              text: "Add test questions",
              weight: FontWeight.w500,
              textScale: 5.5.sp,
            ).paddingSymmetric(vertical: 12.sp),
            Obx(() {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: controller.fields.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  return Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: MyTextField(
                          controller: controller.fields[index],
                          hint: "What is stands for UIUX ?",
                          font: 15.sp,
                          suffix: index < controller.fields.length - 1
                              ? IconButton(
                                  onPressed: () {
                                    if (option != "Options")
                                      controller.removeField(index);
                                    if (option == "Options") {
                                      showDeleteConfirmationDialog(
                                          context, index);
                                    }
                                  },
                                  icon: SvgPicture.asset(
                                    "assets/svgs/delete.svg",
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : null,
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            Get.to(
                              () => AddOptionsLayout(title: title),
                            );
                          },
                          child: Text(
                            option,
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ).paddingSymmetric(vertical: context.height * .35.sp);
                },
              );
            }),
            TextButton(
              onPressed: controller.addFields,
              child: MyText(
                text: "Add new question",
                weight: FontWeight.w700,
                textScale: 5.75.sp,
              ),
            ).paddingSymmetric(vertical: 12.sp),
            SizedBox(
              width: context.width * 3.5.sp,
              child: ElevatedBtn(
                radius: 8.sp,
                color: Color(0xff1B8271),
                onPressed: () {},
                text: MyText(
                  text: "Add category",
                  weight: FontWeight.w400,
                  textScale: 5.5.sp,
                  color: Color(0xffFFFFFF),
                ),
              ),
            ).paddingOnly(top: 12.sp),
          ],
        ),
      ),
    );
  }

  //mob
  void showDeleteConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 4.sp),
          backgroundColor: const Color(0xffFFFFFF),
          title: buildDialogTitle(context),
          content: buildDialogContent(context),
          actions: buildDialogActions(context, index),
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
          size: 19.sp,
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
            textScale: 4.75.sp,
            color: const Color(0xff8F8F8F),
            family: "Jakarta",
            align: TextAlign.center,
            weight: FontWeight.w400,
          ).paddingOnly(
            bottom: context.height * .65.sp,
            top: context.height * .45.sp,
          ),
        ],
      ),
    );
  }

  List<Widget> buildDialogActions(BuildContext context, int index) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: dialogButtonStyle(
              const Color(0xffE84343),
            ),
            onPressed: () {
              controller.removeField(index);
              Navigator.pop(context);
            },
            child: Text(
              'I’m sure',
              textScaler: TextScaler.linear(3.8.sp),
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
              textScaler: TextScaler.linear(3.8.sp),
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
