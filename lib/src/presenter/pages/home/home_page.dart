import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/src/core/theme/app_colors.dart';
import 'package:movies/src/presenter/pages/home/components/home_shimmer.dart';
import 'package:movies/src/presenter/pages/home/state/home_state.dart';

import './home_controller.dart';
import 'components/movies_carousel.dart';

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
    widget.controller.getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Movies"),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.cast_connected_outlined,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ))
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.only(top: 24, left: 8, right: 8),
            child: _buildBody()),
        bottomNavigationBar: _buildBottomNavigation());
  }

  Widget _buildBody() {
    return Obx(() => widget.controller.currentState is HomeLoadingState
        ? const HomeShimmer()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTitle("Playing Now"),
              _buildPlayingNowCarousel(),
              const SizedBox(
                height: 16,
              ),
              _buildTitle("Most Popular"),
              _buildMostPopularCarousel()
            ],
          ));
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      textAlign: TextAlign.start,
      style: const TextStyle(fontSize: 22),
    );
  }

  Widget _buildPlayingNowCarousel() {
    return MoviesCarousel(
      itemCount: widget.controller.playingNowMovies.length,
      movies: widget.controller.playingNowMovies,
    );
  }

  Widget _buildMostPopularCarousel() {
    return MoviesCarousel(
      itemCount: widget.controller.playingNowMovies.length,
      movies: widget.controller.mostPopularMovies,
    );
  }

  Widget _buildBottomNavigation() {
    return BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black87,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.movie_creation_outlined,
              ),
              label: "News"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.download,
              ),
              label: "Downloads"),
        ]);
  }
}
