import 'package:airbnb___/modules/explore/ui/explore_page.dart';
import 'package:airbnb___/modules/inbox/ui/inbox_page.dart';
import 'package:airbnb___/modules/profile/ui/profile_page.dart';
import 'package:airbnb___/modules/trips/ui/trips_page.dart';
import 'package:airbnb___/modules/wishlist/ui/wishlist_page.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _currentIndex = 0;
  final List<Widget> _screens = const [
    ExplorePage(),
    WishListPage(),
    TripsPage(),
    InboxPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle:
            const TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
        backgroundColor: Colors.white,
        fixedColor: Colors.red,
        selectedLabelStyle:
            const TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
        onTap: (v) {
          _currentIndex = v;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: 'Wishlists'),
          BottomNavigationBarItem(
              icon: Icon(Icons.travel_explore), label: 'Trips'),
          BottomNavigationBarItem(
              icon: Icon(Icons.messenger_outline), label: 'Inbox'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_pin), label: 'Log in'),
        ],
      ),
    );
  }
}
