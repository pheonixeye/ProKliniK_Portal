import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portal/assets/assets.dart';
import 'package:portal/extensions/lang_ext.dart';
import 'package:portal/extensions/loc_ext.dart';
import 'package:portal/models/feature_model.dart';
import 'package:portal/models/subscription_model.dart';
import 'package:portal/pages/homepage/widgets/feature_card.dart';
import 'package:portal/pages/homepage/widgets/pricing_card.dart';
import 'package:portal/pages/homepage/widgets/subscription_type.dart';
import 'package:portal/providers/locale_px.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: ListView(
        children: [
          ///hero
          Stack(
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
          ),

          ///features
          const SizedBox(height: 10),
          const Divider(),
          Text(
            context.loc.better,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            context.loc.beyond,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          const Divider(),

          for (int i = 0; i < FEATURES.length; i++)
            if (i == 3)
              FeatureCard(
                feature: FEATURES[i],
                index: i,
                isDark: true,
              )
            else
              FeatureCard(feature: FEATURES[i], index: i),

          ///pricing
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          Text(
            context.loc.transparent,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            context.loc.financing,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          const Divider(),
          const SubscriptionType(),
          const Divider(),
          SingleChildScrollView(
            primary: false,
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.2,
                  child: Card.outlined(
                    elevation: 6,
                    child: Consumer<PxLocale>(
                      builder: (context, l, _) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(context.loc.title),
                            ),
                            const Divider(),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(context.loc.desc),
                            ),
                            const Divider(),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(context.loc.fees),
                            ),
                            const Divider(),
                            ...allFeatures.map((x) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Tooltip(
                                      message: l.isEnglish
                                          ? x.descriptionEn
                                          : x.descriptionAr,
                                      child: Text(
                                          l.isEnglish ? x.titleEn : x.titleAr),
                                    ),
                                  ),
                                  const Divider(),
                                ],
                              );
                            })
                          ],
                        );
                      },
                    ),
                  ),
                ),
                for (int i = 0; i < SUBSCRIPTIONS.length; i++)
                  PricingCard(
                    index: i,
                    subscription: SUBSCRIPTIONS[i],
                  )
              ],
            ),
          ),
          const Divider(),

          ///faq
          const SizedBox(height: 10),
          Text(
            context.loc.faq,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 10,
            ),
            child: ExpansionTile(
              title: Text('Question'),
              children: [
                Text("Answer"),
              ],
              backgroundColor: Colors.teal.shade200,
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          tooltip: context.loc.lang,
          heroTag: 'lang-btn',
          onPressed: () {
            late final String newPath;
            final lang = GoRouter.of(context)
                .routerDelegate
                .currentConfiguration
                .pathParameters['lang'] as String;
            final currentPath = GoRouter.of(context)
                .routerDelegate
                .currentConfiguration
                .uri
                .path;
            if (lang == 'en') {
              newPath = currentPath.replaceAll('/en', '/ar');
            } else {
              newPath = currentPath.replaceAll('/ar', '/en');
            }
            if (kDebugMode) {
              print("current : $currentPath");
              print("new : $newPath");
            }
            context.read<PxLocale>().setLang(lang.switchLang());
            context.read<PxLocale>().setLocale();
            GoRouter.of(context).go(newPath);
          },
          child: const Icon(Icons.language),
        ),
      ),
    );
  }
}
