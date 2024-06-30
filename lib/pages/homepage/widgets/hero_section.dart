import 'package:flutter/material.dart';
import 'package:portal/assets/assets.dart';
import 'package:portal/extensions/loc_ext.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.scale(
          scaleX: -1,
          child: Image.asset(
            Assets.hero,
            fit: BoxFit.contain,
            matchTextDirection: true,
          ),
        ),
        Positioned(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width / 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 2),
                SelectableText(
                  context.loc.heroTitle,
                  style: const TextStyle(
                    fontSize: 52,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                SelectableText(context.loc.heroSubtitle),
                const Spacer(),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        onPressed: () {},
                        label: Text(
                          context.loc.getStarted,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        icon: const Icon(
                          Icons.arrow_outward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(context.loc.howItWorks),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
