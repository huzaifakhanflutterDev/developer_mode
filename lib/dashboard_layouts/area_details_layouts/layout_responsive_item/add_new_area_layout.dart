import 'package:developer_mode/dashboard_layouts/area_details_layouts/layout_responsive_item/new_area_desktop_item.dart';
import 'package:developer_mode/dashboard_layouts/area_details_layouts/layout_responsive_item/new_area_mob_item.dart';
import 'package:developer_mode/dashboard_layouts/area_details_layouts/layout_responsive_item/new_area_tab_item.dart';
import 'package:developer_mode/responsiveness/responsive_layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddNewAreaLayout extends StatelessWidget {
  const AddNewAreaLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LatLng initial = LatLng(34.2223, 72.2689);
    var he = context.height;
    var w = context.width;
    return Scaffold(
      body: ResponsiveLayoutScreen(
        mobile: NewAreaMobItem(he: he, initial: initial, w: w),
        tablet: NewAreaTabItem(he: he, initial: initial, w: w),
        desktop: NewAreaDesktopItem(he: he, initial: initial, w: w),
      ),
    );
  }
}
