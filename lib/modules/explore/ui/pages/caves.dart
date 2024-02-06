import 'package:airbnb/modules/explore/ui/widgets/page_item_widget.dart';
import 'package:flutter/material.dart';

class Caves extends StatelessWidget {
  const Caves({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(top: 10),
        itemBuilder: (context, index) =>
            ItemWidget(onTap: () {}, isTaxes: false));
  }
}
