import 'package:Cinepolis/data/models/entities/dynamic/dynamic_summary.model.dart';

abstract class ISummaryService {
  Future<List<DynamicSummary>> getSummary(int branchId);
}
