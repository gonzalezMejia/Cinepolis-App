import 'package:cinepolis/app/pages/billboard/detail/movie_detail.page.dart';
import 'package:cinepolis/app/pages/billboard/seating/select_seat.page.dart';
import 'package:cinepolis/app/pages/login/login.page.dart';
import 'package:cinepolis/app/pages/main/main.page.dart';
import 'package:cinepolis/app/pages/payment/payment.page.dart';
import 'package:cinepolis/app/pages/splash/splash.page.dart';
import 'package:cinepolis/core/routes/bindings.dart';
import 'package:cinepolis/data/services/auth/auth.api.service.dart';
import 'package:cinepolis/data/services/filemanager/file_manager.api.service.dart';
import 'package:get/get.dart';

part 'routes.dart';

abstract class Pages {
  static final authService = AuthApiService();
  static final fileManagerService = FileManagerApiService();

  static final pages = [
    GetPage(
        name: Routes.splash,
        page: () => const SplashPage(),
        binding: SplashBinding(authService)),
    GetPage(
        name: Routes.login,
        page: () => const LoginPage(),
        binding: LoginBinding(authService,fileManagerService)),
    GetPage(
        name: Routes.main,
        page: () => const MainPage(),
        binding: MainBinding(authService)),
    GetPage(
        name: Routes.movieDetail,
        page: () => const MovieDetailDetailPage(),
        binding: MovieDetailBinding()),
    GetPage(
        name: Routes.payment,
        page: () => const PaymentPage(),
        binding: PaymentBinding()),
    GetPage(
        name: Routes.seating,
        page: () => const SelectSeatPage(),
        binding: SeatingBinding(authService))
  ];
}
