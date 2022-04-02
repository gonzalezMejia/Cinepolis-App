import 'package:Cinepolis/core/routes/pages.dart';
import 'package:Cinepolis/core/values/enviroments.dart';
import 'package:Cinepolis/core/values/globals.dart';
import 'package:Cinepolis/data/models/entities/dynamic/dynamic_summary.model.dart';
import 'package:Cinepolis/data/models/entities/employees/employee_detail.model.dart';
import 'package:Cinepolis/data/models/entities/employees/user.model.dart';
import 'package:Cinepolis/data/models/entities/news/news.model.dart';
import 'package:Cinepolis/data/models/entities/quizzer/quizz_branch_visited.model.dart';
import 'package:Cinepolis/data/services/auth/auth.contract.dart';
import 'package:Cinepolis/data/services/employees/employees.contract.dart';
import 'package:Cinepolis/data/services/news/news.contract.dart';
import 'package:Cinepolis/data/services/quizzer/quizzers.service.contract.dart';
import 'package:Cinepolis/data/services/summary/summary.contract.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late final IAuthService _service;
  late final IEmployeeService _employeeService;
  late final ISummaryService _summaryService;
  late final INewsService _newsService;
  late final IQuizzerService _quizzerService;

  var user = User.fromVoid().obs;
  var profile = <EmployeeDetail>[].obs;
  var genero = ''.obs;
  var puesto = ''.obs;
  var notification = '5'.obs;
  var summary = <DynamicSummary>[].obs;
  final String imagesUrl = Environments.IMAGES_URL;
  var news = <NewsModel>[].obs;
  var branchesVisited = <BranchesVisited>[].obs;
  int selectedBranchId = 0;
  var loading = false.obs;
  var summaryLoading = false.obs;

  HomeController(this._service, this._employeeService, this._summaryService,
      this._newsService, this._quizzerService);

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
      await _currentProfile(int.tryParse(user.value.code) ?? 0);
      //Noticias
      news.value =
          await _newsService.getAllByBranch(Globals.CORPORATIVO_BRANCH);
      //Branch Visited
      branchesVisited.value = await _quizzerService.getBranchesVisited();
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  _currentProfile(int id) async {
    await _employeeService.getProfile(id).onError((error, stackTrace) {
      var e;
      Get.offAllNamed(Routes.LOGIN);
      return e;
    }).then((value) {
      profile.value = value;
      puesto.value = profile.first.puesto;
    });
  }

  changeBranch(int? branch) async {
    if (branch == null) return;
    selectedBranchId = branch;
    summaryLoading.value = true;
    summary.value = await _summaryService.getSummary(selectedBranchId);
    summaryLoading.value = false;
  }

  dateNow() {
    DateFormat formatter = DateFormat('dd-MM-yyyy');
    var date = formatter.format(DateTime.now());
    return date;
  }

  goToProfile() {
    Get.toNamed(Routes.PROFILE);
  }
}
