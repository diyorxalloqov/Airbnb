import 'package:airbnb___/modules/explore/bloc/explore_bloc.dart';
import 'package:airbnb___/modules/explore/ui/details/details_page.dart';
import 'package:airbnb___/modules/explore/ui/widgets/products_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AmazingPools extends StatelessWidget {
  const AmazingPools({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(top: 10),
        itemCount: context.read<ExploreBloc>().state.productsModel.length,
        itemBuilder: (context, index) => BlocBuilder<ExploreBloc, ExploreState>(
              builder: (context, state) {
                return ItemWidget(
                    index: index,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailsPage(index: index, state: state)));
                    },
                    isTaxes: false);
              },
            ));
  }
}
