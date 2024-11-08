import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/my_text.dart';
import '../../users_layouts/service_container_layout.dart';
import '../../users_layouts/user_items/user_item.dart';
import '../profile_details_id_card_responsive_items/profile_details_id_card.dart';

class ProviderDesktopItem extends StatelessWidget {
  Rx<String> selectedOptions;

  ProviderDesktopItem({required this.selectedOptions});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    text: "All ${selectedOptions.value}",
                    weight: FontWeight.w500,
                    textScale: 1.25,
                  );
                },
              ).paddingOnly(left: 12.sp),
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
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.sp, horizontal: 12.sp),
                    title: Obx(() {
                      return MyText(
                        text: selectedOptions.value,
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
                  selectedOptions.value = value;
                },
                initialValue: selectedOptions.value,
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
          SizedBox(height: context.height * .6.sp),
          GridView.builder(
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
          width: context.width * 1.25.sp,
          margin: EdgeInsets.all(context.height * .425.sp),
          padding: EdgeInsets.all(context.height * .5.sp),
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.circular(12.sp),
            border: Border.all(
              color: Color(0xff000000).withOpacity(0.1),
            ),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.sp),
                child: Image.network(
                  "https://picsum.photos/170/150/" + "?random=$index",
                  height: context.height * 1.15.sp,
                ),
              ),
              Spacer(),
              MyText(
                text: data['name'],
                weight: FontWeight.w600,
                textScale: 1,
                color: Color(0xff000041),
              ),
              Spacer(),
              MyText(
                text: data['address'],
                weight: FontWeight.w400,
                textScale: 0.8,
                color: Color(0xff717579),
              ),
              MyText(
                text: selectedOptions.value,
                weight: FontWeight.w600,
                textScale: 0.758,
                color: Color(0xff1B8271),
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
                        duration: Duration(milliseconds: 600),
                        decoration: BoxDecoration(
                          color: Color(0xff48B16A).withOpacity(0.1),
                        ),
                        child: SvgPicture.asset(
                          data["emailImg"],
                        ),
                      ),
                      SizedBox(
                        width: context.width * .2.sp,
                      ),
                      Text(
                        data["email"],
                        textScaler: TextScaler.linear(0.7),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
