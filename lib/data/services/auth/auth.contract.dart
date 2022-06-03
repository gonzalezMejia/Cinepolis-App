import 'package:cinepolis/data/models/entities/users/user.model.dart';

abstract class IAuthService {
  Future<User> singIn(String username, String password);
  Future<User?> checkUser();
}
