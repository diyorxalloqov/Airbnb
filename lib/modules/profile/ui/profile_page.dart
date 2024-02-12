import 'package:airbnb/modules/auth/auth_page.dart';
import 'package:airbnb/utils/spacer.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your profile',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SpaceHeight(),
            const Text(
              'Log in to start planning your next trip',
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
            const SpaceHeight(),
            const SpaceHeight(),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AuthPage()));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent.shade400,
                    padding: const EdgeInsets.all(4.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: const Center(
                  child: Text(
                    'Log in',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ))
          ],
        ),
      ),
    ));
  }
}
