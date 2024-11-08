import 'package:developer_mode/dashboard_layouts/area_details_layouts/add_new_area/add_new_area_screen.dart';
import 'package:developer_mode/dashboard_layouts/block_users/block_screen/block_users_screen.dart';
import 'package:developer_mode/dashboard_layouts/categories_layouts/categories_screen_items/all_categories_screen.dart';
import 'package:developer_mode/dashboard_layouts/id_verification_layout/provider_screen_items/all_providers_screen.dart';
import 'package:developer_mode/dashboard_layouts/users_layouts/users_services_screen.dart';
import 'package:get/get.dart';

class SideBarController extends GetxController {
  var selectedIndex = 0.obs;

  var sideBarScreens = [
    UsersServicesScreen(),
    AddNewArea(),
    AllProvidersLayout(),
    AllCategoriesLayout(),
    BlockUsersScreen(),
  ];
}
