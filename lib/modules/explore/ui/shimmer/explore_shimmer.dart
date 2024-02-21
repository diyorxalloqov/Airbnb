import 'package:airbnb___/core/constants/app_icons.dart';
import 'package:airbnb___/modules/explore/ui/shimmer/islands_shimmer.dart';
import 'package:airbnb___/utils/extension/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class ExploreShimmer extends StatefulWidget {
  const ExploreShimmer({super.key});

  @override
  State<ExploreShimmer> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExploreShimmer>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 7, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: context.height * .12,
          title: Column(
            children: [
              const SizedBox(height: 10),
              SizedBox(
                height: context.height * 0.1,
                child: Card(
                    elevation: 5,
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(vertical: 7),
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    child: ListTile(
                      tileColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      leading: Shimmer.fromColors(
                        baseColor: Colors.white24,
                        highlightColor: Colors.grey.shade400,
                        child: const Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                      title: Shimmer.fromColors(
                          baseColor: Colors.white24,
                          highlightColor: Colors.grey.shade400,
                          child: const Text('Where to?')),
                      subtitle: Shimmer.fromColors(
                        baseColor: Colors.white24,
                        highlightColor: Colors.grey.shade400,
                        child: const Text(
                          "Anywheare • Any week • Add guests",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                    )),
              ),
              const SizedBox(height: 10)
            ],
          ),
          actions: [
            Shimmer.fromColors(
              baseColor: Colors.white24,
              highlightColor: Colors.grey.shade400,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    color: Colors.white,
                    shape: BoxShape.circle),
                padding: const EdgeInsets.all(10),
                child: Center(
                    child: SvgPicture.asset(AppIcons.equalizer, width: 20)),
              ),
            ),
            const SizedBox(width: 20)
          ],
          bottom: PreferredSize(
              preferredSize: const Size(double.infinity, 70),
              child: Expanded(
                  child: TabBar(
                      indicator: const BoxDecoration(),
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      controller: _tabController,
                      dividerColor: Colors.grey,
                      tabs: [
                    Shimmer.fromColors(
                      baseColor: Colors.white24,
                      highlightColor: Colors.grey.shade400,
                      child: Tab(
                          icon: SvgPicture.asset(AppIcons.island, width: 30),
                          text: 'Islands'),
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.white24,
                      highlightColor: Colors.grey.shade400,
                      child: Tab(
                          icon: SvgPicture.asset(AppIcons.arctic, width: 30),
                          text: 'Arctic'),
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.white24,
                      highlightColor: Colors.grey.shade400,
                      child: Tab(
                          icon:
                              SvgPicture.asset(AppIcons.amaingPools, width: 30),
                          text: 'Amazing pools'),
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.white24,
                      highlightColor: Colors.grey.shade400,
                      child: Tab(
                          icon: SvgPicture.asset(AppIcons.caves, width: 30),
                          text: 'Caves'),
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.white24,
                      highlightColor: Colors.grey.shade400,
                      child: Tab(
                          icon: SvgPicture.asset(AppIcons.tropical, width: 30),
                          text: 'Tropical'),
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.white24,
                      highlightColor: Colors.grey.shade400,
                      child: Tab(
                          icon: SvgPicture.asset(AppIcons.casas, width: 30),
                          text: 'Casas particulares'),
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.white24,
                      highlightColor: Colors.grey.shade400,
                      child: Tab(
                          icon: SvgPicture.asset(AppIcons.shepherd, width: 30),
                          text: "Shepherd's huts"),
                    ),
                  ]))),
        ),
        body: const IslandsShimmer());
  }
}
