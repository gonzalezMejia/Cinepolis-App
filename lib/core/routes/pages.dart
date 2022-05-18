import 'package:Cinepolis/app/pages/login/login.page.dart';
import 'package:Cinepolis/app/pages/main/main.page.dart';
import 'package:Cinepolis/app/pages/splash/splash.page.dart';
import 'package:Cinepolis/core/routes/bindings.dart';
import 'package:Cinepolis/data/services/auth/auth.api.service.dart';
import 'package:Cinepolis/data/services/employees/user.api.service.dart';
import 'package:Cinepolis/data/services/filemanager/file_manager.api.service.dart';
import 'package:get/get.dart';

part 'routes.dart';

abstract class Pages {
  static final authService = AuthApiService();
  static final employeeService = UserApiService();
  static final fileManagerService = FileManagerApiService();

  static final pages = [
    GetPage(
        name: Routes.SPLASH,
        page: () => const SplashPage(),
        binding: SplashBinding(authService)),
    GetPage(
        name: Routes.LOGIN,
        page: () => const LoginPage(),
        binding: LoginBinding(authService)),
    GetPage(
        name: Routes.MAIN,
        page: () => const MainPage(),
        binding: MainBinding(authService, employeeService))
  ];
}
