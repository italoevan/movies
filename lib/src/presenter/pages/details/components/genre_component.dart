import 'package:flutter/material.dart';
import 'package:movies/src/core/theme/app_colors.dart';

class GenreComponent extends StatelessWidget {
  final String genreTitle;
  const GenreComponent({
    Key? key,
    required this.genreTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppColors.mainColor)),
      height: 15,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Text(genreTitle),
      ),
    );
  }
}
