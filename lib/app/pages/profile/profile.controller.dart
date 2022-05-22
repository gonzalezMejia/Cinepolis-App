import 'package:cinepolis/app/utils/storage.utils.dart';
import 'package:cinepolis/core/routes/pages.dart';
import 'package:cinepolis/core/values/enviroments.dart';
import 'package:cinepolis/core/values/globals.dart';
import 'package:cinepolis/data/models/entities/users/user.model.dart';
import 'package:cinepolis/data/models/entities/users/user_detail.model.dart';
import 'package:cinepolis/data/services/auth/auth.contract.dart';
import 'package:cinepolis/data/services/employees/user.contract.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  late final IAuthService _service;
  late final IUserService _employeeService;

  var user = User.fromVoid().obs;
  var profile = <UserDetail>[].obs;
  var loading = true.obs;

  final String imagesUrl = Environments.imageUrl;

  ProfileController(this._service, this._employeeService);

  @override
  void onInit() async {
    await _currentUser();
    loading.value = false;
    super.onInit();
  }

  _currentUser() async {
    await _service.checkUser().then((value) async {
      user.value = value!;
      await _employeeService
          .getProfile(int.tryParse(user.value.code) ?? 0)
          .then((value) => profile.value = value);
    });
  }

  singOut() {
    Get.offAllNamed(Routes.login);

    LocalStorageUtils.setStringKey(Globals.currentUserKey, "");
    LocalStorageUtils.setStringKey(Globals.tokenKey, "");

    //Borramos los shared
    SharedPreferenceUtils.removeValues(Globals.tokenKey);
    SharedPreferenceUtils.removeValues(Globals.currentUserKey);
  }
}
