import 'package:cinepolis/app/pages/billboard/billboard.controller.dart';
import 'package:cinepolis/app/pages/billboard/detail/movie_detail.controller.dart';
import 'package:cinepolis/app/pages/candy_store/candy_store.controller.dart';
import 'package:cinepolis/app/pages/login/login.controller.dart';
import 'package:cinepolis/app/pages/main/home/home.controller.dart';
import 'package:cinepolis/app/pages/main/main.controller.dart';
import 'package:cinepolis/app/pages/payment/payment.controller.dart';
import 'package:cinepolis/app/pages/profile/profile.controller.dart';
import 'package:cinepolis/app/pages/shopping_card/shopping-card.controller.dart';
import 'package:cinepolis/app/pages/splash/splash.controller.dart';
import 'package:cinepolis/data/services/auth/auth.contract.dart';
import 'package:cinepolis/data/services/filemanager/file_manager.contract.dart';
import 'package:cinepolis/data/services/movies/movies.api.service.dart';
import 'package:cinepolis/data/services/products/products.api.service.dart';
import 'package:cinepolis/data/services/shopping_cart/shopping_card.api.service.dart';
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
  final IFileManagerService fileManagerService;

  LoginBinding(this.authService,this.fileManagerService);

  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(authService,fileManagerService));
  }
}

class MainBinding implements Bindings {
  final IAuthService authService;

  MainBinding(this.authService);

  @override
  void dependencies() {
    Get.lazyPut(() => MainController(authService,ShoppingCardApiService()));
    Get.lazyPut(() => HomeController(authService, MoviesApiService(), ProductsApiService()));
    Get.lazyPut<ProfileController>(() => ProfileController(authService));
    Get.lazyPut<BillBoardController>(() => BillBoardController(MoviesApiService()));
    Get.lazyPut<CandyStoreController>(() => CandyStoreController(ProductsApiService()));
    Get.lazyPut<ShoppingCardController>(() => ShoppingCardController(authService,ShoppingCardApiService()));
  }
}

class MovieDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieDetailController>(() => MovieDetailController(MoviesApiService()));
  }
}

class PaymentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentController>(() => PaymentController());
  }
}

