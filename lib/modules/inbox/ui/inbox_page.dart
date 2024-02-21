

import 'package:flutter/material.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({super.key});

  @override
  State<InboxPage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<InboxPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("InboxPage"),
      ),
    );
  }
}
