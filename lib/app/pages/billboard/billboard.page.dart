// ignore_for_file: unnecessary_new

import 'package:cinepolis/app/pages/billboard/billboard.controller.dart';
import 'package:cinepolis/data/models/entities/movies/movies.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillboardPage extends GetView<BillBoardController> {
  const BillboardPage({Key? key}) : super(key: key);

  @override
  //
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: ' Cartelera',
        theme: new ThemeData(primarySwatch: Colors.deepPurple),
        home: Scaffold(
          appBar: AppBar(title: const Text('Carteleraa')),
          body: new ListView(
            children: controller.movies.map(_buildItem).toList(),
          ),
        ));
  }

  Widget _buildItem(MoviesModel moviesModel) {
    return new ListTile(
        title: new Text('Duracion: ${moviesModel.id}'),
        subtitle: new Text('Pelicula: ${moviesModel.nombre}'),
        leading: const Icon(Icons.movie_creation_outlined),
        onTap: () {});
  }
}
