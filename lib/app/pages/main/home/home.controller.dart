import 'package:Cinepolis/core/routes/pages.dart';
import 'package:Cinepolis/core/values/enviroments.dart';
import 'package:Cinepolis/data/models/entities/dynamic/dynamic_summary.model.dart';
import 'package:Cinepolis/data/models/entities/employees/employee_detail.model.dart';
import 'package:Cinepolis/data/models/entities/employees/user.model.dart';
import 'package:Cinepolis/data/models/entities/movies/movies.model.dart';
import 'package:Cinepolis/data/models/entities/news/news.model.dart';
import 'package:Cinepolis/data/models/entities/promotions/promotions.model.dart';
import 'package:Cinepolis/data/models/entities/quizzer/quizz_branch_visited.model.dart';
import 'package:Cinepolis/data/services/auth/auth.contract.dart';
import 'package:Cinepolis/data/services/movies/movies.contract.dart';
import 'package:Cinepolis/data/services/promotions/promotions.contract.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late final IAuthService _service;
  late final IMoviesService _moviesService;
  late final IPromotionsService _promotionsService;

  var user = User.fromVoid().obs;
  var movies = <MoviesModel>[].obs;
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
      Get.offAllNamed(Routes.LOGIN);
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
    Get.toNamed(Routes.PROFILE);
  }
}
