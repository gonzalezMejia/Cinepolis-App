import 'package:Cinepolis/data/models/entities/menu/menu.model.dart';
import 'package:Cinepolis/data/models/entities/menu/menu_access.model.dart';

abstract class IMenuService {
  Future<Menu> generateMenu(int idEmployee);
  Future<List<AccessMenu>> accessMenu(int idEmployee);
}
