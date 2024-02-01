import 'package:airbnb/core/constants/app_icons.dart';
import 'package:airbnb/modules/explore/ui/pages/amazing_pools.dart';
import 'package:airbnb/modules/explore/ui/pages/arctic.dart';
import 'package:airbnb/modules/explore/ui/pages/casas_particulares.dart';
import 'package:airbnb/modules/explore/ui/pages/caves.dart';
import 'package:airbnb/modules/explore/ui/pages/islands.dart';
import 'package:airbnb/modules/explore/ui/pages/shepherd.dart';
import 'package:airbnb/modules/explore/ui/pages/tropical.dart';
import 'package:airbnb/modules/explore/ui/widgets/filter_bottom_sheet.dart';
import 'package:airbnb/utils/extension/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
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
              Card(
                  elevation: 5,
                  color: Colors.white,
                  shadowColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  child: ListTile(
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    leading: const Icon(Icons.search),
                    title: const Text(
                      "Where to?",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w400),
                    ),
                    subtitle: const Text(
                      "Anywheare • Any week • Add guests",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  )),
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
                      child: SvgPicture.asset(
                    AppIcons.equalizer,
                    width: 20,
                  )),
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
                      tabs: [
                    Tab(
                        icon: SvgPicture.asset(AppIcons.island, width: 30),
                        text: 'Islands'),
                    Tab(
                        icon: SvgPicture.asset(AppIcons.arctic, width: 30),
                        text: 'Arctic'),
                    Tab(
                        icon: SvgPicture.asset(AppIcons.amaingPools, width: 30),
                        text: 'Amazing pools'),
                    Tab(
                        icon: SvgPicture.asset(AppIcons.caves, width: 30),
                        text: 'Caves'),
                    Tab(
                        icon: SvgPicture.asset(AppIcons.tropical, width: 30),
                        text: 'Tropical'),
                    Tab(
                        icon: SvgPicture.asset(AppIcons.casas, width: 30),
                        text: 'Casas particulares'),
                    Tab(
                        icon: SvgPicture.asset(AppIcons.shepherd, width: 30),
                        text: "Shepherd's huts"),
                  ]))),
        ),
        body: TabBarView(controller: _tabController, children: _screens));
  }

  final List<Widget> _screens = const [
    Islands(),
    Arctics(),
    AmazingPools(),
    Caves(),
    Tropical(),
    CasasParcticulares(),
    Shepherd()
  ];
}
