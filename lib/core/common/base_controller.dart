import 'package:Cinepolis/app/utils/user.utils.dart';
import 'package:Cinepolis/core/routes/pages.dart';
import 'package:Cinepolis/data/models/entities/employees/user.model.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  Future<User?> get user async {
    var userResponse = await UserUtils.getCurrentUser();
    if (userResponse == null) {
      Get.offAllNamed(Routes.LOGIN);
      return null;
    }
    return userResponse;
  }
}
