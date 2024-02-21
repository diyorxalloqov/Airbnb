import 'package:airbnb___/core/constants/server.dart';
import 'package:airbnb___/modules/explore/bloc/explore_bloc.dart';
import 'package:airbnb___/utils/extension/size.dart';
import 'package:airbnb___/utils/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

class ImagePageView extends StatefulWidget {
  final int index;
  final ExploreState state;
  const ImagePageView({super.key, required this.index, required this.state});

  @override
  State<ImagePageView> createState() => FirstWidgetState();
}

class FirstWidgetState extends State<ImagePageView> {
  late PageController _pageController;
  int _currentPage = 0;

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
              return Image.network(
                '${Server.server}${widget.state.productsModel[widget.index].images?[index]}', /* fit: BoxFit.fitWidth */
              );
            },
            itemCount: widget.state.productsModel[widget.index].images?.length ?? 0,
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
                  "${_currentPage + 1}/${widget.state.productsModel[widget.index].images?.length ?? 0}",
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
