import 'package:flutter/material.dart';
import 'package:portal/assets/assets.dart';
import 'package:portal/extensions/is_mobile_context.dart';
import 'package:portal/extensions/loc_ext.dart';
import 'package:portal/pages/homepage/widgets/nav_list_btns.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List<Widget> _actions(BuildContext context) => context.isMobile
      ? [
          PopupMenuButton<String>(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Colors.white,
            elevation: 8,
            icon: const Icon(Icons.person_2),
            offset: const Offset(40, 40),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  mouseCursor: SystemMouseCursors.click,
                  child: Row(
                    children: [
                      Text(context.loc.login),
                      const Spacer(),
                      const Icon(Icons.arrow_forward),
                    ],
                  ),
                  onTap: () {
                    //TODO: login link
                  },
                ),
                PopupMenuItem(
                  mouseCursor: SystemMouseCursors.click,
                  child: Row(
                    children: [
                      Text(context.loc.createAccount),
                      const Spacer(),
                      const Icon(Icons.person_2),
                    ],
                  ),
                  onTap: () {
                    //TODO: reg account
                  },
                ),
              ];
            },
          ),
          const SizedBox(width: 10)
        ]
      : [
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
            onPressed: () {
              //TODO: login link
            },
            label: Text(context.loc.login),
            icon: const Icon(Icons.arrow_forward),
          ),
          const SizedBox(width: 10),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
            ),
            onPressed: () {
              //TODO: reg account
            },
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
        ];

  @override
  Widget build(BuildContext context) {
    //TODO: RESPONSIVE
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(width: context.isMobile ? 20 : 50),
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
      title: context.isMobile ? null : const NavListBtns(),
      actions: _actions(context),
    );
  }
}
