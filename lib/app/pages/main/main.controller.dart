import 'package:Cinepolis/app/pages/billboard/billboard.page.dart';
import 'package:Cinepolis/app/pages/candy_store/candy_store.page.dart';
import 'package:Cinepolis/app/pages/main/home/home.page.dart';
import 'package:Cinepolis/app/pages/profile/profile.page.dart';
import 'package:Cinepolis/app/utils/msg.utils.dart';
import 'package:Cinepolis/app/utils/sign_out.utils.dart';
import 'package:Cinepolis/core/routes/pages.dart';
import 'package:Cinepolis/core/values/enviroments.dart';
import 'package:Cinepolis/data/models/core/tab_item.dart';
import 'package:Cinepolis/data/models/entities/dynamic/dynamic_response.model.dart';
import 'package:Cinepolis/data/models/entities/users/user_detail.model.dart';
import 'package:Cinepolis/data/services/auth/auth.contract.dart';
import 'package:Cinepolis/data/services/employees/user.contract.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  late final IAuthService _service;
  late final IUserService _employeeService;

  static const String imagesUrl = Environments.IMAGES_URL;
  var profile = <UserDetail>[].obs;
  var response = DynamicResponse.fromVoid().obs;

  var loading = true.obs;

  final zoomDrawerController = ZoomDrawerController().obs;

  List<TabItem> navigationItems = [];

  MainController(this._service, this._employeeService);

  @override
  void onInit() async {
    super.onInit();
    navigationItems = [
      TabItem(Icons.person, const ProfilePage(), 'Perfil'),
      TabItem(FontAwesomeIcons.home, const HomePage(), 'Inicio'),//todo ingresar las nuevas pages aqui
      TabItem(FontAwesomeIcons.hotdog, const CandyStorePage(), 'Dulcería'),
      TabItem(Icons.theaters, const BillboardPage(), 'Cartelera'),
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
