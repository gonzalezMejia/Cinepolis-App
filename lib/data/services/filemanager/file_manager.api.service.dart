import 'package:Cinepolis/app/utils/msg.utils.dart';
import 'package:Cinepolis/core/values/enviroments.dart';
import 'package:Cinepolis/data/services/base.service.dart';
import 'package:Cinepolis/data/services/filemanager/file_manager.contract.dart';

class FileManagerApiService extends BaseService implements IFileManagerService {
  final String ssoUrl = Environments.FILE_MANAGER_URL;

  @override
  Future<dynamic> uploadPicture(String path) async {
    try {
      // Send Restore Password
      var userJson = provider.uploadFile('$ssoUrl/api/files/3/13305/400', path);
      return userJson;
    } catch (e) {
      SnackUtils.error('Servicio no disponible.', 'Advertencia');
      print(e);
      return null;
    }
  }
}
