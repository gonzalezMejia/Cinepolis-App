import 'package:Cinepolis/data/models/entities/employees/user.model.dart';

abstract class IAuthService {
  Future<User?> singIn(String username, String password);
  Future<User?> checkUser();
}
