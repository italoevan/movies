import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/src/domain/entities/movie_entity.dart';
import 'package:movies/src/presenter/details/details_controller.dart';

class DetailsPage extends StatefulWidget {
  final DetailsController controller;
  const DetailsPage({Key? key, required this.controller}) : super(key: key);
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final MovieEntity movie = Modular.args.data;

  @override
  void initState() {
    widget.controller.getDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
    );
  }
}
