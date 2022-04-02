import 'package:Cinepolis/core/values/enviroments.dart';
import 'package:Cinepolis/data/models/entities/branches/branch.model.dart';
import 'package:Cinepolis/data/models/entities/branches/branch_minified.model.dart';
import 'package:Cinepolis/data/models/enums/request_method.enum.dart';
import 'package:Cinepolis/data/services/base.service.dart';
import 'package:Cinepolis/data/services/branch/branch.contract.dart';

class BranchApiService extends BaseService implements IBranchService {
  final String thunderUrl = Environments.THUNDERA_URL;

  @override
  Future<List<Branch?>> getAll() async {
    var userJson = await provider.request<Branch?>(
        RequestMethod.get, "${thunderUrl}api/sucursales/GetSucursales",
        useDefaultUrl: false);
    return List<Branch?>.from(userJson.map((x) => Branch.fromJson(x)));
  }

  @override
  Future<List<Branch?>> getAllByBranch(var search) async {
    var userJson = await provider.request<Branch?>(
        RequestMethod.get, "${thunderUrl}api/sucursales/GetSucursales",
        useDefaultUrl: false);

    var list = List<Branch?>.from(userJson.map((x) => Branch.fromJson(x)));

    list.sort((a, b) => a!.idUnidadOperativa.compareTo(b!.idUnidadOperativa));

    return list.map((json) => Branch.fromJson(json!.toJson())).where((prod) {
      final listBranch = prod.idUnidadOperativa;
      final searchBranch = search;
      return listBranch.toString().contains(searchBranch.toString());
    }).toList();
  }

  @override
  Future<List<BranchMinified>> getByEmployee(int employeeId) async {
    var userJson = await provider.request<BranchMinified>(
        RequestMethod.get, "${thunderUrl}api/Employees/$employeeId/branches",
        useDefaultUrl: false);
    return List<BranchMinified>.from(
        userJson.map((x) => BranchMinified.fromJson(x)));
  }

  @override
  Future<Branch> getById(int id) async {
    var userJson = await provider.request<Branch>(
        RequestMethod.get, "${thunderUrl}api/sucursales/$id/detail",
        useDefaultUrl: false);
    return Branch.fromJson(userJson);
  }
}
