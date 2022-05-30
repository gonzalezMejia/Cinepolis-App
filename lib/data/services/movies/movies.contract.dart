import 'package:cinepolis/data/models/entities/movies/locations_available.model.dart';
import 'package:cinepolis/data/models/entities/movies/movies.model.dart';

abstract class IMoviesService {
  Future<List<MoviesModel>> getSummaryMovies();
  Future<List<MoviesModel>> getMovies();
  Future<List<LocationsAvailableModel>> getLocationsAvailable(int movieId);
}
