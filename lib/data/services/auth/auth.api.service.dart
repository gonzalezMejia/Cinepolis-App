import 'dart:convert';
import 'package:cinepolis/app/utils/msg.utils.dart';
import 'package:cinepolis/app/utils/storage.utils.dart';
import 'package:cinepolis/core/values/enviroments.dart';
import 'package:cinepolis/core/values/globals.dart';
import 'package:cinepolis/data/models/entities/users/user.model.dart';
import 'package:cinepolis/data/models/enums/request_method.enum.dart';
import 'package:cinepolis/data/services/auth/auth.contract.dart';
import 'package:cinepolis/data/services/base.service.dart';

class AuthApiService extends BaseService implements IAuthService {
  final String _reclutamientoUrl = Environments.recruitmentUrl;

  @override
  Future<User> singIn(String username, String password) async {
try{
      var user=User(pass: password,email: username,age: 0,id: 0,genero: ".",name: ".",fAdmission:".",photo:".",secondName: ".",telephone: 0);
      Map<String, dynamic> invoiceJson = user.toJson();
      String body = jsonEncode(invoiceJson);

      var userJson = await provider.request<User>(
          RequestMethod.post, "${_reclutamientoUrl}api/auth/token",
          useDefaultUrl: false, body: body);

      var userResponse= User.fromJson(userJson);

     LocalStorageUtils.setStringKey(Globals.tokenKey, userResponse.id.toString());   // Save token in local storage
      return userResponse;}
    catch(e){
      print(e.toString());
      return SnackUtils.error("Correo o contraseña invalido", "Error");
    }
  }

  @override
  Future<User?> checkUser() async {
    try{
    var userJson = await LocalStorageUtils.getStringByKey(Globals.tokenKey);
    print(userJson);

      var user = await provider.request<User>(    // Get User Value
        RequestMethod.get, '${_reclutamientoUrl}api/auth/byId/$userJson',
        useDefaultUrl: false);
      return User.fromJson(user);
    }catch(e){
      return User.fromVoid();
    }
  }
}
