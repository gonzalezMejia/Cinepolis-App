import 'package:cinepolis/app/utils/storage.utils.dart';
import 'package:cinepolis/core/routes/pages.dart';
import 'package:cinepolis/core/values/enviroments.dart';
import 'package:cinepolis/core/values/globals.dart';
import 'package:cinepolis/data/models/entities/users/user.model.dart';
import 'package:cinepolis/data/services/auth/auth.contract.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  late final IAuthService _service;

  var user = User.fromVoid().obs;
  var loading = true.obs;

  final String imagesUrl = Environments.imageUrl;

  ProfileController(this._service);

  @override
  void onInit() async {
    await _currentUser();
    super.onInit();
  }

  _currentUser() async {
    await _service.checkUser().then((value) async {
      user.value = value!;
      loading.value = false;
    });
  }

  singOut() {
    Get.offAllNamed(Routes.login);
    LocalStorageUtils.setStringKey(Globals.tokenKey, "");

    //Borramos los shared
    SharedPreferenceUtils.removeValues(Globals.tokenKey);
  }
}
