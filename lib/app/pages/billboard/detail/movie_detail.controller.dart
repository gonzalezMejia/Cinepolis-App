import 'dart:convert';

import 'package:chewie/chewie.dart';
import 'package:cinepolis/app/pages/billboard/detail/movie_detail.page.dart';
import 'package:cinepolis/data/models/entities/movies/movies.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class MovieDetailController extends GetxController {


  var loadingVideo = false.obs;

  var videoPlayerController = VideoPlayerController.network("").obs;
  var chewieController = ChewieController(videoPlayerController: VideoPlayerController.network('')).obs;
  var movie=MoviesModel.fromVoid().obs;

  @override
  void onInit() async {
    super.onInit();

    movie.value= MoviesModel.fromJson(json.decode(Get.parameters.values.first!));

      _initializePlayer(movie.value.traierUrl!);

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
}

