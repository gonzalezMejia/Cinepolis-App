import 'package:cinepolis/data/models/entities/movies/movies.model.dart';
import 'package:cinepolis/data/services/movies/movies.contract.dart';
import 'package:get/get.dart';

class BillBoardController extends GetxController {
  BillBoardController(this._moviesService);


  final IMoviesService _moviesService;
  var movies = <MoviesModel>[].obs;
  var loading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    loading.value = true;
    movies.value = await _moviesService.getMovies();
    loading.value = false;
  }

}
