import 'package:Cinepolis/core/values/enviroments.dart';
import 'package:Cinepolis/data/models/entities/news/news.model.dart';
import 'package:Cinepolis/data/models/enums/request_method.enum.dart';
import 'package:Cinepolis/data/services/base.service.dart';
import 'package:Cinepolis/data/services/news/news.contract.dart';

class NewsApiService extends BaseService implements INewsService {
  final String cheetaUrl = Environments.CHEETARA_URL;

  @override
  Future<List<NewsModel>> getAllByBranch(var branchId) async {
    var userJson = await provider.request<NewsModel?>(
        RequestMethod.get, "${cheetaUrl}api/anuncios/ByBranch/$branchId",
        useDefaultUrl: false);
    return List<NewsModel>.from(userJson.map((x) => NewsModel.fromJson(x)));
  }
}
