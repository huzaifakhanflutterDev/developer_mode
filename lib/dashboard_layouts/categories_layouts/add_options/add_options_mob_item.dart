import 'package:developer_mode/controller/radio_listtile_controller.dart';
import 'package:developer_mode/utils/my_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../screens/dashboard_screen_items/dashboard_screen.dart';
import '../../../utils/my_text.dart';
import '../../../utils/my_text_field.dart';

class AddOptionsMobItem extends StatelessWidget {
  List<String> names;
  RadioController controller;
  String title;

  AddOptionsMobItem({
    required this.title,
    required this.names,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(context.height * .75.sp),
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
                text: title,
                weight: FontWeight.w700,
                textScale: 5.75.sp,
              ),
            ),
            SizedBox(
              height: context.height * .65.sp,
            ),
            MyText(
              text: "Options",
              textScale: 5.75.sp,
              color: Color(0xff000000).withOpacity(0.5),
            ),
            Obx(
              () {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.filteredNames.length,
                  itemBuilder: (_, index) {
                    return Obx(
                      () {
                        return RadioListTile(
                          activeColor: Color(0xff48B16A),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: context.height * .325.sp),
                          value: index,
                          groupValue: controller.radio.value,
                          onChanged: (value) {
                            controller.selectedOption(value);
                          },
                          title: MyTextField(
                            controller: TextEditingController(
                              text: controller.filteredNames[index],
                            ),
                            hint: '',
                            font: 10.sp,
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
            SizedBox(height: 25.sp),
            PopupMenuButton(
              color: Color(0xffFFFFFF),
              position: PopupMenuPosition.under,
              constraints: BoxConstraints(
                minWidth: context.width * .2925,
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: MyText(
                    text: "One",
                    textScale: 5.5.sp,
                    weight: FontWeight.w400,
                  ),
                  value: "One",
                ),
                PopupMenuItem(
                  child: MyText(
                    text: "Two",
                    textScale: 5.5.sp,
                    weight: FontWeight.w400,
                  ),
                  value: "Two",
                ),
                PopupMenuItem(
                  child: MyText(
                    text: "Three",
                    textScale: 5.5.sp,
                    weight: FontWeight.w400,
                  ),
                  value: "Three",
                ),
                PopupMenuItem(
                  child: MyText(
                    text: "Four",
                    textScale: 5.5.sp,
                    weight: FontWeight.w400,
                  ),
                  value: "Four",
                ),
              ],
              onSelected: (value) {
                controller.selectOption(value);
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: context.width * .2.sp,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.sp),
                  border: Border.all(
                    width: 0.7,
                    color: Color(0xff000000).withOpacity(0.15),
                  ),
                ),
                child: ListTile(
                  title: Obx(
                    () {
                      return MyText(
                        text: controller.selectedOptions.value,
                        textScale: 5.5.sp,
                        weight: FontWeight.w400,
                      );
                    },
                  ),
                  trailing: Icon(Icons.keyboard_arrow_down),
                  onTap: null,
                ),
              ),
            ).paddingOnly(right: context.width * 3.sp),
            SizedBox(height: context.height * 1.sp),
            ElevatedBtn(
              radius: 10.sp,
              onPressed: () {
                Get.to(
                  () => DashboardScreen(),
                  curve: Curves.fastEaseInToSlowEaseOut,
                  duration: Duration(milliseconds: 800),
                );
              },
              text: Text(
                "Set Option",
                textScaler: TextScaler.linear(5.sp),
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color(0xffFFFFFF),
                ),
              ),
            ).paddingSymmetric(horizontal: context.width * 1.5.sp)
          ],
        ),
      ),
    );
  }
}
