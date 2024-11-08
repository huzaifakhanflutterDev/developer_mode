import 'package:developer_mode/controller/radio_listtile_controller.dart';
import 'package:developer_mode/dashboard_layouts/users_layouts/service_seekers/service_post_tab/post_details_tab_screen.dart';
import 'package:developer_mode/responsiveness/responsive_layout_screen.dart';
import 'package:developer_mode/utils/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class ServicePostScreen extends StatelessWidget {
  Map<String, dynamic> data;
  String type;

  ServicePostScreen({required this.data, required this.type});

  @override
  Widget build(BuildContext context) {
    var title = "Available";
    var name = "Expired";

    var controller = Get.put(RadioController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 10),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: PopupMenuButton(
                  style: ButtonStyle(
                    shadowColor: WidgetStatePropertyAll(Colors.white),
                  ),
                  onSelected: (newValue) {
                    controller.toggleStatus(newValue);
                  },
                  position: PopupMenuPosition.under,
                  popUpAnimationStyle: AnimationStyle(
                    duration: Duration(milliseconds: 400),
                    curve: Curves.fastOutSlowIn,
                    reverseDuration: Duration(milliseconds: 200),
                  ),
                  child: Container(
                    width: ResponsiveLayoutScreen.isDesktop(context) ||
                            ResponsiveLayoutScreen.isTablet(context)
                        ? 45.sp
                        : 50.sp,
                    decoration: BoxDecoration(
                      // color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Obx(
                      () {
                        return ListTile(
                          minVerticalPadding: 7,
                          minTileHeight: 21.sp,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          tileColor: Color(0xff000000).withOpacity(0.1),
                          titleAlignment: ListTileTitleAlignment.center,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 0.sp, horizontal: 12.sp),
                          title: MyText(
                            text: controller.currentStatus.value,
                            textScale: ResponsiveLayoutScreen.isDesktop(context)
                                ? 3.25.sp
                                : ResponsiveLayoutScreen.isTablet(context)
                                    ? 4.5.sp
                                    : 4.95.sp,
                            weight: FontWeight.w500,
                            family: "Roboto",
                          ),
                          subtitle: Text(
                            "Services",
                            textScaler: TextScaler.linear(
                              ResponsiveLayoutScreen.isDesktop(context) ||
                                      ResponsiveLayoutScreen.isTablet(context)
                                  ? 3.35.sp
                                  : 3.75.sp,
                            ),
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontFamily: "Roboto",
                              color: Color(0xff000000).withOpacity(0.5),
                            ),
                          ),
                          trailing: Icon(Icons.arrow_drop_down),
                          onTap: !ResponsiveLayoutScreen.isDesktop(context)
                              ? () {
                                  showDialog(
                                    context: context,
                                    builder: (_) {
                                      return _buildAlertDialog(
                                          controller, context);
                                    },
                                  );
                                }
                              : null,
                        );
                      },
                    ),
                  ),
                  constraints: BoxConstraints(
                    maxWidth: context.width * 2.sp,
                    minWidth: context.width * 1.19.sp,
                  ),
                  surfaceTintColor: Color(0xffF6F6F6),
                  color: Colors.white,
                  padding: EdgeInsets.zero,
                  menuPadding: EdgeInsets.symmetric(vertical: 7.sp),
                  itemBuilder: (context) => [
                    if (ResponsiveLayoutScreen.isDesktop(context))
                      PopupMenuItem(
                        height: 20,
                        padding: EdgeInsets.zero,
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 10.sp,
                          ),
                          title: MyText(
                            text: title,
                            textScale: ResponsiveLayoutScreen.isDesktop(context)
                                ? 2.95.sp
                                : ResponsiveLayoutScreen.isTablet(context)
                                    ? 4.7.sp
                                    : 4.95.sp,
                            color: Color(0xff1D1B20).withOpacity(0.6),
                          ),
                          subtitle: MyText(
                            text: "Services",
                            textScale: ResponsiveLayoutScreen.isDesktop(context)
                                ? 2.95.sp
                                : ResponsiveLayoutScreen.isTablet(context)
                                    ? 4.7.sp
                                    : 4.5.sp,
                            color: Color(0xff49454F).withOpacity(0.4),
                          ),
                          onTap: null,
                        ),
                        value: title,
                      ),
                    if (ResponsiveLayoutScreen.isDesktop(context))
                      PopupMenuItem(
                        padding: EdgeInsets.zero,
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 10.sp,
                          ),
                          title: MyText(
                            text: name,
                            textScale: ResponsiveLayoutScreen.isDesktop(context)
                                ? 2.95.sp
                                : ResponsiveLayoutScreen.isTablet(context)
                                    ? 4.7.sp
                                    : 4.95.sp,
                            color: Color(0xff1D1B20).withOpacity(0.6),
                          ),
                          subtitle: MyText(
                            text: "Services",
                            textScale: ResponsiveLayoutScreen.isDesktop(context)
                                ? 2.95.sp
                                : ResponsiveLayoutScreen.isTablet(context)
                                    ? 4.7.sp
                                    : 4.5.sp,
                            color: Color(0xff49454F).withOpacity(0.4),
                          ),
                          onTap: null,
                        ),
                        value: name,
                      ),
                  ],
                ),
              ),
              SizedBox(height: context.height * .5.sp),
              GridView.builder(
                itemCount: 8,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: ResponsiveLayoutScreen.isDesktop(context)
                      ? type == "Service Providers"
                          ? 3
                          : 4
                      : 1,
                  crossAxisSpacing: 15.sp,
                  mainAxisSpacing: 15.sp,
                  childAspectRatio: ResponsiveLayoutScreen.isDesktop(context)
                      ? type == "Service Providers"
                          ? 4.sp
                          : 3.45.sp
                      : type == "Service Providers"
                          ? 5.8.sp
                          : 5.75.sp,
                ),
                itemBuilder: (_, index) {
                  return _buildingBody(context, index, controller);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildingBody(
      BuildContext context, int index, RadioController controller) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Get.to(
            () => PostDetailsTabsScreen(
              data: data,
              type: type,
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.all(
            ResponsiveLayoutScreen.isDesktop(context)
                ? context.width * .295.sp
                : context.width * .5.sp,
          ),
          decoration: BoxDecoration(
              color: Color(0xffFFFFFF),
              borderRadius: BorderRadius.circular(14.sp),
              border: Border.all(color: Color(0xff000000).withOpacity(0.1))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (type == "Service Providers")
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        right: ResponsiveLayoutScreen.isDesktop(context)
                            ? context.width * .175.sp
                            : context.width * .5.sp,
                      ),
                      height: ResponsiveLayoutScreen.isDesktop(context)
                          ? 25.sp
                          : 34.sp,
                      width: ResponsiveLayoutScreen.isDesktop(context)
                          ? 25.sp
                          : 34.sp,
                      decoration: BoxDecoration(
                        color: Color(0xffF7F7F7),
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      child: Center(
                        child: CircleAvatar(
                          radius: !ResponsiveLayoutScreen.isDesktop(context)
                              ? 20.sp
                              : 15.75.sp,
                          backgroundImage: NetworkImage(
                            data['image'] + "?random=$index",
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                flex: ResponsiveLayoutScreen.isMobile(context)
                                    ? 3
                                    : 5,
                                child: MyText(
                                  text: data['name'],
                                  textScale: ResponsiveLayoutScreen.isDesktop(
                                          context)
                                      ? 2.875.sp
                                      : ResponsiveLayoutScreen.isTablet(context)
                                          ? 4.5.sp
                                          : 5.25.sp,
                                  family: "Mont",
                                ),
                              ),
                              Spacer(
                                flex: 3,
                              ),
                              Expanded(
                                flex: 2,
                                child: TextButton.icon(
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  onPressed: null,
                                  icon: Icon(
                                    Icons.star_rounded,
                                    size: ResponsiveLayoutScreen.isDesktop(
                                            context)
                                        ? 13.sp
                                        : 18.sp,
                                    color: Color(0xffFFC107),
                                  ),
                                  label: MyText(
                                    text: "4.8",
                                    family: "Mont",
                                    textScale: ResponsiveLayoutScreen.isDesktop(
                                            context)
                                        ? 2.75.sp
                                        : ResponsiveLayoutScreen.isTablet(
                                                context)
                                            ? 4.5.sp
                                            : 5.25.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          MyText(
                            text: data['prof'].toString(),
                            textScale: ResponsiveLayoutScreen.isDesktop(context)
                                ? 3.45.sp
                                : ResponsiveLayoutScreen.isTablet(context)
                                    ? 5.25.sp
                                    : 5.75.sp,
                            weight: FontWeight.w700,
                            family: "Mont",
                          ),
                          MyText(
                            text: data['address'],
                            textScale: ResponsiveLayoutScreen.isDesktop(context)
                                ? 2.75.sp
                                : ResponsiveLayoutScreen.isTablet(context)
                                    ? 4.5.sp
                                    : 5.25.sp,
                            weight: FontWeight.w400,
                            color: Color(0xff797C86),
                            family: "Mont",
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              if (type == "Service Seekers")
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      text: "Figma",
                      textScale: ResponsiveLayoutScreen.isDesktop(context)
                          ? 3.15.sp
                          : ResponsiveLayoutScreen.isTablet(context)
                              ? 4.5.sp
                              : 5.25.sp,
                      weight: FontWeight.w500,
                    ),
                    Obx(
                      () {
                        Color textColor =
                            controller.currentStatus.value == "Expired"
                                ? Color(0xffFC4646)
                                : Color(0xff1B8271);
                        return MyText(
                          text: controller.currentStatus.value,
                          weight: FontWeight.w700,
                          textScale: ResponsiveLayoutScreen.isDesktop(context)
                              ? 2.8.sp
                              : ResponsiveLayoutScreen.isTablet(context)
                                  ? 3.8.sp
                                  : 4.95.sp,
                          color: textColor,
                        );
                      },
                    ).paddingOnly(right: 10.sp),
                  ],
                ),
              if (type == "Service Seekers")
                MyText(
                  text: data['prof'].toString(),
                  family: "Mont",
                  textScale: ResponsiveLayoutScreen.isDesktop(context)
                      ? 3.45.sp
                      : ResponsiveLayoutScreen.isTablet(context)
                          ? 4.85.sp
                          : 5.85.sp,
                  weight: FontWeight.w700,
                ),
              if (type == "Service Seekers")
                MyText(
                  text: data['address'],
                  textScale: ResponsiveLayoutScreen.isDesktop(context)
                      ? 2.75.sp
                      : ResponsiveLayoutScreen.isTablet(context)
                          ? 4.sp
                          : 5.sp,
                  weight: FontWeight.w400,
                  color: Color(0xff797C86),
                ),
              if (type != "Service Seekers") Spacer(),
              _buildElevatedButtonData(context),
              if (type == "Service Seekers")
                MyText(
                  text: data['budget'],
                  textScale: ResponsiveLayoutScreen.isDesktop(context)
                      ? 2.8.sp
                      : ResponsiveLayoutScreen.isTablet(context)
                          ? 4.sp
                          : 5.25.sp,
                  weight: FontWeight.w500,
                  family: "Satoshi",
                  color: Color(0xff000000).withOpacity(0.5),
                ).paddingOnly(left: 3.sp),
              Spacer(),
              Text(
                data['desc'],
                textScaler: TextScaler.linear(
                  ResponsiveLayoutScreen.isDesktop(context)
                      ? 2.9.sp
                      : type == "Service Providers"
                          ? 3.8.sp
                          : 3.95.sp,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(color: Color(0xff797C86)),
              ),
              Spacer(),
              _buildAvailableRow(context),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvailableRow(BuildContext context) {
    var like = false.obs;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            if (type == "Service Providers")
              Obx(
                () {
                  return TextButton(
                    onPressed: () {
                      like.value = !like.value;
                    },
                    child: Icon(
                      Icons.favorite,
                      color: !like.value
                          ? Color(0xffF44336)
                          : Color(0xff000000).withOpacity(0.3),
                    ),
                  );
                },
              ),
            if (type == "Service Seekers")
              SvgPicture.asset("assets/svgs/person_img.svg"),
            if (type == "Service Seekers")
              SizedBox(width: context.width * .2.sp),
            if (type == "Service Seekers")
              MyText(
                text: " 25 Applied",
                textScale: ResponsiveLayoutScreen.isDesktop(context)
                    ? 2.8.sp
                    : ResponsiveLayoutScreen.isTablet(context)
                        ? 3.75.sp
                        : 4.75.sp,
                weight: FontWeight.w400,
                color: Color(0xff000000).withOpacity(0.5),
              ),
            if (type == "Service Seekers")
              SizedBox(width: context.width * .275.sp),
            if (type == "Service Seekers")
              SizedBox(
                width: ResponsiveLayoutScreen.isMobile(context) ? 20.sp : 0.sp,
              ),
            if (type == "Service Seekers")
              SvgPicture.asset("assets/svgs/invites.svg"),
            if (type == "Service Seekers")
              SizedBox(width: context.width * .275.sp),
            if (type == "Service Seekers")
              MyText(
                text: " 10 Invites",
                textScale: ResponsiveLayoutScreen.isDesktop(context)
                    ? 2.8.sp
                    : ResponsiveLayoutScreen.isTablet(context)
                        ? 3.75.sp
                        : 4.75.sp,
                weight: FontWeight.w400,
                color: Color(0xff000000).withOpacity(0.5),
              ),
          ],
        ),
        if (type == "Service Providers")
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              MyText(
                text: data['budget'],
                family: "Satoshi",
                textScale: ResponsiveLayoutScreen.isDesktop(context)
                    ? 2.475.sp
                    : ResponsiveLayoutScreen.isTablet(context)
                        ? 4.sp
                        : 4.85.sp,
                weight: FontWeight.w500,
                color: Color(0xff000000).withOpacity(0.5),
              ),
              MyText(
                text: "Price",
                family: "Satoshi",
                textScale: ResponsiveLayoutScreen.isDesktop(context)
                    ? 2.5.sp
                    : ResponsiveLayoutScreen.isTablet(context)
                        ? 4.25.sp
                        : 4.95.sp,
                weight: FontWeight.w600,
                color: Color(0xff000000),
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildElevatedButtonData(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: context.width * .0.sp,
        vertical: !ResponsiveLayoutScreen.isMobile(context)
            ? context.height * .25.sp
            : context.height * .5.sp,
      ),
      decoration: BoxDecoration(
        color: Color(0xffF8F9FA),
        borderRadius: BorderRadius.circular(8.sp),
      ),
      child: MyText(
        text: type == "Service Seekers"
            ? data['time']
            : "${DateFormat("dd MMM yyyy").format(DateTime.now())}-${DateFormat("dd MMM yyyy").format(DateTime.now())}",
        color: Color(0xff000000),
        textScale: ResponsiveLayoutScreen.isDesktop(context)
            ? 2.4.sp
            : ResponsiveLayoutScreen.isTablet(context)
                ? type == "Service Providers"
                    ? 4.35.sp
                    : 3.5.sp
                : 5.25.sp,
      ).paddingSymmetric(horizontal: 12.sp, vertical: 10.sp),
    );
  }

  Widget _buildAlertDialog(RadioController controller, BuildContext context) {
    List<String> radioNames = [
      "Available",
      "Expired",
    ];
    return AlertDialog(
      title: Icon(Icons.mobile_friendly),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: MyText(
              text: "Service Status",
              textScale: 5.5.sp,
            ),
          ),
          SizedBox(height: 15.sp),
          MyText(
            text: "Select and check service status",
            textScale:
                ResponsiveLayoutScreen.isMobile(context) ? 5.sp : 4.25.sp,
          ),
          SizedBox(height: 8.sp),
          ...List.generate(
            radioNames.length,
            (index) {
              var list = ["A", "E"];
              return Obx(
                () {
                  return Column(
                    children: [
                      RadioListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 8.sp),
                        controlAffinity: ListTileControlAffinity.trailing,
                        secondary: CircleAvatar(
                          radius: 15.sp,
                          backgroundColor: Color(0xffE8E8E8),
                          child: MyText(
                            text: list[index],
                            textScale: 4.5.sp,
                          ),
                        ),
                        title: Text(
                          radioNames[index],
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: "Jakarta",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        subtitle: MyText(
                          text: "Services",
                          textScale: 5.sp,
                        ),
                        hoverColor: Colors.transparent,
                        value: index,
                        groupValue: controller.radio.value,
                        onChanged: (value) {
                          controller.selectedOption(value!);
                        },
                      ),
                      Divider(
                        height: 1.sp,
                        thickness: 0.7,
                        color: Color(0xff000000).withOpacity(0.1),
                      ),
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            "Cancel",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              // fontSize: 10.sp,
              color: Color(0xff8F8F8F),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            controller.toggleStatus(
              // controller.selectedOptions.value == "Expired"
              //     ? "Available"
              //     :
              "Expired",
            );
            Get.back();
          },
          child: Text(
            "Apply",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Color(0xff000000),
            ),
          ),
        )
      ],
    );
  }
}
