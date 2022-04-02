import 'package:Cinepolis/data/models/entities/employees/access_employee.model.dart';
import 'package:Cinepolis/data/models/entities/employees/employee2.model.dart';
import 'package:Cinepolis/data/models/entities/employees/employee_detail.model.dart';
import 'package:Cinepolis/data/models/entities/employees/employee_reward_code.model.dart';

abstract class IEmployeeService {
  Future<List<EmployeeDetail>> getProfile(int id);
  Future<List<Employee2>> getByBranchAndPosition(int branchId, int positionId);
  Future<EmployeeRewardCode?> generateCode();
  Future<List<AccessEmployee>> typeAccessEmployee();
}
