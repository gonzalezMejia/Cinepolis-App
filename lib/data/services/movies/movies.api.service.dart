import 'package:cinepolis/core/values/enviroments.dart';
import 'package:cinepolis/data/models/entities/movies/movies.model.dart';
import 'package:cinepolis/data/models/enums/request_method.enum.dart';
import 'package:cinepolis/data/services/movies/movies.contract.dart';
import '../base.service.dart';

class MoviesApiService extends BaseService implements IMoviesService {
  final String _recruitmentUrl = Environments.recruitmentUrl;

  @override
  Future<List<MoviesModel>> getMovies() async {
    var userJson = await provider.request<MoviesModel>(
        RequestMethod.get, "${_recruitmentUrl}api/cinepolis/movies",
        useDefaultUrl: false);
    return List<MoviesModel>.from(userJson.map((x) => MoviesModel.fromJson(x)));
  }
}
