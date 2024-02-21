import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:airbnb___/core/singletons/locator.dart';
import 'package:airbnb___/modules/bottom_nav_bar/bottomNavbar.dart';
import 'package:airbnb___/modules/explore/bloc/explore_bloc.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ExploreBloc())],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavbar(),
      ),
    );
  }
}
