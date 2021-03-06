import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/src/core/consts/endpoints/app_endpoints.dart';
import 'package:movies/src/core/routes/app_routes.dart';

import '../../../../domain/entities/movie_entity.dart';


class MovieElement extends StatelessWidget {
  final MovieEntity model;

  const MovieElement({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Modular.to.pushNamed(AppRoutes.details, arguments: model);
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
