
import 'package:Cinepolis/app/utils/storage.utils.dart';
import 'package:Cinepolis/app/widgets/menu/audit/menu_audit.page.dart';
import 'package:Cinepolis/core/common/base_controller.dart';
import 'package:Cinepolis/core/routes/pages.dart';
import 'package:Cinepolis/core/values/enviroments.dart';
import 'package:Cinepolis/core/values/globals.dart';
import 'package:Cinepolis/data/models/entities/dynamic/dynamic_response.model.dart';
import 'package:Cinepolis/data/models/entities/employees/employee_detail.model.dart';
import 'package:Cinepolis/data/models/entities/employees/user.model.dart';
import 'package:Cinepolis/data/models/entities/menu/menu.model.dart';
import 'package:Cinepolis/data/models/entities/menu/menu_access.model.dart';
import 'package:Cinepolis/data/models/entities/menu/menu_item.model.dart';
import 'package:Cinepolis/data/services/auth/auth.contract.dart';
import 'package:Cinepolis/data/services/employees/employees.contract.dart';
import 'package:Cinepolis/data/services/menu/menu.contract.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class MainController extends BaseController {
  late final IAuthService _service;
  late final IEmployeeService _employeeService;
  late final IMenuService _menuService;

  static const String imagesUrl = Environments.IMAGES_URL;
  var profile = <EmployeeDetail>[].obs;
  Rx<User> userV = User.fromVoid().obs;
  var response = DynamicResponse.fromVoid().obs;
  var menu = <Menu>[].obs;

  var loading = true.obs;

  final zoomDrawerController = ZoomDrawerController().obs;

  var menuItems = <MenuItemMod>[];
  var menuAccess = <AccessMenu>[].obs;

  MainController(this._service, this._employeeService, this._menuService);

  @override
  void onInit() async {
    super.onInit();
    var existingUser = await _service.checkUser();
    userV.value = existingUser!;
    var employee =
        await _employeeService.getProfile(int.tryParse(userV.value.code) ?? 0);
    profile.value = employee;
    loading.value = false;
  }

  actionDrawer() {
    if (zoomDrawerController().isOpen!.call()) {
      zoomDrawerController().close!.call();
    } else {
      zoomDrawerController().toggle!.call();
    }
  }

  goToProfile() {
    Get.toNamed(Routes.PROFILE);
  }

  singOut() {
    Get.offNamedUntil(Routes.LOGIN, ModalRoute.withName(Routes.LOGIN));
    LocalStorageUtils.setStringKey(Globals.CURRENT_USER_KEY, "");
    LocalStorageUtils.setStringKey(Globals.TOKEN_KEY, "");
  }
}
