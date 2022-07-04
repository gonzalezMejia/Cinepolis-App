import 'dart:convert';
import 'package:chewie/chewie.dart';
import 'package:cinepolis/app/pages/billboard/detail/movie_detail.page.dart';
import 'package:cinepolis/core/routes/pages.dart';
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
    return true;
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
  onSelectSeat(LocationsAvailableModel availableLocation) {

    Get.toNamed("${Routes.seating}?location=${jsonEncode(availableLocation.toJson())}");
  }
}

