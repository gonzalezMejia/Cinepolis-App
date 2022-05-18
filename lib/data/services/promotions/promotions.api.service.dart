import 'package:Cinepolis/core/values/enviroments.dart';
import 'package:Cinepolis/data/models/entities/promotions/promotions.model.dart';
import 'package:Cinepolis/data/models/enums/request_method.enum.dart';
import 'package:Cinepolis/data/services/promotions/promotions.contract.dart';
import '../base.service.dart';

class PromotionsApiService extends BaseService implements IPromotionsService {
  final String _recruitmentUrl = Environments.RECRUITMENT_URL;

  @override
  Future<List<PromotionsModel>> getPromotions() async {
    var userJson = await provider.request<PromotionsModel>(RequestMethod.get,
        "${_recruitmentUrl}api/Cinepolis/promotions", //Aplicacion de postman de ricardo
        useDefaultUrl: false);
    return List<PromotionsModel>.from(
        userJson.map((x) => PromotionsModel.fromJson(x)));
  }
}
