import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: const LinearGradient(colors: [Colors.grey, Colors.black12]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          color: Colors.white,
          height: 20,
          width: 120,
        ),
        const Divider(
          color: Colors.transparent,
        ),
        SizedBox(
            height: 200,
            child: CarouselSlider.builder(
                itemCount: 4,
                itemBuilder: (context, value, val) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  viewportFraction: 0.4,
                  disableCenter: true,
                  height: 200,
                ))),
        const Divider(
          color: Colors.transparent,
        ),
        Container(
          color: Colors.white,
          height: 20,
          width: 120,
        ),
        const Divider(
          color: Colors.transparent,
        ),
        SizedBox(
            height: 200,
            child: CarouselSlider.builder(
                itemCount: 4,
                itemBuilder: (context, value, val) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  viewportFraction: 0.4,
                  disableCenter: true,
                  height: 200,
                ))),
      ]),
    );
  }
}
