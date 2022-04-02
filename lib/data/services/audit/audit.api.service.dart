import 'dart:convert';

import 'package:Cinepolis/app/utils/msg.utils.dart';
import 'package:Cinepolis/core/values/enviroments.dart';
import 'package:Cinepolis/data/models/core/api_exception.model.dart';
import 'package:Cinepolis/data/models/entities/audit/business_type.model.dart';
import 'package:Cinepolis/data/models/entities/audit/cash_balances.model.dart';
import 'package:Cinepolis/data/models/entities/audit/cash_balances_detail.model.dart';
import 'package:Cinepolis/data/models/entities/audit/cash_data.model.dart';
import 'package:Cinepolis/data/models/entities/audit/cash_deposit.model.dart';
import 'package:Cinepolis/data/models/entities/audit/rostisserie_detail.model.dart';
import 'package:Cinepolis/data/models/entities/audit/rostisserie_list.model.dart';
import 'package:Cinepolis/data/models/entities/audit/rotisserie.model.dart';
import 'package:Cinepolis/data/models/entities/audit/sendArqueo.model.dart';
import 'package:Cinepolis/data/models/enums/request_method.enum.dart';
import 'package:Cinepolis/data/services/audit/audit.contract.dart';
import '../base.service.dart';

class AuditApiService extends BaseService implements IAuditService {
  final String auditUrl = Environments.AUDIT_URL;

  @override
  Future<List<CashBalances?>> getBalances(int type) async {
    var userJson = await provider.request<CashBalances>(
        RequestMethod.get, "${auditUrl}api/cashbalances/byBusinessType/$type",
        useDefaultUrl: false);
    return List<CashBalances>.from(
        userJson.map((x) => CashBalances.fromJson(x)));
  }

  @override
  Future<List<CashBalances?>> getBalancesByBranch(int type, int branch) async {
    var userJson = await provider.request<CashBalances>(
        RequestMethod.get, "${auditUrl}api/cashbalances/byBusinessType/$type",
        useDefaultUrl: false);

    var list =
        List<CashBalances>.from(userJson.map((x) => CashBalances.fromJson(x)));

    list.sort((a, b) => a.branchId!.compareTo(b.branchId!));

    return list
        .map((json) => CashBalances.fromJson(json.toJson()))
        .where((prod) {
      final listBranch = prod.branchId;
      final selectedBranch = branch;
      return listBranch!.toString().contains(selectedBranch.toString());
    }).toList();
  }

  @override
  Future<CashBalancesDetail?> getBalanceDetail(int id) async {
    var userJson = await provider.request<CashBalancesDetail>(
        RequestMethod.get, "${auditUrl}api/CashBalances/$id/detail",
        useDefaultUrl: false);
    return CashBalancesDetail.fromJson(userJson);
  }

  @override
  Future<List<BusinessType>> getBusnisseType() async {
    var userJson = await provider.request<BusinessType>(
        RequestMethod.get, "${auditUrl}api/businessTypes",
        useDefaultUrl: false);

    return List<BusinessType>.from(
        userJson.map((x) => BusinessType.fromJson(x)));
  }

  @override
  Future addRotisserieBalances(Rotisserie rotisserie) async {
    Map<String, dynamic> invoiceJson = rotisserie.toJson();
    String body = jsonEncode(invoiceJson);
    return await provider
        .request(RequestMethod.post, "${auditUrl}api/rostisserieBalances",
            useDefaultUrl: false, body: body)
        .onError((error, stackTrace) {
      var exeption = ApiException.fromJson(jsonDecode(error.toString()));
      return SnackUtils.error(exeption.exceptionMessage!, 'Advertencia');
    });
  }

  @override
  Future<Rotisserie> getRotisserieBalances(int branchId) async {
    var userJson = await provider.request<Rotisserie>(RequestMethod.get,
        "${auditUrl}api/rostisserieBalances/branch/$branchId/template",
        useDefaultUrl: false);
    return Rotisserie.fromJson(userJson);
  }

  @override
  Future<List<RostisserieList>> getAllByBrachRotisserie(int branchId) async {
    var userJson = await provider.request<RostisserieList>(RequestMethod.get,
        "${auditUrl}api/rostisserieBalances/branch/$branchId/balances/0/10/",
        useDefaultUrl: false);
    return List<RostisserieList>.from(
        userJson.map((x) => RostisserieList.fromJson(x)));
  }

  @override
  Future<RostisserieDetail> getRostisserieDetail(int folio) async {
    var userJson = await provider.request<RostisserieDetail>(
        RequestMethod.get, "${auditUrl}api/rostisserieBalances/$folio/detail",
        useDefaultUrl: false);
    return RostisserieDetail.fromJson(userJson);
  }

  @override
  Future<CashDeposit> getDeposit(int branch, String date) async {
    var json = await provider.request<CashDeposit>(RequestMethod.get,
        "${auditUrl}api/cashbalances/auditCashout/branches/$branch/date/$date",
        useDefaultUrl: false);

    return CashDeposit.fromJson(json);
  }

  @override
  Future<CashData> getCash(int branch, int busnisseType) async {
    var json = await provider.request<CashData>(RequestMethod.get,
        "${auditUrl}api/cashbalances/branches/$branch/businessTypes/$busnisseType/cashout",
        useDefaultUrl: false);

    return CashData.fromJson(json);
  }

  @override
  Future sendArqueo(SendArqueo sendArqueo) async {
    Map<String, dynamic> invoiceJson = sendArqueo.toJson();
    String body = jsonEncode(invoiceJson);
    return await provider
        .request(RequestMethod.post, "${auditUrl}api/cashbalances",
            useDefaultUrl: false, body: body)
        .onError((error, stackTrace) {
      var exeption = ApiException.fromJson(jsonDecode(error.toString()));
      return SnackUtils.error(exeption.exceptionMessage!, 'Advertencia');
    });
  }
}
