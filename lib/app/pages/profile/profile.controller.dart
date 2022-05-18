import 'package:Cinepolis/app/utils/storage.utils.dart';
import 'package:Cinepolis/core/routes/pages.dart';
import 'package:Cinepolis/core/values/enviroments.dart';
import 'package:Cinepolis/core/values/globals.dart';
import 'package:Cinepolis/data/models/entities/users/user.model.dart';
import 'package:Cinepolis/data/models/entities/users/user_detail.model.dart';
import 'package:Cinepolis/data/services/auth/auth.contract.dart';
import 'package:Cinepolis/data/services/employees/user.contract.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  late final IAuthService _service;
  late final IUserService _employeeService;

  var user = User.fromVoid().obs;
  var profile = <UserDetail>[].obs;
  var loading = true.obs;

  final String imagesUrl = Environments.IMAGES_URL;

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
    Get.offAllNamed(Routes.LOGIN);

    LocalStorageUtils.setStringKey(Globals.CURRENT_USER_KEY, "");
    LocalStorageUtils.setStringKey(Globals.TOKEN_KEY, "");

    //Borramos los shared
    SharedPreferenceUtils.removeValues(Globals.TOKEN_KEY);
    SharedPreferenceUtils.removeValues(Globals.CURRENT_USER_KEY);
  }
}
