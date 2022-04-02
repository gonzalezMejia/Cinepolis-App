import 'package:Cinepolis/data/models/entities/audit/business_type.model.dart';
import 'package:Cinepolis/data/models/entities/audit/cash_balances.model.dart';
import 'package:Cinepolis/data/models/entities/audit/cash_balances_detail.model.dart';
import 'package:Cinepolis/data/models/entities/audit/cash_data.model.dart';
import 'package:Cinepolis/data/models/entities/audit/cash_deposit.model.dart';
import 'package:Cinepolis/data/models/entities/audit/rostisserie_detail.model.dart';
import 'package:Cinepolis/data/models/entities/audit/rostisserie_list.model.dart';
import 'package:Cinepolis/data/models/entities/audit/rotisserie.model.dart';
import 'package:Cinepolis/data/models/entities/audit/sendArqueo.model.dart';

abstract class IAuditService {
  Future<List<CashBalances?>> getBalances(int type);
  Future<List<CashBalances?>> getBalancesByBranch(int type, int branchId);
  Future<CashBalancesDetail?> getBalanceDetail(int id);
  Future<List<BusinessType>> getBusnisseType();
  Future<CashDeposit> getDeposit(int branch, String date);
  Future<CashData> getCash(int branch, int busnisseType);
  Future<Rotisserie> getRotisserieBalances(int branchId);
  Future<List<RostisserieList>> getAllByBrachRotisserie(int branchId);
  Future<RostisserieDetail> getRostisserieDetail(int folio);
  Future addRotisserieBalances(Rotisserie rotisserie);
  Future sendArqueo(SendArqueo sendArqueo);
}
