import 'package:developer_mode/dashboard_layouts/area_details_layouts/add_new_area/area_desktop_layout.dart';
import 'package:developer_mode/responsiveness/responsive_layout_screen.dart';
import 'package:flutter/material.dart';

import 'area_mobile_item.dart';
import 'area_tablet_item.dart';

class AddNewArea extends StatelessWidget {
  const AddNewArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ResponsiveLayoutScreen(
        mobile: AreaMobileItem(),
        tablet: AreaTabletItem(),
        desktop: AreaDesktopLayout(),
      ),
    );
  }
}
