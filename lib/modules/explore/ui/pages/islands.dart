import 'package:airbnb/core/constants/app_icons.dart';
import 'package:airbnb/core/constants/app_images.dart';
import 'package:airbnb/modules/explore/ui/details/details_page.dart';
import 'package:airbnb/modules/explore/ui/details/google_map.dart';
import 'package:airbnb/modules/explore/ui/widgets/page_item_widget.dart';
import 'package:airbnb/utils/extension/size.dart';
import 'package:airbnb/utils/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

class Islands extends StatefulWidget {
  const Islands({super.key});

  @override
  State<Islands> createState() => _IslandsState();
}

class _IslandsState extends State<Islands> {
  bool _isCliked = false;
  bool _isShowing = false;
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          _isShowing = true;
        });
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          _isShowing = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ListView.builder(
                  controller: _scrollController,
                  itemCount: 25 + 2,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        color: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: Colors.grey, width: 0.3),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ListTile(
                            title: const Text(
                              'Display total before taxes',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            trailing: Switch.adaptive(
                              value: _isCliked,
                              inactiveThumbColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                              activeThumbImage:
                                  const AssetImage(AppImages.tick),
                              overlayColor:
                                  const MaterialStatePropertyAll(Colors.black),
                              activeTrackColor: Colors.black,
                              onChanged: (v) {
                                _isCliked = v;
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                      );
                    }
                    return ItemWidget(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DetailsPage()));
                        },
                        isTaxes: _isCliked);
                  }),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FloatingActionButton.extended(
                      backgroundColor: Colors.black,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const GoogleMapPage()));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      label: const Row(
                        mainAxisSize: MainAxisSize.min,
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
                  const SpaceHeight(),
                  const SpaceHeight()
                ],
              )
            ],
          ),
        ),
        _isShowing
            ? InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.white,
                      builder: (context) => SizedBox(
                            height: context.height * 0.95,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: SvgPicture.asset(AppIcons.cancel),
                                ),
                                Image(
                                    image: const NetworkImage(
                                        'https://a0.muscache.com/im/pictures/mediaverse/N8AnnouncementCurtainBackgroundLocalizedLarge/original/43ade772-104a-469d-aad9-9c6c8c865c58_ru.jpeg?im'),
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: context.height * 0.5),
                                const SpaceHeight(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Introducing Guest Favourites",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SpaceHeight(),
                                    const Text(
                                      "When you see a Guest Favourite, you'll know it's one of the 2 miilion most loved homes on Airbnb.",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 20),
                                      child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.black,
                                              fixedSize: const Size(
                                                  double.infinity, 50),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          child: const Center(
                                            child: Text(
                                              'Start exploring',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          )),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ));
                },
                child: Container(
                  height: 50,
                  color: Colors.grey.shade100,
                  child: const Center(
                    child: Text("Learn about Guest Favourites"),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
