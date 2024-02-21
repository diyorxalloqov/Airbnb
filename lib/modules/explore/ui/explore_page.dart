import 'package:airbnb___/core/constants/app_icons.dart';
import 'package:airbnb___/core/constants/server.dart';
import 'package:airbnb___/modules/explore/bloc/explore_bloc.dart';
import 'package:airbnb___/modules/explore/ui/details/google_map.dart';
import 'package:airbnb___/modules/explore/ui/pages/amazing_pools.dart';
import 'package:airbnb___/modules/explore/ui/pages/arctic.dart';
import 'package:airbnb___/modules/explore/ui/pages/casas_particulares.dart';
import 'package:airbnb___/modules/explore/ui/pages/caves.dart';
import 'package:airbnb___/modules/explore/ui/pages/islands.dart';
import 'package:airbnb___/modules/explore/ui/pages/tropical.dart';
import 'package:airbnb___/modules/explore/ui/shimmer/explore_shimmer.dart';
import 'package:airbnb___/modules/explore/ui/widgets/filter_bottom_sheet.dart';
import 'package:airbnb___/utils/extension/size.dart';
import 'package:airbnb___/utils/spacer.dart';
import 'package:airbnb___/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late ExploreBloc exploreBloc;
  @override
  void initState() {
    exploreBloc = ExploreBloc();
    _tabController = TabController(length: _screens.length, vsync: this);
    super.initState();
  }

  final List<String> _icons = [
    AppIcons.island,
    AppIcons.arctic,
    AppIcons.amaingPools,
    AppIcons.caves,
    AppIcons.tropical,
    AppIcons.casas,
    AppIcons.shepherd
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: exploreBloc,
        child: BlocBuilder<ExploreBloc, ExploreState>(
          builder: (context, state) {
            if (state.status == ActionStatus.isLoading) {
              return const ExploreShimmer();
            }
            print(state.status);
            if (state.status == ActionStatus.isSuccess) {
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
                              onTap: () {},
                              tileColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100)),
                              leading: const Icon(
                                Icons.search,
                                color: Colors.black
                              ),
                              title: const Text(
                                "Where to?",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                              subtitle: const Text(
                                "Anywheare • Any week • Add guests",
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            )),
                      ),
                      const SizedBox(height: 10)
                    ],
                  ),
                  actions: [
                    GestureDetector(
                        onTap: () => showFilterbottomSheet(context),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              color: Colors.white,
                              shape: BoxShape.circle),
                          padding: const EdgeInsets.all(10),
                          child: Center(
                              child: SvgPicture.asset(AppIcons.equalizer,
                                  width: 20)),
                        )),
                    const SizedBox(width: 20)
                  ],
                  bottom: PreferredSize(
                      preferredSize: const Size(double.infinity, 70),
                      child: Expanded(
                          child: TabBar(
                              indicatorColor: Colors.black,
                              isScrollable: true,
                              tabAlignment: TabAlignment.start,
                              controller: _tabController,
                              labelColor: Colors.black,
                              dividerColor: Colors.grey,
                              tabs: List.generate(
                                  state.categoryModel.length,
                                  (index) => Tab(
                                        icon: state.categoryModel[index]
                                                    .image ==
                                                null
                                            ? SvgPicture.asset(_icons[index],
                                                width: 30)
                                            : Image.network(
                                                '${Server.server}${state.categoryModel[index].image}',
                                                width: 30),
                                        text: state.categoryModel[index].title,
                                      ))))),
                ),
                body: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    children: _screens),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
                floatingActionButton: _tabController.index == 0
                    ? const SizedBox.shrink()
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FloatingActionButton.extended(
                              backgroundColor: Colors.black,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const GoogleMapPage()));
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100)),
                              label: const Row(
                                children: [
                                  Icon(
                                    Icons.map_outlined,
                                    color: Colors.white,
                                  ),
                                  SpaceWidth(),
                                  Text(
                                    "Map",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )),
                          _tabController.index == 0
                              ? SpaceHeight(height: context.height * 0.06)
                              : const SizedBox.shrink()
                        ],
                      ),
              );
            }
            return Center(child: Text(state.error));
          },
        ));
  }

  final List<Widget> _screens = const [
    Islands(),
    Arctics(),
    AmazingPools(),
    Caves(),
    Tropical(),
    CasasParcticulares(),
    // Shepherd()
  ];
}
