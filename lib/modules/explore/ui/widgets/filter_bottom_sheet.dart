import 'package:flutter/material.dart';

showFilterbottomSheet(BuildContext context) {
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => const BottomSheetPage());
}

class BottomSheetPage extends StatelessWidget {
  const BottomSheetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [],
    ));
  }
}
