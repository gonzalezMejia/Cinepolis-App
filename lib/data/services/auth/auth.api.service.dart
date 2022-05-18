import 'dart:convert';
import 'package:Cinepolis/app/utils/msg.utils.dart';
import 'package:Cinepolis/app/utils/storage.utils.dart';
import 'package:Cinepolis/core/values/enviroments.dart';
import 'package:Cinepolis/core/values/globals.dart';
import 'package:Cinepolis/data/models/entities/token/token_response.model.dart';
import 'package:Cinepolis/data/models/entities/users/user.model.dart';
import 'package:Cinepolis/data/models/enums/request_method.enum.dart';
import 'package:Cinepolis/data/services/auth/auth.contract.dart';
import 'package:Cinepolis/data/services/base.service.dart';


class AuthApiService extends BaseService implements IAuthService {
  final String ssoUrl = Environments.SSO_URL;

  @override
  Future<User?> singIn(String username, String password) async {
    try {
      // Send Token
      var jsonTokenResponse = await provider.request<TokenResponse>(
          RequestMethod.post, '$ssoUrl/OAuth/Token',
          useDefaultUrl: false,
          body:
              'username=$username&password=$password&grant_type=password&scope=pTUOcr01wJjbFTdRBDmRcA==');

      // Save token in local storage
      LocalStorageUtils.setStringKey(Globals.TOKEN_KEY,
          TokenResponse.fromJson(jsonTokenResponse).accessToken);

      // Get User Value
      var userJson = await provider.request<User>(
          RequestMethod.get, '$ssoUrl/api/values',
          useDefaultUrl: false);

      LocalStorageUtils.setStringKey(
          Globals.CURRENT_USER_KEY, jsonEncode(userJson));

      return User.fromJson(userJson);
    } catch (e) {
      SnackUtils.error('Nombre de usuario y/o contraseña incorrecto.',
          'Credenciales Incorrectas');
      return null;
    }
  }

  @override
  Future<User?> checkUser() async {
    var userJson =
        await LocalStorageUtils.getStringByKey(Globals.CURRENT_USER_KEY);
    if (userJson.isEmpty)
      return null;
    else
      return User.fromJson(json.decode(userJson));
  }
}
