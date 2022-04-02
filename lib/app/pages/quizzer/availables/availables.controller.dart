import 'package:Cinepolis/app/pages/quizzer/availables/detail/detail.page.dart';
import 'package:Cinepolis/app/utils/msg.utils.dart';
import 'package:Cinepolis/core/routes/pages.dart';
import 'package:Cinepolis/data/models/entities/quizzer/quizz_available.model.dart';
import 'package:Cinepolis/data/models/entities/quizzer/quizz_init.model.dart';
import 'package:Cinepolis/data/services/quizzer/quizzers.service.contract.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class QuizzerAvailableController extends GetxController {
  final IQuizzerService _quizzerService;

  var quizzes = <QuizzAvailable>[].obs;
  var loading = true.obs;
  var value = 1.obs;
  var campaignId = 0.obs;
  var currentBranch = 0.obs;
  var availableBranches = <AvailableBranches>[].obs;
  var currentPosition;

  QuizzerAvailableController(this._quizzerService);

  @override
  void onInit() async {
    quizzes.value = await _quizzerService.getAvailable();
    currentPosition = await _determinePosition();
    loading.value = false;
    super.onInit();
  }

  _availableBranchesMethod() async {
    await _quizzerService.getAvailableBranches(campaignId.value).then((e) {
      availableBranches.value = e;
      currentBranch.value = e.first.id;
    });
  }

  changeBranch(int branch) {
    currentBranch.value = branch;
  }

  startSurvey() async {
    await _quizzerService
        .initQuizzer(new ParamsInitQuizz(
            branchId: currentBranch.value,
            campaignId: campaignId.value,
            latitude: currentPosition.latitude.toString(),
            longitude: currentPosition.longitude.toString()))
        .then((value) => {
              if (value.id != 0)
                {
                  Get.toNamed(
                      '${Routes.QUIZZER_ANSWER}?campaingid=${value.id}?branchId=${currentBranch.value}')
                }
              else
                {
                  SnackUtils.error(
                      'Hubo un error inesperado intentalo nuevamente',
                      'Advertencia')
                }
            });
  }

  msgCancelation() {
    SnackUtils.error("Proceso cancelado...", "Advertencia");
  }

  goToDetail(QuizzAvailable quizz) async {
    campaignId.value = quizz.campaignId;
    await _availableBranchesMethod();
    Get.to(() => QuizzerAvailableDetailPage(quizz));
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.back();
        return SnackUtils.error(
            "Los permisos de ubicación están denegados", "Advertencia");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.back();
      return SnackUtils.error(
          "Los permisos de ubicación se negaron permanentemente, no puedes usar esta función.",
          "Advertencia");
    }

    return await Geolocator.getCurrentPosition();
  }
}
