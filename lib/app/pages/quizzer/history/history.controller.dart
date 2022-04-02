import 'package:Cinepolis/app/utils/msg.utils.dart';
import 'package:Cinepolis/core/routes/pages.dart';
import 'package:Cinepolis/core/values/globals.dart';
import 'package:Cinepolis/data/models/entities/quizzer/quizz_history.model.dart';
import 'package:Cinepolis/data/models/entities/quizzer/quizz_summary.model.dart';
import 'package:Cinepolis/data/models/enums/paginate_direction.enum.dart';
import 'package:Cinepolis/data/services/quizzer/quizzers.service.contract.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class QuizzerHistoryController extends GetxController {
  final IQuizzerService _service;

  var quizzes = <QuizHistory>[].obs;
  var quizzesSummary = <QuizzSummary>[].obs;

  var loading = false.obs;
  var loadingSummary = false.obs;

  static const int pageSize = Globals.MAX_PAG;
  var _totalCount = 0;
  var offset = 0.obs;
  var nextVisible = true.obs;

  QuizzerHistoryController(this._service);

  @override
  void onInit() {
    getHistory();
    super.onInit();
  }

  getHistory({int init = 0, int max = 50}) async {
    loading.value = true;
    quizzes.value = await _service.getHistory(init, max, "");
    loading.value = false;
    _totalCount = quizzes.length;
    nextVisible.value = 10 <= _totalCount;
  }

  getSummary(String campaingId) async {
    loadingSummary.value = true;
    quizzesSummary.value = await _service.getSummary(campaingId);
    loadingSummary.value = false;
  }

  resumeSummary(QuizHistory quizz) async {
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    DateTime nowDate = new DateTime.now();
    var date1 = nowDate;
    var date2 = formatter.format(quizz.validEndDate);
    final diffSecond = date1.difference(DateTime.parse(date2)).inSeconds;
    final diffhours = date1.difference(DateTime.parse(date2)).inHours;

    if (diffSecond >= 1) {
      await _service
          .incompleteQuizzer(quizz.userCampaignId.toString())
          .then((value) {
        getHistory();
        SnackUtils.error(
            "La encuesta expiró hace $diffhours horas", "Advertencia");
      });
    } else {
      Get.toNamed(
          '${Routes.QUIZZER_ANSWER}?campaingid=${quizz.userCampaignId.toString()}');
    }
  }

  paginated(PaginateDirection direction) async {
    if (direction == PaginateDirection.next) if (quizzes.length > 0) {
      offset.value += pageSize;
      getHistory(init: offset.value, max: pageSize);
      if (quizzes.length == 0) {
        SnackUtils.error('No hay mas datos a mostrar', 'Advertencia');
      }
    } else {
      SnackUtils.error('No hay mas datos a mostrar', 'Advertencia');
    }
    else {
      offset.value -= pageSize;
      getHistory(init: offset.value, max: pageSize);
    }
  }
}
