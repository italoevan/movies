import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:movies/src/core/consts/endpoints/app_endpoints.dart';
import 'package:movies/src/domain/entities/movie_entity.dart';
import 'package:movies/src/presenter/pages/details/details_controller.dart';
import 'package:movies/src/presenter/pages/details/state/details_state.dart';

import 'components/genre_component.dart';
import 'components/user_avaliation_component.dart';

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
        extendBody: true,
        body: SingleChildScrollView(
          child: Obx(() => widget.controller.currentState is DetailsLoadingState
              ? const Center(child: CircularProgressIndicator())
              : _buildLoadedContent()),
        ));
  }

  Widget _buildLoadedContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHeader(),
        const SizedBox(
          height: 8,
        ),
        _buildGenres(),
        _buildOverview()
      ],
    );
  }

  Widget _buildHeader() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.50,
      child: Stack(
        children: [
          _buildImage(),
          Align(alignment: Alignment.bottomCenter, child: _buildTitle())
        ],
      ),
    );
  }

  // Widget _buildBackButton() {
  //   return IconButton(
  //       onPressed: () => Navigator.pop(context),
  //       icon: const Icon(Icons.navigate_before));
  // }

  Widget _buildGenres() {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: SizedBox(
        height: 30,
        child: Row(
          children: [
            const Text("Genres"),
            const SizedBox(
              width: 24,
            ),
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 4,
                      ),
                  shrinkWrap: true,
                  itemCount: widget.controller.model.genres.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) => GenreComponent(
                        genreTitle: widget.controller.model.genres[index].name,
                      ))),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.50,
        child: Image.network(
          AppEndpoints.imageEndpoint(movie.image),
          fit: BoxFit.fitWidth,
        ));
  }

  Widget _buildOverview() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        widget.controller.model.overview,
        textAlign: TextAlign.justify,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 1,
            child: Text(
              movie.title,
              style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),
          Flexible(
            flex: 1,
            child: UserAvaliationComponent(
                voteAverage: widget.controller.model.voteAverage),
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.red,
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).scaffoldBackgroundColor.withOpacity(0.7),
                Theme.of(context).scaffoldBackgroundColor
              ])),
    );
  }
}
