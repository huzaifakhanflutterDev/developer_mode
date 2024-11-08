import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../../screens/dashboard_screen_items/dashboard_screen.dart';
import '../../../utils/my_elevated_button.dart';
import '../../../utils/my_text.dart';
import '../../../utils/my_text_field.dart';

class NewAreaDesktopItem extends StatelessWidget {
  LatLng initial;
  double he, w;

  NewAreaDesktopItem({
    required this.he,
    required this.initial,
    required this.w,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: w * .4.sp,
              vertical: he * .5.sp,
            ),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: Color(0xff000000).withOpacity(0.2),
                  width: 0.5,
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                    text: "Add new area",
                    weight: FontWeight.w700,
                    textScale: 3.5.sp,
                  ),
                ),
                SizedBox(
                  height: he * .5.sp,
                ),
                MyText(
                  text: "Select Payment method",
                  weight: FontWeight.w500,
                  textScale: 3.sp,
                ).paddingOnly(bottom: he * .35.sp),
                ListView.builder(
                  itemCount: 3,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    var names = [
                      "MTN Money",
                      "Stripe Method",
                      "Orange money",
                    ];
                    var images = [
                      "assets/images/mtn.png",
                      "assets/images/stripe.png",
                      "assets/images/orange.png",
                    ];
                    var click = Rx(false);
                    return Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: w * .35.sp, vertical: 6.sp),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xff000000).withOpacity(0.2),
                          ),
                        ),
                      ),
                      child: Obx(() {
                        return SwitchListTile(
                          inactiveTrackColor: Color(0xffFFFFFF),
                          hoverColor: Color(0xffffffff),
                          contentPadding: EdgeInsets.zero,
                          value: click.value,
                          onChanged: (value) {
                            click.value = value;
                          },
                          title: MyText(
                            text: names[index],
                            weight: FontWeight.w400,
                            textScale: 2.75.sp,
                          ),
                          secondary: Image.asset(images[index]),
                        );
                      }),
                    );
                  },
                ),
                SizedBox(
                  height: he * .65.sp,
                ),
                MyText(
                  text: "Set Default price",
                  weight: FontWeight.w500,
                  textScale: 3.2.sp,
                ).paddingOnly(bottom: 10.sp),
                MyTextField(hint: r"$2").paddingOnly(bottom: 15.sp),
                MyText(
                  text: "Select City",
                  weight: FontWeight.w400,
                  textScale: 2.8.sp,
                  color: Color(0xf0000000).withOpacity(0.4),
                ).paddingOnly(bottom: he * .3.sp),
                PopupMenuButton(
                  color: Color(0xffFFFFFF),
                  position: PopupMenuPosition.under,
                  constraints: BoxConstraints(
                    minWidth: context.width * .2925,
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: MyText(
                        text: "Toronto",
                        textScale: 3.sp,
                        weight: FontWeight.w400,
                      ),
                      value: "Toronto",
                    ),
                    PopupMenuItem(
                      child: MyText(
                        text: "Toronto",
                        textScale: 3.sp,
                        weight: FontWeight.w400,
                      ),
                      value: "Toronto",
                    ),
                    PopupMenuItem(
                      child: MyText(
                        text: "Toronto",
                        textScale: 3.sp,
                        weight: FontWeight.w400,
                      ),
                      value: "Toronto",
                    ),
                  ],
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
                      title: MyText(
                        text: "Toronto",
                        textScale: 3.sp,
                        weight: FontWeight.w400,
                      ),
                      trailing: Icon(Icons.keyboard_arrow_down),
                      onTap: null,
                    ),
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: context.width * 1.25.sp,
                    child: ElevatedBtn(
                      onPressed: () {
                        Get.to(() => DashboardScreen());
                      },
                      text: Text(
                        "Add",
                        textScaler: TextScaler.linear(3.25.sp),
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: initial,
                  zoom: 13,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId("1"),
                    infoWindow: InfoWindow(),
                    draggable: true,
                    position: initial,
                  ),
                },
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(context.height * .055.sp),
                child: TextFormField(
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff000000).withOpacity(0.8),
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15.sp),
                    hintText: "Search...",
                    hintStyle: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff000000).withOpacity(0.5),
                      // fontFamily: "Poppin"
                    ),
                    filled: true,
                    fillColor: Color(0xffFFFFFF),
                    prefixIcon: Container(
                      margin: EdgeInsets.only(left: 10.sp),
                      height: context.height * .0245,
                      width: context.width * .05,
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/svgs/search.svg",
                          height: context.height * .0245,
                          color: Color(0xff000000).withOpacity(0.3),
                        ),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.sp),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.sp),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ).paddingSymmetric(horizontal: 8.sp, vertical: 5),
              ),
            ],
          ),
        )
      ],
    );
  }
}
