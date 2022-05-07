import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/src/presenter/home/components/movies_carousel.dart';
import 'package:movies/src/presenter/home/home_controller.dart';
import 'package:movies/src/presenter/home/state/home_state.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;

  const HomePage(this.controller, {Key? key}) : super(key: key);

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.controller.getNowPlayingMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
        centerTitle: true,
      ),
      body: Padding(padding: const EdgeInsets.all(8.0), child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return Obx(() => widget.controller.currentState is HomeLoadingState
        ? const CircularProgressIndicator()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [_buildTitle("Playing Now"), _buildCarousel()],
          ));
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      textAlign: TextAlign.start,
      style: const TextStyle(fontSize: 22),
    );
  }

  Widget _buildCarousel() {
    return MoviesCarousel(
      itemCount: widget.controller.movies.length,
      movies: widget.controller.movies,
    );
  }
}
