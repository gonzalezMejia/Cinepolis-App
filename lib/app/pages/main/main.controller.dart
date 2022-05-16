import 'package:Cinepolis/app/pages/main/home/home.page.dart';
import 'package:Cinepolis/app/utils/msg.utils.dart';
import 'package:Cinepolis/app/utils/sign_out.utils.dart';
import 'package:Cinepolis/core/common/base_controller.dart';
import 'package:Cinepolis/core/routes/pages.dart';
import 'package:Cinepolis/core/values/enviroments.dart';
import 'package:Cinepolis/data/models/core/tab_item.dart';
import 'package:Cinepolis/data/models/entities/dynamic/dynamic_response.model.dart';
import 'package:Cinepolis/data/models/entities/employees/employee_detail.model.dart';
import 'package:Cinepolis/data/models/entities/menu/menu.model.dart';
import 'package:Cinepolis/data/models/entities/menu/menu_access.model.dart';
import 'package:Cinepolis/data/models/entities/menu/menu_item.model.dart';
import 'package:Cinepolis/data/services/auth/auth.contract.dart';
import 'package:Cinepolis/data/services/employees/employees.contract.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MainController extends BaseController {
  late final IAuthService _service;
  late final IEmployeeService _employeeService;

  static const String imagesUrl = Environments.IMAGES_URL;
  var profile = <EmployeeDetail>[].obs;
  var response = DynamicResponse.fromVoid().obs;
  var menu = <Menu>[].obs;

  var loading = true.obs;

  final zoomDrawerController = ZoomDrawerController().obs;

  List<TabItem> navigationItems = [];
  var menuItems = <MenuItemMod>[];
  var menuAccess = <AccessMenu>[].obs;

  MainController(this._service, this._employeeService);

  @override
  void onInit() async {
    super.onInit();
    navigationItems = [
      TabItem(FontAwesomeIcons.home, const HomePage(), 'Inicio'),//todo ingresar las nuevas pages aqui
    ];
    await _service.checkUser().then((existingUser) async {
    profile.value = await _employeeService.getProfile(int.tryParse(existingUser!.code) ?? 0);
    loading.value = false;
    }).onError((error, stackTrace) async {
      SignOut();
      return SnackUtils.error(error.toString(), "Error");
    });

  }

  goToProfile() => Get.toNamed(Routes.PROFILE);

}
