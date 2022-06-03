import 'package:cinepolis/app/pages/billboard/billboard.page.dart';
import 'package:cinepolis/app/pages/candy_store/candy_store.page.dart';
import 'package:cinepolis/app/pages/main/home/home.page.dart';
import 'package:cinepolis/app/pages/profile/profile.page.dart';
import 'package:cinepolis/app/pages/shopping_card/shopping-card.page.dart';
import 'package:cinepolis/app/utils/msg.utils.dart';
import 'package:cinepolis/app/utils/sign_out.utils.dart';
import 'package:cinepolis/core/values/enviroments.dart';
import 'package:cinepolis/data/models/core/tab_item.dart';
import 'package:cinepolis/data/services/auth/auth.contract.dart';
import 'package:cinepolis/data/services/shopping_cart/shopping_card.contract.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  late final IAuthService _service;
  late final IShoppingCardService _shoppingCardService;

  static const String imagesUrl = Environments.imageUrl;
  var count= 0.obs;
  var loading = true.obs;

  final zoomDrawerController = ZoomDrawerController().obs;

  List<TabItem> navigationItems = [];

  MainController(this._service,this._shoppingCardService);

  @override
  void onInit() async {
    super.onInit();

    navigationItems = [
      TabItem(FontAwesomeIcons.home, const HomePage(), 'Inicio'),
      TabItem(Icons.theaters, const BillboardPage(), 'Cartelera'),
      TabItem(FontAwesomeIcons.hotdog, const CandyStorePage(), 'Dulcería'),
      TabItem(Icons.person, const ProfilePage(), 'Perfil'),
      TabItem(Icons.shopping_cart, const ShoppingCardPage(), 'Carrito'),
    ];

    await _service.checkUser().then((existingUser) async {
      count.value = await _shoppingCardService.getCountShopping(existingUser!.id!);
      loading.value = false;
    }).onError((error, stackTrace) async {
      SignOut();
      return SnackUtils.error(error.toString(), "Error");
    });
  }

}
