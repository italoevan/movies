import 'package:flutter/material.dart';
import 'package:movies/src/core/consts/endpoints/app_endpoints.dart';

import '../../../infra/models/generic_movie_model.dart';

class MovieElement extends StatelessWidget {
  final GenericMovieModel model;

  const MovieElement({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(model.id);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            AppEndpoints.imageEndpoint(model.image),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
