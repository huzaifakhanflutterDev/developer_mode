import 'package:developer_mode/dashboard_layouts/id_verification_layout/provider_screen_items/provider_desktop_item.dart';
import 'package:developer_mode/dashboard_layouts/id_verification_layout/provider_screen_items/provider_mob_item.dart';
import 'package:developer_mode/dashboard_layouts/id_verification_layout/provider_screen_items/provider_tab_item.dart';
import 'package:developer_mode/dashboard_layouts/users_layouts/service_container_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../responsiveness/responsive_layout_screen.dart';

class AllProvidersLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var selectedOptions = Rx(serviceList.first['name'].toString());
    return SingleChildScrollView(
      child: ResponsiveLayoutScreen(
        mobile: ProviderMobItem(
          selectedOptions: selectedOptions,
        ),
        tablet: ProviderTabItem(
          selectedOptions: selectedOptions,
        ),
        desktop: ProviderDesktopItem(
          selectedOptions: selectedOptions,
        ),
      ),
    );
  }
}
