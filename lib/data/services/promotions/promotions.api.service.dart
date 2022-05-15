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
/*
  @override
  Future<List<EmployeeDetail>> getProfile(int id) async {
    var userJson = await provider.request<EmployeeDetail>(
        RequestMethod.get, "${cheetaraUrl}api/Empleados/$id/detailbynumber",
        useDefaultUrl: false);
    return List<EmployeeDetail>.from(
        userJson.map((x) => EmployeeDetail.fromJson(x)));
  }

  @override
  Future<List<Employee2>> getByBranchAndPosition(
      int branchId, int positionId) async {
    var userJson = await provider.request<Employee2>(RequestMethod.get,
        "${cheetaraUrl}api/Empleados/branch/$branchId/position/$positionId",
        useDefaultUrl: false);
    return List<Employee2>.from(userJson.map((x) => Employee2.fromJson(x)));
  }

  @override
  Future<EmployeeRewardCode?> generateCode() async {
    var userJson = await provider.request<EmployeeRewardCode>(
        RequestMethod.get, "${cheetaraUrl}api/EmployeeRewards/code",
        useDefaultUrl: false);
    if (userJson == null) {
      return null;
    } else {
      return EmployeeRewardCode.fromJson(userJson);
    }
  }

  @override
  Future<List<AccessEmployee>> typeAccessEmployee() async {
    var userJson = await provider.request<AccessEmployee>(
        RequestMethod.get, "${maintenanceUrl}api/Access/current",
        useDefaultUrl: false);
    return List<AccessEmployee>.from(
        userJson.map((x) => AccessEmployee.fromJson(x)));
  }*/
}
