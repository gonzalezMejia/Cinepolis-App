import 'package:cinepolis/app/utils/msg.utils.dart';
import 'package:cinepolis/core/values/enviroments.dart';
import 'package:cinepolis/data/services/base.service.dart';
import 'package:cinepolis/data/services/filemanager/file_manager.contract.dart';

class FileManagerApiService extends BaseService implements IFileManagerService {
  final String _fileManager = Environments.fileManagerUrl;

  @override
  Future<dynamic> uploadPicture(String path) async {
    try {
      var userJson = await provider.uploadFile('$_fileManager/api/files/3/13305/400', path);
      return userJson;
    } catch (e) {
      SnackUtils.error('Servicio no disponible.', 'Advertencia');
      print(e);
      return null;
    }
  }
}
