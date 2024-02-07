import 'package:airbnb/core/constants/app_images.dart';
import 'package:airbnb/utils/extension/size.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatefulWidget {
  final VoidCallback onTap;
  final bool isTaxes;
  const ItemWidget({super.key, required this.isTaxes, required this.onTap});

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        children: [
          Container(
            height: context.height * 0.35,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
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
                              'https://picsum.photos/$index/200',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(AppImages.island);
                              },
                            )),
                      );
                    }),
                Positioned(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_outline,
                        color: Colors.white,
                      )),
                )),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ytteran, Sweden",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Row(
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
                    )
                  ],
                ),
                const Text(
                  '5,000 square meters',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                widget.isTaxes
                    ? const Text(
                        '5 nights • Sep 9 - 14',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      )
                    : const Text(
                        'Sep 9 - 14',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                widget.isTaxes
                    ? const Text.rich(TextSpan(
                        style: TextStyle(decoration: TextDecoration.underline),
                        children: [
                            TextSpan(
                                text: '\$1,389 ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: 'total before taxes')
                          ]))
                    : const Row(
                        children: [
                          Text(
                            "\$241",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 5),
                          Text('nigth')
                        ],
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}
