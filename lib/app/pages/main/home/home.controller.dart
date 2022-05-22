import 'package:chewie/chewie.dart';
import 'package:cinepolis/app/pages/billboard/detail/detail.page.dart';
import 'package:cinepolis/core/routes/pages.dart';
import 'package:cinepolis/data/models/entities/movies/movies.model.dart';
import 'package:cinepolis/data/models/entities/promotions/promotions.model.dart';
import 'package:cinepolis/data/models/entities/users/user.model.dart';
import 'package:cinepolis/data/models/entities/users/user_detail.model.dart';
import 'package:cinepolis/data/services/auth/auth.contract.dart';
import 'package:cinepolis/data/services/movies/movies.contract.dart';
import 'package:cinepolis/data/services/promotions/promotions.contract.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class HomeController extends GetxController {
  late final IAuthService _service;
  late final IMoviesService _moviesService;
  late final IPromotionsService _promotionsService;

  var user = User.fromVoid().obs;
  var movies = <MoviesModel>[].obs;
  var profile = <UserDetail>[].obs;

  int selectedBranchId = 0;
  var loading = false.obs;
  var summaryLoading = false.obs;
  var promotions = <PromotionsModel>[].obs;

  HomeController(this._service, this._moviesService,
      this._promotionsService); //agragarlo siemppre con una coma

  @override
  void onInit() async {
    super.onInit();
    loading.value = true;
    await _init();
    loading.value = false;
  }

  _init() async {
    var existingUser = await _service.checkUser();
    if (existingUser != null) {
      user.value = existingUser;
      //Noticias
      movies.value = await _moviesService.getMovies();
      promotions.value = await _promotionsService.getPromotions();
    } else {
      Get.offAllNamed(Routes.login);
    }
  }

  changeBranch(int? branch) async {
    if (branch == null) return;
    selectedBranchId = branch;
    summaryLoading.value = true;
    summaryLoading.value = false;
  }

  dateNow() {
    DateFormat formatter = DateFormat('dd-MM-yyyy');
    var date = formatter.format(DateTime.now());
    return date;
  }

  goToProfile() {
    Get.toNamed(Routes.profile);
  }
}
