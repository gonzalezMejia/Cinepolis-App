import 'package:Cinepolis/core/values/enviroments.dart';
import 'package:Cinepolis/data/models/enums/request_method.enum.dart';
import 'package:Cinepolis/data/services/base.service.dart';
import 'package:Cinepolis/data/services/users/users.contract.dart';

class UserApiService extends BaseService implements IUserService {
  final String ssoUrl = Environments.SSO_URL;

  @override
  Future recoveryPassword(String email) async {
    return await provider.request(
        RequestMethod.patch, "$ssoUrl/api/users/password/reset",
        useDefaultUrl: false, body: '{"Email":"$email"}');
  }
}
