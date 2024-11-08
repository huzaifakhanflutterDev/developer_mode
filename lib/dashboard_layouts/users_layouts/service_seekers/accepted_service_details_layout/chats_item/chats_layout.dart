import 'package:developer_mode/dashboard_layouts/users_layouts/service_seekers/accepted_service_details_layout/chats_item/chat_desktop_item.dart';
import 'package:developer_mode/dashboard_layouts/users_layouts/service_seekers/accepted_service_details_layout/chats_item/chat_tab_item.dart';
import 'package:developer_mode/responsiveness/responsive_layout_screen.dart';
import 'package:flutter/material.dart';

import 'chat_mob_item.dart';

class ChatsLayout extends StatelessWidget {
  const ChatsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ResponsiveLayoutScreen(
          mobile: ChatMobItem(),
          tablet: ChatTabItem(),
          desktop: ChatDesktopItem(),
        ),
      ),
    );
  }
}
