import 'package:Cinepolis/app/pages/login/login.page.dart';
import 'package:Cinepolis/app/pages/main/main.page.dart';
import 'package:Cinepolis/app/pages/splash/splash.page.dart';
import 'package:Cinepolis/core/routes/bindings.dart';
import 'package:Cinepolis/data/services/auth/auth.api.service.dart';
import 'package:Cinepolis/data/services/branch/branch.api.service.dart';
import 'package:Cinepolis/data/services/employees/employees.api.service.dart';
import 'package:Cinepolis/data/services/filemanager/file_manager.api.service.dart';
import 'package:Cinepolis/data/services/users/users.api.service.dart';
import 'package:get/get.dart';

part 'routes.dart';

abstract class Pages {
  static final authService = AuthApiService();
  static final userService = UserApiService();
  static final branchService = BranchApiService();
  static final employeeService = EmployeesApiService();
  static final fileManagerService = FileManagerApiService();

  static final pages = [
    GetPage(
        name: Routes.SPLASH,
        page: () => const SplashPage(),
        binding: SplashBinding(authService)),
    GetPage(
        name: Routes.LOGIN,
        page: () => const LoginPage(),
        binding: LoginBinding(userService, authService,employeeService)),
    GetPage(
        name: Routes.MAIN,
        page: () => const MainPage(),
        binding: MainBinding(authService, employeeService))
  ];
}
