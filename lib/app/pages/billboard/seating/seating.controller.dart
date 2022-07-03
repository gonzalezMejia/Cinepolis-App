import 'dart:convert';

import 'package:cinepolis/app/utils/msg.utils.dart';
import 'package:cinepolis/core/common/extensors.dart';
import 'package:cinepolis/data/models/entities/movies/locations_available.model.dart';
import 'package:cinepolis/data/models/entities/seatings/seating.model.dart';
import 'package:cinepolis/data/services/seatings/seatings.contract.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeatingController extends GetxController{
  final ISeatingService _seatingService;

  var gerbong =  <Map<String, dynamic>>[].obs;
  var availableLocation=LocationsAvailableModel.fromVoid().obs;
  var seating = <SeatingModel>[].obs;
  var loading = true.obs;

  SeatingController(this._seatingService);

  @override
  void onInit() async{
    super.onInit();
     Map<String, dynamic> valueMap = json.decode(Get.parameters.values.first!);
    availableLocation.value= LocationsAvailableModel.fromJson(valueMap);
    await _seatingService.getSeatingBySchedule(availableLocation.value.id!).then((value) {
      seating.value=value;
      for(int i=0;i<availableLocation.value.capacidad!;i++){
        var find=value.firstWhereOrNull((element) => element.nombreAsiento!.toInt()==i);
        if(find!=null){
            gerbong.add({
              "id": i + 1,
            "status": "filled"
          });
        } else {
          gerbong.add({
            "id": i + 1,
            "status": "available"
          });
        }
      }
    });

    gerbong.map((element) => element);
    loading.value=false;
  }

  void reset() {
    gerbong.forEach((elmt) {
      if (elmt['status'] != 'filled') {
        elmt.update('status', (value) => 'available');
      }

    });
  }

  void gantiGerbong(int indexGerbongTerpilih) {
    gerbong.refresh();
  }

  void selectKursi(int indexKursiTerpilih) {
    print(gerbong[indexKursiTerpilih]);

    if(gerbong[indexKursiTerpilih]['status'] == 'filled'){
      return;
    }
    if (gerbong[indexKursiTerpilih]['status'] == 'available') {
      gerbong[indexKursiTerpilih].update('status', (value) => 'selected');
    }else if(gerbong[indexKursiTerpilih]['status'] == 'selected'){
      gerbong[indexKursiTerpilih].update('status', (value) => 'kids');
    }
    else{
      gerbong[indexKursiTerpilih].update('status', (value) => 'available');
    }

    gerbong.refresh();
  }

  onSaveListSeat(BuildContext context) {
    var selects= gerbong.where((element) => element['status']=='selected');
    if(selects.isEmpty) return SnackUtils.error("No has seleccionado ningun asiento", "Advertencía");
   var seats= <SeatingModel>[];
  }

}