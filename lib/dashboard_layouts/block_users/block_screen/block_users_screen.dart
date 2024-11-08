import 'package:developer_mode/dashboard_layouts/block_users/block_screen/block_screen_desktop_item.dart';
import 'package:developer_mode/dashboard_layouts/block_users/block_screen/block_screen_mob_item.dart';
import 'package:developer_mode/dashboard_layouts/block_users/block_screen/block_screen_tab_item.dart';
import 'package:developer_mode/dashboard_layouts/users_layouts/service_container_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../responsiveness/responsive_layout_screen.dart';

class BlockUsersScreen extends StatelessWidget {
  const BlockUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var selectedOptions = Rx(serviceList.first['name'].toString());
    return ResponsiveLayoutScreen(
      mobile: BlockScreenMobItem(selectedOption: selectedOptions),
      tablet: BlockScreenTabItem(selectedOption: selectedOptions),
      desktop: BlockScreenDesktopItem(selectedOption: selectedOptions),
    );
  }
}
