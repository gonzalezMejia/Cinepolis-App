import 'dart:convert';
import 'package:cinepolis/app/utils/msg.utils.dart';
import 'package:cinepolis/core/common/extensors.dart';
import 'package:cinepolis/core/routes/pages.dart';
import 'package:cinepolis/data/models/entities/movies/locations_available.model.dart';
import 'package:cinepolis/data/models/entities/seatings/seating.model.dart';
import 'package:cinepolis/data/models/entities/tickets/shopping_ticket.model.dart';
import 'package:cinepolis/data/services/auth/auth.contract.dart';
import 'package:cinepolis/data/services/seatings/seatings.contract.dart';
import 'package:cinepolis/data/services/shopping_cart/shopping_card.contract.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeatingController extends GetxController{
  final ISeatingService _seatingService;
  final IShoppingCardService _shoppingCardService;
  final IAuthService _authService;

  var gerbong =  <Map<String, dynamic>>[].obs;
  var availableLocation=LocationsAvailableModel.fromVoid().obs;
  var seating = <SeatingModel>[].obs;
  var loading = true.obs;

  SeatingController(this._seatingService,this._shoppingCardService,this._authService);

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

  onSaveListSeat(BuildContext context) async{
    loading.value=true;
    var selects= gerbong.where((element) => element['status']=='selected'||element['status']=='kids');
    if(selects.isEmpty) return SnackUtils.error("No has seleccionado ningun asiento", "Advertencía");

   var seats =<SeatingModel>[].obs;
    selects.forEach((element) {
      seats.add(SeatingModel(
        id: 0,
        carritoTicketId: 0,
        nombreAsiento: element['id'].toString(),
        costo:element['status']=='kids'?45.00:65.00,
        horarioId: availableLocation.value.id,
        isAdult:element['status']=='kids'?false:true,
      ));
    });
   var user= await _authService.checkUser();
    var horario=Horarios(id: availableLocation.value.id);
   var shopping= ShoppingTicketModel(
     id: 0,
     asientos: seats,
     fCreation: DateTime.now().toIso8601String(),
     horarios: horario,
     isPaid: false,
     userId: user!.id!
   );
   await  _shoppingCardService.saveTickets(shopping);
    loading.value=false;
    Get.toNamed("${Routes.payment}?user=${user.id}");
  }

}