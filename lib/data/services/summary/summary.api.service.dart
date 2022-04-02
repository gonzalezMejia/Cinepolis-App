import 'package:Cinepolis/core/values/enviroments.dart';
import 'package:Cinepolis/data/models/entities/dynamic/dynamic_summary.model.dart';
import 'package:Cinepolis/data/models/enums/request_method.enum.dart';
import 'package:Cinepolis/data/services/base.service.dart';
import 'package:Cinepolis/data/services/summary/summary.contract.dart';

class SummaryApiService extends BaseService implements ISummaryService {
  final String sap = Environments.SAP_URL;

  @override
  Future<List<DynamicSummary>> getSummary(int branchId) async {
    var response = await provider.request<DynamicSummary>(
        RequestMethod.get, "${sap}api/branches/summary/$branchId",
        useDefaultUrl: false);
    return List<DynamicSummary>.from(
        response.map((x) => DynamicSummary.fromMap(x)));
  }
}
