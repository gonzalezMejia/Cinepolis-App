import 'package:Cinepolis/core/values/enviroments.dart';
import 'package:Cinepolis/data/models/entities/users/user_detail.model.dart';
import 'package:Cinepolis/data/models/enums/request_method.enum.dart';
import 'package:Cinepolis/data/services/employees/user.contract.dart';

import '../base.service.dart';

class UserApiService extends BaseService implements IUserService {
  final String cheetaraUrl = Environments.CHEETARA_URL;

  @override
  Future<List<UserDetail>> getProfile(int id) async {
    var userJson = await provider.request<UserDetail>(
        RequestMethod.get, "${cheetaraUrl}api/Empleados/$id/detailbynumber",
        useDefaultUrl: false);
    return List<UserDetail>.from(
        userJson.map((x) => UserDetail.fromJson(x)));
  }
}
