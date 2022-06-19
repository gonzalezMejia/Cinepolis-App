import 'dart:convert';
import 'package:chewie/chewie.dart';
import 'package:cinepolis/app/pages/billboard/detail/movie_detail.page.dart';
import 'package:cinepolis/app/pages/billboard/detail/select_seat.page.dart';
import 'package:cinepolis/data/models/entities/movies/locations_available.model.dart';
import 'package:cinepolis/data/models/entities/movies/movies.model.dart';
import 'package:cinepolis/data/services/movies/movies.contract.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class MovieDetailController extends GetxController {
final IMoviesService _moviesService;

  var loadingVideo = false.obs;

  var videoPlayerController = VideoPlayerController.network("").obs;
  var chewieController = ChewieController(videoPlayerController: VideoPlayerController.network('')).obs;
  var movie=MoviesModel.fromVoid().obs;
  var availableLocations=<LocationsAvailableModel>[].obs;

var gerbong =  List<Map<String, dynamic>>.generate(
  30,
      (indexK) {
    if ((indexK >= 24 && indexK <= 29) || (indexK >= 40 && indexK <= 55)) {
      return {
        "id": "ID-${indexK + 1}",
        "status": "filled",
      };
    } else {
      return {
        "id": "ID-${indexK + 1}",
        "status": "available",
      };
    }
  },
).obs;

  MovieDetailController(this._moviesService);

  @override
  void onInit() async {
    super.onInit();

    movie.value= MoviesModel.fromJson(json.decode(Get.parameters.values.first!));
    await _initializePlayer(movie.value.traierUrl!);
    availableLocations.value=await _moviesService.getLocationsAvailable(movie.value.id!);
  }


  @override
  void onClose() {
    super.onClose();
    chewieController.value.dispose();
  }



  deleteProcess() {
    Get.back<MovieDetailDetailPage>();
    chewieController.value.videoPlayerController.pause();
  }

 _initializePlayer(String url) async {
    loadingVideo.value = true;

    videoPlayerController.value = VideoPlayerController.network(url);
    await Future.wait([videoPlayerController.value.initialize()]);


    chewieController.value = ChewieController(
        videoPlayerController: videoPlayerController.value,
        autoPlay: false,
        looping: true,
        allowMuting: false,
        allowFullScreen: true,
        showOptions: false,
        fullScreenByDefault: false,
        aspectRatio: 16 / 9,
        materialProgressColors: ChewieProgressColors(
            playedColor: Colors.blue[900]!,
            handleColor: Colors.white,
            backgroundColor: Colors.white60,
            bufferedColor: Colors.grey),
        autoInitialize: true);


    videoPlayerController.refresh();
    loadingVideo.value = false;
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

  if (gerbong[indexKursiTerpilih]['status'] == 'available') {
    //reset();
    gerbong[indexKursiTerpilih].update('status', (value) => 'selected');
  }else{
    gerbong[indexKursiTerpilih].update('status', (value) => 'available');
  }

  gerbong.refresh();
}

  onSelectSeat(LocationsAvailableModel availableLocation) {
    gerbong.value= List<Map<String, dynamic>>.generate(availableLocation.capacidad!,(index){
      if ((index < availableLocation.ocupados!)) {
        return {
          "id": "ID-${index + 1}",
          "status": "filled",
        };
      } else {
        return {
          "id": "ID-${index + 1}",
          "status": "available",
        };
      }
    });
    Get.to(()=>SelectSeatPage(availableLocation));
  }

  onSaveListSeat(BuildContext context) {


  }
}

