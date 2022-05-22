import 'package:cinepolis/data/models/entities/promotions/promotions.model.dart';

abstract class IPromotionsService {
  Future<List<PromotionsModel>> getPromotions();
}
