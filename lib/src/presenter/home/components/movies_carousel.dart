import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/src/domain/entities/movie_entity.dart';
import 'package:movies/src/presenter/home/components/movie_element.dart';

class MoviesCarousel extends StatelessWidget {
  final int itemCount;
  final List<MovieEntity> movies;

  const MoviesCarousel({
    Key? key,
    required this.itemCount,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: itemCount,
        itemBuilder: (context, value, val) {
          return MovieElement(model: movies[value]);
        },
        options: CarouselOptions(
          viewportFraction: 0.4,
          disableCenter: true,
          height: 200,
        ));
  }
}
