import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/my_text.dart';
import '../../users_layouts/service_container_layout.dart';
import '../../users_layouts/user_items/user_item.dart';
import '../profile_details_id_card_responsive_items/profile_details_id_card.dart';

class ProviderTabItem extends StatelessWidget {
  Rx<String> selectedOptions;

  ProviderTabItem({required this.selectedOptions});

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
              MyText(
                text: "ID Verification",
                weight: FontWeight.w500,
                textScale: 4.75.sp,
              ),
              PopupMenuButton(
                position: PopupMenuPosition.under,
                popUpAnimationStyle: AnimationStyle(
                  duration: Duration(milliseconds: 400),
                  curve: Curves.fastOutSlowIn,
                  reverseDuration: Duration(milliseconds: 200),
                ),
                child: Container(
                  width: 50.sp,
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
                    title: Obx(
                          () {
                        return MyText(
                          text: selectedOptions.value,
                          textScale: 4.sp,
                          weight: FontWeight.w500,
                          family: "Roboto",
                        );
                      },
                    ),
                    trailing: Icon(Icons.arrow_drop_down),
                    onTap: null,
                  ),
                ),
                // elevation: 0,
                color: Colors.white,
                onSelected: (value) {
                  selectedOptions.value = value;
                },
                initialValue: selectedOptions.value,
                constraints: BoxConstraints(
                  maxWidth: context.width * 2.25.sp,
                  minWidth: context.width * 2.sp,
                ),
                padding: EdgeInsets.zero,
                menuPadding: EdgeInsets.symmetric(vertical: 0.sp),
                itemBuilder: (context) =>
                [
                  PopupMenuItem(
                    padding: EdgeInsets.zero,
                    child: ListTile(
                      minVerticalPadding: -20,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 10.sp,
                      ),
                      title: MyText(
                        text: "Service Providers",
                        textScale: 3.95.sp,
                        color: Color(0xff1D1B20),
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
                        textScale: 3.95.sp,
                        color: Color(0xff1D1B20),
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
              childAspectRatio: 3.975.sp,
            ),
            itemBuilder: (context, index) {
              return _buildAllProvidersData(
                context,
                itemsDataList[index],
                serviceList.first['name'],
                selectedOptions,
                index,
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
              Spacer(),
              ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: Image.network(
                  data['image'] + "?random=$index",
                  height: context.height * 1.4.sp,
                ),
              ),
              Spacer(),
              MyText(
                text: data['name'],
                weight: FontWeight.bold,
                textScale: 5.sp,
                color: Color(0xff000041),
              ),
              Spacer(),
              MyText(
                text: data['address'],
                weight: FontWeight.w400,
                textScale: 4.5.sp,
                color: Color(0xff717579),
              ),
              Obx(() {
                return MyText(
                  text: selectedOptions.value,
                  weight: FontWeight.w600,
                  textScale: 4.25.sp,
                  color: Color(0xff1B8271),
                );
              }),
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
                        padding: EdgeInsets.all(5.sp),
                        duration: Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          color: Color(0xff48B16A).withOpacity(0.1),
                        ),
                        child: SvgPicture.asset(
                          data["emailImg"],
                          height: context.height * .6.sp,
                        ),
                      ),
                      SizedBox(
                        width: context.width * .4.sp,
                      ),
                      Text(
                        data["email"],
                        textScaler: TextScaler.linear(
                          3.85.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "Dmsans",
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
