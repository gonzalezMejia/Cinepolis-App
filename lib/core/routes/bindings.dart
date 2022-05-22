import 'package:cinepolis/app/pages/billboard/billboard.controller.dart';
import 'package:cinepolis/app/pages/candy_store/candy_store.controller.dart';
import 'package:cinepolis/app/pages/login/login.controller.dart';
import 'package:cinepolis/app/pages/main/home/home.controller.dart';
import 'package:cinepolis/app/pages/main/main.controller.dart';
import 'package:cinepolis/app/pages/profile/profile.controller.dart';
import 'package:cinepolis/app/pages/splash/splash.controller.dart';
import 'package:cinepolis/data/services/auth/auth.contract.dart';
import 'package:cinepolis/data/services/employees/user.contract.dart';
import 'package:cinepolis/data/services/movies/movies.api.service.dart';
import 'package:cinepolis/data/services/products/products.api.service.dart';
import 'package:cinepolis/data/services/promotions/promotions.api.service.dart';
import 'package:get/get.dart';

class SplashBinding implements Bindings {
  final IAuthService authService;
  SplashBinding(this.authService);
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController(authService));
  }
}

class LoginBinding implements Bindings {
  final IAuthService authService;

  LoginBinding(this.authService);

  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(authService));
  }
}

class MainBinding implements Bindings {
  final IAuthService authService;
  final IUserService employeeService;

  MainBinding(this.authService, this.employeeService);

  @override
  void dependencies() {
    Get.lazyPut(() => MainController(authService, employeeService));
    Get.lazyPut(() => HomeController(
        authService, MoviesApiService(), PromotionsApiService()));
    Get.lazyPut<ProfileController>(
        () => ProfileController(authService, employeeService));
    Get.lazyPut<BillBoardController>(
        () => BillBoardController(MoviesApiService()));
    //Get.lazyPut<CandyStoreController>(() => CandyStoreController());

    Get.lazyPut(() => MainController(authService, employeeService));
    Get.lazyPut(() => HomeController(
        authService, MoviesApiService(), PromotionsApiService()));
    Get.lazyPut<ProfileController>(
        () => ProfileController(authService, employeeService));
    //Get.lazyPut<BillBoardController>(() => BillBoardController());
    Get.lazyPut<CandyStoreController>(
        () => CandyStoreController(ProductsApiService()));
  }
}
