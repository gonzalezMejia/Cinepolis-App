import 'package:Cinepolis/app/pages/audit/cash_register/cash_register.page.dart';
import 'package:Cinepolis/app/pages/audit/cash_register/new_archery/new_archery.page.dart';
import 'package:Cinepolis/app/pages/audit/rotisserie_inventory/inventory_detail/rotisserie_inventory_detail.page.dart';
import 'package:Cinepolis/app/pages/audit/rotisserie_inventory/inventory_list/rotisserie_inventory.page.dart';
import 'package:Cinepolis/app/pages/audit/rotisserie_inventory/inventory_new/rotisserie_inventory_new.page.dart';
import 'package:Cinepolis/app/pages/login/login.page.dart';
import 'package:Cinepolis/app/pages/main/main.page.dart';
import 'package:Cinepolis/app/pages/profile/profile.page.dart';
import 'package:Cinepolis/app/pages/quizzer/availables/quizz/quizz_answers.page.dart';
import 'package:Cinepolis/app/pages/quizzer/quizzer.page.dart';
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
        binding: LoginBinding(userService, authService)),
    GetPage(
        name: Routes.MAIN,
        page: () => const MainPage(),
        binding: MainBinding(authService, employeeService)),
    GetPage(
        name: Routes.PROFILE,
        page: () => const ProfilePage(),
        binding: ProfileBinding(authService, employeeService)),
    GetPage(
        name: Routes.CASH_REGISTER,
        page: () => CashRegisterPage(),
        binding: CashRegistersBinding(branchService)),
    GetPage(
        name: Routes.CASH_NEW,
        page: () => NewArcheryPage(),
        binding: NewArcheryBinding()),
    GetPage(
        name: Routes.ROTISSERIE_INVENTORY,
        page: () => RotisserieInventoryPage(),
        binding: RotisserieInventoryBinding(branchService)),
    GetPage(
        name: Routes.ROTISSERIE_INVENTORY_DETAIL,
        page: () => RotisserieInventoryDetailPage(),
        binding: RotisserieInventoryDetailBinding()),
    GetPage(
        name: Routes.ROTISSERIE_INVENTORY_NEW,
        page: () => const RotisserieInventoryNewPage(),
        binding: RotisserieInventoryNewBinding(fileManagerService)),
    GetPage(
        name: Routes.QUIZZER,
        page: () => QuizzerPage(),
        binding: QuizzerBinding(fileManagerService)),
    GetPage(
        name: Routes.QUIZZER_ANSWER,
        page: () => QuizzerAnswersPage(),
        binding: QuizzerBinding(fileManagerService)),
  ];
}
