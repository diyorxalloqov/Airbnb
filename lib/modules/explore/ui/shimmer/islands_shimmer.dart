import 'package:airbnb___/modules/explore/ui/shimmer/page_item_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class IslandsShimmer extends StatefulWidget {
  const IslandsShimmer({super.key});

  @override
  State<IslandsShimmer> createState() => _IslandsShimmerState();
}

class _IslandsShimmerState extends State<IslandsShimmer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ListView.builder(itemBuilder: (context, index) {
                if (index == 0) {
                  return Shimmer.fromColors(
                    baseColor: Colors.white24,
                    highlightColor: Colors.grey.shade400,
                    child: Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      color: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          side:
                              const BorderSide(color: Colors.grey, width: 0.3),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  );
                }
                return const ItemWidgetShimmer();
              }),
            ],
          ),
        ),
      ],
    );
  }
}
