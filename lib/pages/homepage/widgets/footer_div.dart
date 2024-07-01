import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portal/assets/assets.dart';
import 'package:portal/extensions/loc_ext.dart';
import 'package:portal/pages/homepage/widgets/nav_list_btns.dart';

class FooterDiv extends StatelessWidget {
  const FooterDiv({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.blue.shade300,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              const Spacer(),
              Image.asset(
                Assets.icon,
                height: 50,
              ),
              const SizedBox(width: 20),
              const Text(
                "ProKliniK",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
            ],
          ),
          Row(
            children: [
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                child: Text(context.loc.getStarted),
              ),
              const SizedBox(width: 20),
              Text(
                context.loc.learnMore,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
            ],
          ),
          const NavListBtns(inFooter: true),
          Row(
            children: [
              const Spacer(),
              Text.rich(
                TextSpan(
                  text: context.loc.legal,
                  recognizer: TapGestureRecognizer()..onTap = () {},
                  children: [
                    const TextSpan(text: ' '),
                    const TextSpan(text: '@ProKliniK.app'),
                    const TextSpan(text: ' '),
                    TextSpan(text: "${DateTime.now().year}"),
                  ],
                ),
              ),
              const SizedBox(width: 100),
            ],
          ),
        ],
      ),
    );
  }
}
