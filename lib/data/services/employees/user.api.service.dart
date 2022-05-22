import 'package:cinepolis/core/values/enviroments.dart';
import 'package:cinepolis/data/models/entities/users/user_detail.model.dart';
import 'package:cinepolis/data/models/enums/request_method.enum.dart';
import 'package:cinepolis/data/services/employees/user.contract.dart';

import '../base.service.dart';

class UserApiService extends BaseService implements IUserService {
  final String cheetaraUrl = Environments.cheetaraUrl;

  @override
  Future<List<UserDetail>> getProfile(int id) async {
    var userJson = await provider.request<UserDetail>(
        RequestMethod.get, "${cheetaraUrl}api/Empleados/$id/detailbynumber",
        useDefaultUrl: false);
    return List<UserDetail>.from(userJson.map((x) => UserDetail.fromJson(x)));
  }
}
