import 'package:airbnb___/core/constants/app_icons.dart';
import 'package:airbnb___/core/constants/app_images.dart';
import 'package:airbnb___/utils/extension/size.dart';
import 'package:airbnb___/utils/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

showFilterbottomSheet(BuildContext context) {
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => const BottomSheetPage());
}

class BottomSheetPage extends StatefulWidget {
  const BottomSheetPage({super.key});

  @override
  State<BottomSheetPage> createState() => _BottomSheetPageState();
}

class _BottomSheetPageState extends State<BottomSheetPage> {
  int selectedbedroomsIndex = -1;
  int selectedBedsIndex = -1;
  int selectedBathrommsIndex = -1;
  int selectedTypeIndex = -1;

  bool _isSelected = false;

  int limit = 1;
  bool showMore = false;
  bool showMore1 = false;
  bool showMore2 = false;

  List getVisibleChips() {
    return showMore
        ? essential.values.toList()
        : essential.values.toList().take(limit).toList();
  }

  List getVisibleAccessiblity() {
    return showMore1
        ? accessibility.values.toList()
        : accessibility.values.toList().take(limit).toList();
  }

  List getVisiblelang() {
    return showMore2
        ? host.values.toList()
        : host.values.toList().take(limit).toList();
  }

  Map<String, List<String>> essential = {
    'Essential': ['Wifi', 'Kitchen', 'Washer', 'Dryer'],
    'Features': ['Wifi', 'Kitchen', 'Washer', 'k'],
    'Location': ['Wifi', 'Kitchen', 'Washer', 'd'],
    'Safety': ['Wifi', 'Kitchen', 'Washer', 'Dryer'],
  };

  Map<String, List<String>> accessibility = {
    'Step-free guest entrance': ['Wifi', 'Kitchen', 'Washer', 'Dryer'],
    'Guest entrace winder than 32 inches': ['Wifi', 'Kitchen', 'Washer', 'k'],
    'Step-free path to the guest entrance': ['Wifi', 'Kitchen', 'Washer', 'd'],
  };
  Map<String, List<String>> host = {
    'Essential': ['Wifi', 'Kitchen', 'Washer', 'Dryer'],
    'Features': ['Wifi', 'Kitchen', 'Washer', 'k'],
    'Location': ['Wifi', 'Kitchen', 'Washer', 'd'],
    'Safety': ['Wifi', 'Kitchen', 'Washer', 'Dryer'],
  };

  final List<String> _chipTitle = const [
    "Any",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8+"
  ];

  final List<String> _typeName = const [
    'House',
    'Appartment',
    'Guesthouse',
    'Hotel'
  ];

  bool _isCliked = false;
  bool _isCliked1 = false;
  bool _isCliked2 = false;

  final List<IconData> _icons = const [
    Icons.home_outlined,
    Icons.apartment,
    Icons.house_outlined,
    Icons.hotel
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.95,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: SvgPicture.asset(AppIcons.cancel)),
                  const SpaceWidth(),
                  const Text(
                    'Filters',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Column(
              children: [
                const Divider(),
                const SpaceHeight(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Rooms and beds',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const SpaceHeight(),
                      const Text('Bedrooms'),
                      const SpaceHeight(),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: List.generate(_chipTitle.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: ChoiceChip(
                              label: Text(
                                _chipTitle[index],
                                style: TextStyle(
                                    color: selectedbedroomsIndex == index
                                        ? Colors.white
                                        : Colors.black),
                              ),
                              side: const BorderSide(
                                  color: Colors.grey, width: 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              showCheckmark: false,
                              backgroundColor: const Color(0xFFEBEBEB),
                              selectedColor: Colors.black,
                              onSelected: (value) {
                                setState(() {
                                  if (value) {
                                    selectedbedroomsIndex = index;
                                  } else {
                                    selectedbedroomsIndex = -1;
                                  }
                                });
                              },
                              selected: selectedbedroomsIndex == index,
                            ),
                          );
                        })),
                      ),
                      const SpaceHeight(),
                      const Text('Beds'),
                      const SpaceHeight(),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: List.generate(_chipTitle.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: ChoiceChip(
                              label: Text(
                                _chipTitle[index],
                                style: TextStyle(
                                    color: selectedBedsIndex == index
                                        ? Colors.white
                                        : Colors.black),
                              ),
                              side: const BorderSide(
                                  color: Colors.grey, width: 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              showCheckmark: false,
                              backgroundColor: const Color(0xFFEBEBEB),
                              selectedColor: Colors.black,
                              onSelected: (value) {
                                setState(() {
                                  if (value) {
                                    selectedBedsIndex = index;
                                  } else {
                                    selectedBedsIndex = -1;
                                  }
                                });
                              },
                              selected: selectedBedsIndex == index,
                            ),
                          );
                        })),
                      ),
                      const SpaceHeight(),
                      const Text('Bathrooms'),
                      const SpaceHeight(),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: List.generate(_chipTitle.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: ChoiceChip(
                              label: Text(
                                _chipTitle[index],
                                style: TextStyle(
                                    color: selectedBathrommsIndex == index
                                        ? Colors.white
                                        : Colors.black),
                              ),
                              side: const BorderSide(
                                  color: Colors.grey, width: 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              showCheckmark: false,
                              backgroundColor: const Color(0xFFEBEBEB),
                              selectedColor: Colors.black,
                              onSelected: (value) {
                                setState(() {
                                  if (value) {
                                    selectedBathrommsIndex = index;
                                  } else {
                                    selectedBathrommsIndex = -1;
                                  }
                                });
                              },
                              selected: selectedBathrommsIndex == index,
                            ),
                          );
                        })),
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 25),
                          child: Divider()),
                      const Text('Top-tier stays',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      const SpaceHeight(),
                      GestureDetector(
                        onTap: () {
                          _isSelected = !_isSelected;
                          setState(() {});
                        },
                        child: Container(
                          height: context.height * 0.2,
                          width: double.infinity,
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Colors.black,
                                  width: _isSelected ? 3 : 1)),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.golf_course_sharp),
                              SpaceHeight(),
                              Text('Guest favourite',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),
                              Text(
                                  'the most loved homes on airbnb___,according to guests'),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 25),
                          child: Divider()),
                      const Text('Property type',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      const SpaceHeight(),
                      const SpaceHeight(),
                      Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        spacing: 10,
                        runSpacing: 10,
                        children: List.generate(_typeName.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: ChoiceChip(
                              label: SizedBox(
                                height: context.height * 0.1,
                                width: context.width * 0.3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(_icons[index], size: 30),
                                    const Spacer(),
                                    Text(
                                      _typeName[index],
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              selectedColor: Colors.white10,
                              side: BorderSide(
                                  color: selectedTypeIndex == index
                                      ? Colors.black
                                      : Colors.grey,
                                  width: selectedTypeIndex == index ? 3 : 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              showCheckmark: false,
                              // backgroundColor: const Color(0xFFEBEBEB),
                              onSelected: (value) {
                                setState(() {
                                  if (value) {
                                    selectedTypeIndex = index;
                                  }
                                });
                              },
                              selected: selectedTypeIndex == index,
                            ),
                          );
                        }),
                      ),
                      const SpaceHeight(),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Divider()),
                      Column(
                        children: List.generate(
                          getVisibleChips().length,
                          (index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(essential.keys.toList()[index],
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500)),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        essential.values.toList()[index][index],
                                        style: const TextStyle(fontSize: 20)),
                                    Checkbox(value: true, onChanged: (v) {})
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            showMore = !showMore;
                            setState(() {});
                          },
                          child: Text(
                            showMore ? 'Show less' : 'Show more',
                            style: const TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.underline),
                          )),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Divider()),
                      const Text('Booking options',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      ListTile(
                        title: const Text(
                          'Insant Book',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        subtitle: const Text(
                            'Book without waiting for the host to respond'),
                        trailing: Switch.adaptive(
                          value: _isCliked,
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: Colors.grey,
                          activeThumbImage: const AssetImage(AppImages.tick),
                          overlayColor:
                              const MaterialStatePropertyAll(Colors.black),
                          activeTrackColor: Colors.black,
                          onChanged: (v) {
                            _isCliked = v;
                            setState(() {});
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          'Self check-in',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        subtitle: const Text(
                            'Easy acces to the property once you arrive'),
                        trailing: Switch.adaptive(
                          value: _isCliked1,
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: Colors.grey,
                          activeThumbImage: const AssetImage(AppImages.tick),
                          overlayColor:
                              const MaterialStatePropertyAll(Colors.black),
                          activeTrackColor: Colors.black,
                          onChanged: (v) {
                            _isCliked1 = v;
                            setState(() {});
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          'Allow pets',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        subtitle: const Text('Bringing a service animal?'),
                        trailing: Switch.adaptive(
                          value: _isCliked2,
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: Colors.grey,
                          activeThumbImage: const AssetImage(AppImages.tick),
                          overlayColor:
                              const MaterialStatePropertyAll(Colors.black),
                          activeTrackColor: Colors.black,
                          onChanged: (v) {
                            _isCliked2 = v;
                            setState(() {});
                          },
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Divider()),
                      Column(
                        children: List.generate(
                          getVisibleAccessiblity().length,
                          (index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(accessibility.keys.toList()[index],
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500)),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        accessibility.values.toList()[index]
                                            [index],
                                        style: const TextStyle(fontSize: 20)),
                                    Checkbox(value: true, onChanged: (v) {})
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            showMore1 = !showMore1;
                            setState(() {});
                          },
                          child: Text(
                            showMore1 ? 'Show less' : 'Show more',
                            style: const TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.underline),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
