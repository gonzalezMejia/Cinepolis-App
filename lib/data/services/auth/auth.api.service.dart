import 'dart:convert';
import 'package:cinepolis/app/utils/msg.utils.dart';
import 'package:cinepolis/app/utils/storage.utils.dart';
import 'package:cinepolis/core/values/enviroments.dart';
import 'package:cinepolis/core/values/globals.dart';
import 'package:cinepolis/data/models/entities/token/token_response.model.dart';
import 'package:cinepolis/data/models/entities/users/user.model.dart';
import 'package:cinepolis/data/models/enums/request_method.enum.dart';
import 'package:cinepolis/data/services/auth/auth.contract.dart';
import 'package:cinepolis/data/services/base.service.dart';

class AuthApiService extends BaseService implements IAuthService {
  final String ssoUrl = Environments.ssoUrl;

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
      LocalStorageUtils.setStringKey(Globals.tokenKey,
          TokenResponse.fromJson(jsonTokenResponse).accessToken);

      // Get User Value
      var userJson = await provider.request<User>(
          RequestMethod.get, '$ssoUrl/api/values',
          useDefaultUrl: false);

      LocalStorageUtils.setStringKey(
          Globals.currentUserKey, jsonEncode(userJson));

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
        await LocalStorageUtils.getStringByKey(Globals.currentUserKey);
    if (userJson.isEmpty) {
      return null;
    } else {
      return User.fromJson(json.decode(userJson));
    }
  }
}
