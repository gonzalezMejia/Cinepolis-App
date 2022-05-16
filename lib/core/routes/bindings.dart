import 'package:Cinepolis/app/pages/audit/cash_register/cash_register.controller.dart';
import 'package:Cinepolis/app/pages/audit/cash_register/new_archery/new_archery.controller.dart';
import 'package:Cinepolis/app/pages/audit/rotisserie_inventory/inventory_detail/rotisserie_inventory_detail.controller.dart';
import 'package:Cinepolis/app/pages/audit/rotisserie_inventory/inventory_list/rotisserie_inventory.controller.dart';
import 'package:Cinepolis/app/pages/audit/rotisserie_inventory/inventory_new/rotisserie_inventory_new.controller.dart';
import 'package:Cinepolis/app/pages/login/login.controller.dart';
import 'package:Cinepolis/app/pages/login/widgets/recovery.controller.dart';
import 'package:Cinepolis/app/pages/main/home/home.controller.dart';
import 'package:Cinepolis/app/pages/main/main.controller.dart';
import 'package:Cinepolis/app/pages/profile/profile.controller.dart';
import 'package:Cinepolis/app/pages/quizzer/availables/availables.controller.dart';
import 'package:Cinepolis/app/pages/quizzer/availables/quizz/quizz_answers.controller.dart';
import 'package:Cinepolis/app/pages/quizzer/history/history.controller.dart';
import 'package:Cinepolis/app/pages/quizzer/quizzer.controller.dart';
import 'package:Cinepolis/app/pages/splash/splash.controller.dart';
import 'package:Cinepolis/data/services/audit/audit.api.service.dart';
import 'package:Cinepolis/data/services/auth/auth.contract.dart';
import 'package:Cinepolis/data/services/branch/branch.api.service.dart';
import 'package:Cinepolis/data/services/branch/branch.contract.dart';
import 'package:Cinepolis/data/services/employees/employees.contract.dart';
import 'package:Cinepolis/data/services/filemanager/file_manager.contract.dart';
import 'package:Cinepolis/data/services/movies/movies.api.service.dart';
import 'package:Cinepolis/data/services/promotions/promotions.api.service.dart';
import 'package:Cinepolis/data/services/quizzer/quizzers.api.service.dart';
import 'package:Cinepolis/data/services/users/users.contract.dart';
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
  final IUserService userService;
  final IAuthService authService;

  LoginBinding(this.userService, this.authService);

  @override
  void dependencies() {
    Get.lazyPut(() => RecoveryPasswordController(userService));
    Get.lazyPut<LoginController>(() => LoginController(authService));
  }
}

class MainBinding implements Bindings {
  final IAuthService authService;
  final IEmployeeService employeeService;

  MainBinding(this.authService, this.employeeService);

  @override
  void dependencies() {
    Get.lazyPut(
        () => MainController(authService, employeeService));
    Get.lazyPut(() => HomeController(
        authService, MoviesApiService(), PromotionsApiService()));
  }
}

class ProfileBinding implements Bindings {
  final IAuthService authService;
  final IEmployeeService employeeService;

  ProfileBinding(this.authService, this.employeeService);

  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
        () => ProfileController(authService, employeeService));
  }
}

class CashRegistersBinding implements Bindings {
  IBranchService _branchService;
  CashRegistersBinding(this._branchService);

  @override
  void dependencies() {
    Get.lazyPut<CashRegisterController>(
        () => CashRegisterController(AuditApiService(), _branchService));
  }
}

class RotisserieInventoryBinding implements Bindings {
  IBranchService _branchService;
  RotisserieInventoryBinding(this._branchService);

  @override
  void dependencies() {
    Get.lazyPut<RotisserieInventoryController>(
        () => RotisserieInventoryController(_branchService, AuditApiService()));
  }
}

class RotisserieInventoryDetailBinding implements Bindings {
  RotisserieInventoryDetailBinding();

  @override
  void dependencies() {
    Get.lazyPut<RotisserieInventoryDetailController>(
        () => RotisserieInventoryDetailController(AuditApiService()));
  }
}

class RotisserieInventoryNewBinding implements Bindings {
  IFileManagerService _fileManagerService;
  RotisserieInventoryNewBinding(this._fileManagerService);

  @override
  void dependencies() {
    Get.lazyPut<RotisserieInventoryNewController>(() =>
        RotisserieInventoryNewController(
            _fileManagerService, AuditApiService()));
  }
}

class NewArcheryBinding implements Bindings {
  //NewArcheryBinding();
  @override
  void dependencies() {
    Get.lazyPut<NewArcheryController>(
        () => NewArcheryController(AuditApiService(), BranchApiService()));
  }
}

class QuizzerBinding implements Bindings {
  final IFileManagerService fileManagerService;
  QuizzerBinding(this.fileManagerService);

  @override
  void dependencies() {
    Get.lazyPut<QuizzerController>(() => QuizzerController());
    Get.lazyPut<QuizzerAnswersController>(
        () => QuizzerAnswersController(QuizzersService(), fileManagerService));
    Get.lazyPut<QuizzerAvailableController>(
        () => QuizzerAvailableController(QuizzersService()));
    Get.lazyPut<QuizzerHistoryController>(
        () => QuizzerHistoryController(QuizzersService()));
  }
}
