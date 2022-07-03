import 'dart:convert';

import 'package:cinepolis/core/values/enviroments.dart';
import 'package:cinepolis/data/models/entities/seatings/seating.model.dart';
import 'package:cinepolis/data/models/enums/request_method.enum.dart';
import 'package:cinepolis/data/services/base.service.dart';
import 'package:cinepolis/data/services/seatings/seatings.contract.dart';

class SeatingApiService extends BaseService implements ISeatingService {
  final String _recruitmentUrl = Environments.recruitmentUrl;

  @override
  Future<List<SeatingModel>> getSeatingBySchedule(int scheduleId) async{
    var userJson = await provider.request<SeatingModel>(RequestMethod.get,
        "${_recruitmentUrl}api/branch/asientos/$scheduleId",
        useDefaultUrl: false);
    return List<SeatingModel>.from(
        userJson.map((x) => SeatingModel.fromJson(x)));
  }

  @override
  Future saveSeats(List<SeatingModel> seats)async {
    var body = json.encode(seats.map((e) => e.toJson()));
    var userJson = await provider.request<dynamic>(
        RequestMethod.post, "${_recruitmentUrl}api/branch/asientos",
        useDefaultUrl: false, body: body);

    var bodyResponse = json.decode(userJson.body);

    return bodyResponse;
  }


}
