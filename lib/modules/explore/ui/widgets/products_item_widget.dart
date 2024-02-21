import 'package:airbnb___/core/constants/app_images.dart';
import 'package:airbnb___/core/constants/server.dart';
import 'package:airbnb___/modules/explore/bloc/explore_bloc.dart';
import 'package:airbnb___/modules/explore/ui/shimmer/explore_shimmer.dart';
import 'package:airbnb___/utils/extension/size.dart';
import 'package:airbnb___/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemWidget extends StatefulWidget {
  final VoidCallback onTap;
  final bool isTaxes;
  final int index;
  const ItemWidget(
      {super.key,
      required this.index,
      required this.isTaxes,
      required this.onTap});

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreBloc, ExploreState>(
      builder: (context, state) {
        if (state.status == ActionStatus.isLoading) {
          return const ExploreShimmer();
        }
        if (state.status == ActionStatus.isSuccess) {
          return GestureDetector(
            onTap: widget.onTap,
            child: Column(
              children: [
                Container(
                  height: context.height * 0.35,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      PageView.builder(
                          controller: _pageController,
                          itemCount: 
                              state.productsModel[widget.index].images?.length,
                          onPageChanged: (value) {
                            _currentPage = value;
                            setState(() {});
                          },
                          itemBuilder: (context, index) {
                            return state.productsModel[widget.index]
                                    .images![index].isEmpty
                                ? Image.asset(AppImages.island)
                                : Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          // 'https://source.unsplash.com/featured/?nature',
                                          '${Server.server}${state.productsModel[widget.index].images?[index]}',
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.asset(
                                                AppImages.island);
                                          },
                                        )),
                                  );
                          }),
                      Positioned(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite_outline,
                                color: Colors.white)),
                      )),
                      (state.productsModel[widget.index].images?.length) == 1
                          ? const SizedBox.shrink()
                          : Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  state.productsModel[widget.index].images!
                                      .length,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.productsModel[widget.index].region ?? '',
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                          const Row(
                            children: [
                              Icon(Icons.star, color: Colors.black, size: 15),
                              SizedBox(width: 5),
                              Text("4.83"),
                              SizedBox(width: 10)
                            ],
                          )
                        ],
                      ),
                      Text(
                        state.productsModel[widget.index].description
                            .toString(),
                        style: const TextStyle(color: Colors.grey),
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
                          ? Text.rich(TextSpan(
                              style: const TextStyle(
                                  decoration: TextDecoration.underline),
                              children: [
                                  TextSpan(
                                      text:
                                          '\$${state.productsModel[widget.index].price}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  const TextSpan(text: 'total before taxes')
                                ]))
                          : Row(
                              children: [
                                Text(
                                  "\$${state.productsModel[widget.index].price}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
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
        } else if (state.status == ActionStatus.isError) {
          return Center(child: Text(state.error));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
