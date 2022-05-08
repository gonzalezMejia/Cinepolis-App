import 'package:Cinepolis/core/values/enviroments.dart';
import 'package:Cinepolis/data/models/entities/movies/movies.model.dart';
import 'package:Cinepolis/data/models/enums/request_method.enum.dart';
import 'package:Cinepolis/data/services/movies/movies.contract.dart';
import '../base.service.dart';

class MoviesApiService extends BaseService implements IMoviesService {
  final String _recruitmentUrl = Environments.RECRUITMENT_URL;

  @override
  Future<List<MoviesModel>> getMovies() async{
    var userJson = await provider.request<MoviesModel>(
        RequestMethod.get, "${_recruitmentUrl}api/cinepolis/movies",
        useDefaultUrl: false);
    return List<MoviesModel>.from(
        userJson.map((x) => MoviesModel.fromJson(x)));
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
