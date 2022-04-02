import 'dart:convert';

import 'package:Cinepolis/app/utils/msg.utils.dart';
import 'package:Cinepolis/core/values/enviroments.dart';
import 'package:Cinepolis/data/models/core/api_exception.model.dart';
import 'package:Cinepolis/data/models/entities/quizzer/quizz.model.dart';
import 'package:Cinepolis/data/models/entities/quizzer/quizz_available.model.dart';
import 'package:Cinepolis/data/models/entities/quizzer/quizz_branch_visited.model.dart';
import 'package:Cinepolis/data/models/entities/quizzer/quizz_finish.model.dart';
import 'package:Cinepolis/data/models/entities/quizzer/quizz_history.model.dart';
import 'package:Cinepolis/data/models/entities/quizzer/quizz_init.model.dart';
import 'package:Cinepolis/data/models/entities/quizzer/quizz_object_refs.model.dart';
import 'package:Cinepolis/data/models/entities/quizzer/quizz_summary.model.dart';
import 'package:Cinepolis/data/models/enums/request_method.enum.dart';
import 'package:Cinepolis/data/services/base.service.dart';
import 'package:Cinepolis/data/services/quizzer/quizzers.service.contract.dart';

class QuizzersService extends BaseService implements IQuizzerService {
  final String quizzer = Environments.QUIZZER_URL;

  @override
  Future<List<QuizzAvailable>> getAvailable() async {
    var userJson = await provider.request<dynamic>(
        RequestMethod.get, "${quizzer}api/campaigns/available",
        useDefaultUrl: false);
    return List<QuizzAvailable>.from(
        userJson.map((x) => QuizzAvailable.fromJson(x)));
  }

  @override
  Future<List<QuizHistory>> getHistory(
      int offset, int limit, String filter) async {
    var userJson = await provider.request<dynamic>(RequestMethod.get,
        "${quizzer}api/users/current/usercampaigns/$offset/$limit/$filter",
        useDefaultUrl: false);
    return List<QuizHistory>.from(userJson.map((x) => QuizHistory.fromJson(x)));
  }

  @override
  Future<List<QuizzSummary>> getSummary(String campaingId) async {
    var jsonResponse = await provider.request<QuizzSummary>(
        RequestMethod.get, "${quizzer}api/usercampaigns/$campaingId/summary",
        useDefaultUrl: false);
    return List<QuizzSummary>.from(
        jsonResponse.map((x) => QuizzSummary.fromJson(x)));
  }

  @override
  Future<List<AvailableBranches>> getAvailableBranches(int branchId) async {
    var jsonResponse = await provider.request<AvailableBranches>(
        RequestMethod.get,
        "${quizzer}api/Campaigns/$branchId/availablebranches",
        useDefaultUrl: false);
    return List<AvailableBranches>.from(
        jsonResponse.map((x) => AvailableBranches.fromJson(x)));
  }

  @override
  Future<Quizz> getQuizzer(int campaingId) async {
    var userJson = await provider.request<Quizz>(RequestMethod.get,
        "${quizzer}api/userCampaigns/$campaingId/objects/next", //200601620649
        useDefaultUrl: false);
    return Quizz.fromJson(userJson);
  }

  @override
  Future<InitQuizz> initQuizzer(ParamsInitQuizz paramsInitQuizz) async {
    Map<String, dynamic> invoiceJson = paramsInitQuizz.toJson();
    String body = jsonEncode(invoiceJson);
    var userJson = await provider
        .request<InitQuizz>(
            RequestMethod.post, "${quizzer}api/usercampaigns/init",
            useDefaultUrl: false, body: body)
        .onError((error, stackTrace) {
      var exeption = ApiException.fromJson(jsonDecode(error.toString()));
      return SnackUtils.error(exeption.exceptionMessage!, 'Advertencia');
    });

    return InitQuizz.fromJson(userJson);
  }

  @override
  Future sendRequest(ObjectRefs objectRefs) async {
    Map<String, dynamic> invoiceJson = objectRefs.toJson();
    String body = jsonEncode(invoiceJson);

    return await provider.request<dynamic>(
        RequestMethod.post, "${quizzer}api/userCampaignsObjectsRef",
        useDefaultUrl: false, body: body);
  }

  @override
  Future finishQuizzer(int campaingId, FinishQuizzer finishQuizzer) async {
    Map<String, dynamic> invoiceJson = finishQuizzer.toJson();
    String body = jsonEncode(invoiceJson);

    return await provider.request<dynamic>(
        RequestMethod.post, "${quizzer}api/userCampaigns/$campaingId/complete",
        useDefaultUrl: false, body: body);
  }

  @override
  Future incompleteQuizzer(String campaingId) async {
    return await provider.request<dynamic>(RequestMethod.post,
        "${quizzer}api/usercampaigns/$campaingId/incomplete",
        useDefaultUrl: false);
  }

  @override
  Future<List<BranchesVisited>> getBranchesVisited() async {
    var jsonResponse = await provider.request<BranchesVisited>(
        RequestMethod.get, "${quizzer}api/assignments/current",
        useDefaultUrl: false);
    return List<BranchesVisited>.from(
        jsonResponse.map((x) => BranchesVisited.fromJson(x)));
  }
}
