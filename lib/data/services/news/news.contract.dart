import 'package:Cinepolis/data/models/entities/news/news.model.dart';

abstract class INewsService {
  Future<List<NewsModel>> getAllByBranch(var branchId);
}
