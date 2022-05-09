import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DetailsShimmer extends StatefulWidget {
  const DetailsShimmer({Key? key}) : super(key: key);

  @override
  State<DetailsShimmer> createState() => _DetailsShimmerState();
}

class _DetailsShimmerState extends State<DetailsShimmer> {
  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: const LinearGradient(colors: [Colors.grey, Colors.black12]),
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.50,
          color: Colors.white,
        ),
        const SizedBox(
          height: 8,
        ),
        _buildLine(),
        _buildLine(),
        _buildLine(),
        _buildLine(),
        _buildLine()
      ],
    );
  }

  Widget _buildLine() {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        color: Colors.white,
        height: 20,
      ),
    );
  }
}
