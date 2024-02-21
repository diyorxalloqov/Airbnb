import 'package:airbnb___/core/constants/app_images.dart';
import 'package:airbnb___/utils/extension/size.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ItemWidgetShimmer extends StatefulWidget {
  const ItemWidgetShimmer({super.key});

  @override
  State<ItemWidgetShimmer> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidgetShimmer> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.white24,
            highlightColor: Colors.grey.shade400,
            child: Container(
              height: context.height * 0.35,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  PageView.builder(
                      controller: _pageController,
                      itemCount: 10,
                      onPageChanged: (value) {
                        _currentPage = value;
                        setState(() {});
                      },
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                'https://source.unsplash.com/featured/?nature',
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(AppImages.island);
                                },
                              )),
                        );
                      }),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        10,
                        (index) => AnimatedContainer(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 2, vertical: 10),
                          decoration: BoxDecoration(
                            color: _currentPage == index
                                ? Colors.white
                                : Colors.white54,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          width: _currentPage == index ? 10 : 8,
                          height: _currentPage == index ? 10 : 8,
                          duration: const Duration(milliseconds: 300),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.white24,
                      highlightColor: Colors.grey.shade400,
                      child: Text(
                        "Ytteran, Sweden",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.white24,
                      highlightColor: Colors.grey.shade400,
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.black,
                            size: 15,
                          ),
                          SizedBox(width: 5),
                          Text("4.83"),
                          SizedBox(width: 10)
                        ],
                      ),
                    )
                  ],
                ),
                Shimmer.fromColors(
                  baseColor: Colors.white24,
                  highlightColor: Colors.grey.shade400,
                  child: const Text(
                    '5,000 square meters',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: Colors.white24,
                  highlightColor: Colors.grey.shade400,
                  child: const Text(
                    'Sep 9 - 14',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: Colors.white24,
                  highlightColor: Colors.grey.shade400,
                  child: const Row(
                    children: [
                      Text(
                        "\$241",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 5),
                      Text('nigth')
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
