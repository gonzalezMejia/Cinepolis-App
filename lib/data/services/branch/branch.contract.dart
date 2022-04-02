import 'package:Cinepolis/data/models/entities/branches/branch.model.dart';
import 'package:Cinepolis/data/models/entities/branches/branch_minified.model.dart';

abstract class IBranchService {
  Future<List<Branch?>> getAll();
  Future<List<Branch?>> getAllByBranch(var search);
  Future<List<BranchMinified>> getByEmployee(int id);
  Future<Branch> getById(int id);
}
