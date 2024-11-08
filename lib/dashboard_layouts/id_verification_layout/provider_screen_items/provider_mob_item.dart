import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../responsiveness/responsive_layout_screen.dart';
import '../../../utils/my_text.dart';
import '../../users_layouts/service_container_layout.dart';
import '../../users_layouts/user_items/user_item.dart';
import '../profile_details_id_card_responsive_items/profile_details_id_card.dart';

class ProviderMobItem extends StatelessWidget {
  Rx<String> selectedOptions;

  ProviderMobItem({required this.selectedOptions});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: !ResponsiveLayoutScreen.isMobile(context)
            ? context.width * .4.sp
            : context.width * .75.sp,
        vertical: context.height * .75.sp,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                text: "ID Verification",
                weight: FontWeight.w500,
                textScale: 5.75.sp,
              ).paddingSymmetric(horizontal: 12.sp),
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
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.sp, horizontal: 12.sp),
                    title: Obx(() {
                      return MyText(
                        text: selectedOptions.value,
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
                  selectedOptions.value = value;
                },
                initialValue: selectedOptions.value,
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
          ),
          SizedBox(height: context.height * .6.sp),
          GridView.builder(
            itemCount: itemsDataList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3.7.sp,
            ),
            itemBuilder: (context, index) {
              return Obx(
                () {
                  return _buildAllProvidersData(context, itemsDataList[index],
                      serviceList.first['name'], selectedOptions, index);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAllProvidersData(BuildContext context, Map<String, dynamic> data,
      String type, Rx<String> selectedOptions, int index) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Get.to(
            () => ProfileDetailsIdCard(data: data, type: type),
          );
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.all(context.height * .425.sp),
          padding: EdgeInsets.all(context.height * .5.sp),
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.circular(12.sp),
            border: Border.all(
              color: Color(0xff000000).withOpacity(.15),
            ),
          ),
          child: Column(
            children: [
              Spacer(),
              SizedBox(height: context.height * .25.sp),
              ClipRRect(
                borderRadius: BorderRadius.circular(12.sp),
                child: Image.network(
                  data['image'] + "?random=$index",
                  height: context.height * 1.5.sp,
                ),
              ),
              SizedBox(height: context.height * .35.sp),
              Spacer(),
              MyText(
                text: data['name'],
                weight: FontWeight.w600,
                textScale: 6.sp,
                color: Color(0xff000041),
              ),
              Spacer(),
              SizedBox(
                height: context.height * .15.sp,
              ),
              MyText(
                text: data['address'],
                weight: FontWeight.w400,
                textScale: 5.35.sp,
                color: Color(0xff717579),
              ),
              MyText(
                text: selectedOptions.value,
                weight: FontWeight.w600,
                textScale: 5.2.sp,
                color: Color(0xff1B8271),
              ),
              SizedBox(
                height: context.height * .4.sp,
              ),
              Spacer(),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          color: Color(0xff48B16A).withOpacity(0.1),
                        ),
                        child: SvgPicture.asset(
                          data["emailImg"],
                          width: context.width * .85.sp,
                        ),
                      ),
                      SizedBox(
                        width: context.width * .4.sp,
                      ),
                      Text(
                        data["email"],
                        textScaler: TextScaler.linear(3.75.sp),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
