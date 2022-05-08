import 'package:Cinepolis/data/models/entities/movies/movies.model.dart';

abstract class IMoviesService {
  Future<List<MoviesModel>> getMovies();

}
