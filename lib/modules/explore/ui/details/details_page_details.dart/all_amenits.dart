import 'package:airbnb___/modules/explore/bloc/explore_bloc.dart';
import 'package:airbnb___/utils/spacer.dart';
import 'package:flutter/material.dart';

class AmenitsPage extends StatelessWidget {
  final ExploreState state;
  final int index;
  const AmenitsPage({super.key, required this.index, required this.state});

  @override
  Widget build(BuildContext context) {
    print(state.productsModel[index].amenits?.length);
    return Scaffold(
      appBar: AppBar(scrolledUnderElevation: 0),
      body: ListView.builder(
          padding: const EdgeInsets.all(15.0),
          itemCount: (state.productsModel[index].amenits?.length) ?? 0 + 1,
          itemBuilder: (context, index1) {
            if (index == 0) {
              return const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'What this place offers',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SpaceHeight(),
                ],
              );
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.productsModel[index].amenits?[index1].name
                            .toString() ??
                        'fff',
                    style: TextStyle(),
                  ),Text('data')
                ],
              ),
            );
          }),
    );
  }
}
