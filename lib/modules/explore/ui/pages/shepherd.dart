import 'package:airbnb/modules/explore/ui/details/details_page.dart';
import 'package:airbnb/modules/explore/ui/widgets/page_item_widget.dart';
import 'package:flutter/material.dart';

class Shepherd extends StatelessWidget {
  const Shepherd({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(top: 10),
        itemBuilder: (context, index) =>
            ItemWidget(onTap: () {
              Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DetailsPage()));
            }, isTaxes: false));
  }
}
