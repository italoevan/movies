import 'package:flutter/material.dart';

class UserAvaliationComponent extends StatelessWidget {
  final double size;
  final double voteAverage;

  const UserAvaliationComponent({
    Key? key,
    this.size = 45,
    required this.voteAverage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          boxShadow: const [BoxShadow(color: Colors.white, blurRadius: 2)],
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(size)),
      child: Center(
        child: Text(voteAverage.toString()),
      ),
    );
  }
}
