import 'package:flutter/material.dart';

class TripsPage extends StatefulWidget {
  const TripsPage({super.key});

  @override
  State<TripsPage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<TripsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("TripsPage"),
      ),
    );
  }
}
