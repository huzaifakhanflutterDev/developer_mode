import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../../screens/dashboard_screen_items/dashboard_screen.dart';
import '../../../utils/my_elevated_button.dart';
import '../../../utils/my_text.dart';
import '../../../utils/my_text_field.dart';

class NewAreaMobItem extends StatelessWidget {
  LatLng initial;
  double he, w;

  NewAreaMobItem({
    required this.he,
    required this.initial,
    required this.w,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * .8.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton.icon(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Container(
                    padding: EdgeInsets.all(8.sp),
                    decoration: BoxDecoration(
                      color: Color(0xff000000).withOpacity(.05),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        size: 18.sp,
                        Icons.arrow_back,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  label: MyText(
                    text: "Add new area",
                    weight: FontWeight.w700,
                    textScale: 6.sp,
                  ),
                ),
                SizedBox(
                  height: he * .7.sp,
                ),
                MyText(
                  text: "Select Payment method",
                  weight: FontWeight.w500,
                  color: Color(0xff191A1E).withOpacity(0.5),
                  textScale: 5.75.sp,
                ).paddingOnly(bottom: he * .65.sp),
                ListView.separated(
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
                    return Obx(
                      () {
                        return ListTile(
                          leading: IntrinsicWidth(
                            stepWidth: 40.sp,
                            child: Image.asset(
                              images[index],
                            ),
                          ),
                          title: MyText(
                            text: names[index],
                            weight: FontWeight.w400,
                            textScale: 5.75.sp,
                          ),
                          trailing: Transform.scale(
                            scale: .7,
                            child: Switch(
                              inactiveTrackColor: Color(0xffFFFFFF),
                              value: click.value,
                              onChanged: (value) {
                                click.value = value;
                              },
                            ),
                          ),
                          contentPadding: EdgeInsets.zero,
                        );
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      height: 20.sp,
                    );
                  },
                ),
                SizedBox(
                  height: he * .75.sp,
                ),
                MyText(
                  text: "Set Default price",
                  weight: FontWeight.w500,
                  textScale: 5.75.sp,
                ).paddingOnly(bottom: 10.sp),
                MyTextField(hint: r"$2").paddingOnly(bottom: 15.sp),
                MyText(
                  text: "Select City",
                  weight: FontWeight.w400,
                  textScale: 5.8.sp,
                  color: Color(0xf0000000).withOpacity(0.4),
                ).paddingOnly(bottom: he * .3.sp),
                PopupMenuButton(
                  color: Color(0xffFFFFFF),
                  position: PopupMenuPosition.under,
                  padding: EdgeInsets.symmetric(horizontal: 20.sp
                  ),
                  constraints: BoxConstraints(
                    minWidth: context.width ,
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: MyText(text: "Toronto",textScale: 5.5.sp,weight: FontWeight.w400,),
                      value: "Toronto",
                    ),
                    PopupMenuItem(
                      child: MyText(text: "Toronto",textScale: 5.5.sp,weight: FontWeight.w400,),
                      value: "Toronto",
                    ),
                    PopupMenuItem(
                      child: MyText(text: "Toronto",textScale: 5.5.sp,weight: FontWeight.w400,),
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
                      title: MyText(text: "Toronto",textScale: 5.5.sp,weight: FontWeight.w400,),
                      trailing: Icon(Icons.keyboard_arrow_down),
                      onTap: null,
                    ),
                  ),
                ),
                SizedBox(height: context.height * .85.sp),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: context.width * 2.9.sp,
                    child: ElevatedBtn(
                      radius: 10.sp,
                      onPressed: () {
                        Get.to(
                          () => DashboardScreen(),
                          curve: Curves.fastEaseInToSlowEaseOut,
                          duration: Duration(milliseconds: 800),
                        );
                      },
                      text: Text(
                        "Add",
                        textScaler: TextScaler.linear(5.sp),
                        style: TextStyle(
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: he * .7.sp,
                ),
              ],
            ),
          ),
          SizedBox(
            height: context.height,
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
          ),
        ],
      ),
    );
  }
}
