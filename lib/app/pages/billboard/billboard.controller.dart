import 'package:chewie/chewie.dart';
import 'package:cinepolis/app/pages/billboard/detail/detail.page.dart';
import 'package:cinepolis/data/models/entities/movies/movies.model.dart';
import 'package:cinepolis/data/services/movies/movies.contract.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class BillBoardController extends GetxController {
  BillBoardController(this._moviesService);

  var videoPlayerController = VideoPlayerController.network("").obs;
  var chewieController = ChewieController(videoPlayerController: VideoPlayerController.network('')).obs;

  final IMoviesService _moviesService;
  var movies = <MoviesModel>[].obs;
  var loading = false.obs;
  var loadingVideo = false.obs;

  @override
  void onInit() async {
    super.onInit();
    loading.value = true;
    movies.value = await _moviesService.getMovies();
    loading.value = false;
  }

  @override
  void onClose() {
    super.onClose();
    chewieController.value.dispose();
  }

  goDetailMovie(MoviesModel movieModel) {
    initializePlayer(movieModel.traierUrl!);
    Get.to(() => BillBoardDetailPage(movieModel));
  }

  deleteProcess() {
    Get.back();
    chewieController.value.videoPlayerController.pause();
  }

  Future<void> initializePlayer(String url) async {
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

    loading.value = false;
  }
}
