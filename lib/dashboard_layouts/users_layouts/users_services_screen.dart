import 'package:developer_mode/dashboard_layouts/users_layouts/user_items/user_item.dart';
import 'package:developer_mode/responsiveness/responsive_layout_screen.dart';
import 'package:developer_mode/utils/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'service_container_layout.dart';

class UsersServicesScreen extends StatelessWidget {
  const UsersServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var selectedTab = Rx(serviceList.first['name'].toString());

    print(context.width);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(context.height * .5.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: serviceList
                  .map(
                    (e) => Obx(
                      () {
                        return ServiceContainerLayout(
                          data: e,
                          groupValue: selectedTab.value,
                          value: e['name'].toString(),
                          onChange: (value) {
                            selectedTab.value = value;
                          },
                        );
                      },
                    ),
                  )
                  .toList(),
            ),
            SizedBox(
              height: context.height * .45.sp,
            ),
            Obx(
              () {
                return MyText(
                  text: "All ${selectedTab.value}",
                  textScale:
                      ResponsiveLayoutScreen.isDesktop(context) ? 1.5 : 1.8,
                );
              },
            ).paddingOnly(
              left: ResponsiveLayoutScreen.isDesktop(context)
                  ? context.width * .25.sp
                  : context.width * .45.sp,
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
                  crossAxisCount:
                      ResponsiveLayoutScreen.isDesktop(context) ? 5 : 2,
                  childAspectRatio: ResponsiveLayoutScreen.isDesktop(context)
                      ? context.width >= 1200
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
                                              : .64
                      : ResponsiveLayoutScreen.isTablet(context)
                          ? 4.175.sp
                          : ResponsiveLayoutScreen.isMobile(context)
                              ? 4.125.sp
                              : 2.75.sp,
                ),
                itemBuilder: (context, index) {
                  return Obx(
                    () {
                      return UserItem(
                        type: selectedTab.value,
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
