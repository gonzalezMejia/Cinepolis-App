
import 'package:Cinepolis/data/models/entities/users/user_detail.model.dart';

abstract class IUserService {
  Future<List<UserDetail>> getProfile(int id);
}
