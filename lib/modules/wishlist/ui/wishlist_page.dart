import 'package:flutter/material.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<WishListPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("WishListPage"),
      ),
    );
  }
}
