import 'package:flutter/material.dart';
import 'package:portal/assets/assets.dart';
import 'package:portal/extensions/loc_ext.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const SizedBox(width: 50),
            Expanded(
              child: Image.asset(Assets.icon),
            ),
            const SizedBox(width: 10),
            const Text(
              "ProKliniK",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      leadingWidth: 200,
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {},
              child: Text(context.loc.home),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {},
              child: Text(context.loc.features),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {},
              child: Text(context.loc.support),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {},
              child: Text(context.loc.about),
            ),
          ),
        ],
      ),
      actions: [
        const SizedBox(width: 10),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: const BorderSide(),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          onPressed: () {},
          label: Text(context.loc.login),
          icon: const Icon(Icons.arrow_forward),
        ),
        const SizedBox(width: 10),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
          ),
          onPressed: () {},
          label: Text(
            context.loc.createAccount,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          icon: const Icon(
            Icons.person_2,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
