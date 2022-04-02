import 'package:Cinepolis/core/values/enviroments.dart';
import 'package:Cinepolis/core/values/globals.dart';
import 'package:Cinepolis/data/models/entities/menu/menu.model.dart';
import 'package:Cinepolis/data/models/entities/menu/menu_access.model.dart';
import 'package:Cinepolis/data/models/enums/request_method.enum.dart';
import 'package:Cinepolis/data/services/base.service.dart';

import 'menu.contract.dart';

class MenuApiService extends BaseService implements IMenuService {
  final String ssoUrl = Environments.SSO_URL;
  @override
  Future<Menu> generateMenu(int idEmployee) async {
    var userJson = await provider.request(RequestMethod.get,
        "$ssoUrl/api/grantaccesses/user/$idEmployee/application/${Globals.ID_MENU_APP_PROD}",
        useDefaultUrl: false);

    return Menu.fromJson(userJson);
  }

  @override
  Future<List<AccessMenu>> accessMenu(int idEmployee) async {
    var userJson = await provider.request(
        RequestMethod.get, "$ssoUrl/api/users/$idEmployee/applicationsByType/4",
        useDefaultUrl: false);

    return List<AccessMenu>.from(userJson.map((x) => AccessMenu.fromJson(x)));
  }
}
