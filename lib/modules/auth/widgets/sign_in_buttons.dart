
import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  final VoidCallback onTap;
  final String name;
  final Widget icon;
  const SignInButton(
      {super.key, required this.onTap, required this.icon, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(12.0),
              backgroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(10))),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(padding: const EdgeInsets.only(left: 10), child: icon),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(name,
                      style:
                          const TextStyle(color: Colors.black, fontSize: 18)),
                ),
                const SizedBox.shrink(),
              ],
            ),
          )),
    );
  }
}
