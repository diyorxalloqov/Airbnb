import 'package:airbnb/core/constants/app_images.dart';
import 'package:airbnb/utils/extension/size.dart';
import 'package:airbnb/utils/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

class ImagePageView extends StatefulWidget {
  const ImagePageView({super.key});

  @override
  State<ImagePageView> createState() => FirstWidgetState();
}

class FirstWidgetState extends State<ImagePageView> {
  late PageController _pageController;
  int _currentPage = 0;
  List items = ["", "", "", ""]; // coming api

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.25,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (value) {
              _currentPage = value;
              setState(() {});
            },
            itemBuilder: (context, index) {
              return Image.asset(AppImages.island, fit: BoxFit.fitWidth);
            },
            itemCount: items.length,
          ),
          Positioned(
              child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                const SpaceHeight(),
                const SpaceHeight(),
                const SpaceHeight(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: const Icon(Icons.arrow_back),
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => FlutterShare.share(title: 'salom'),
                            child: Container(
                              padding: const EdgeInsets.all(5.0),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: const Icon(Icons.share),
                            ),
                          ),
                          const SpaceWidth(),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(5.0),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: const Icon(Icons.favorite_border),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
          Positioned(
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: context.right + 25, vertical: 10),
              height: context.height * 0.05,
              width: context.width * 0.15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.black),
              child: Center(
                child: Text(
                  "${_currentPage + 1}/${items.length}",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
