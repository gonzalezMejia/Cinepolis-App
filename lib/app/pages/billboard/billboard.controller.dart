import 'package:Cinepolis/core/routes/pages.dart';
import 'package:Cinepolis/data/models/entities/movies/movies.model.dart';
import 'package:Cinepolis/data/services/movies/movies.contract.dart';
import 'package:get/get.dart';

class BillBoardController extends GetxController {
  BillBoardController(this._moviesService);

  late final IMoviesService _moviesService;
  var movies = <MoviesModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
  }

  _init() async {
    movies.value = await _moviesService.getMovies();
  }
}
