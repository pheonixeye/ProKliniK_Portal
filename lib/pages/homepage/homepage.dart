import 'package:flutter/material.dart';
import 'package:portal/extensions/loc_ext.dart';
import 'package:portal/models/faq_model.dart';
import 'package:portal/models/feature_model.dart';
import 'package:portal/pages/homepage/widgets/divider_title.dart';
import 'package:portal/pages/homepage/widgets/faq_card.dart';
import 'package:portal/pages/homepage/widgets/feature_card.dart';
import 'package:portal/pages/homepage/widgets/hero_section.dart';
import 'package:portal/pages/homepage/widgets/language_btn.dart';
import 'package:portal/pages/homepage/widgets/nav_bar.dart';
import 'package:portal/pages/homepage/widgets/pricing_section.dart';
import 'package:portal/pages/homepage/widgets/subscription_type.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: NavBar(),
      ),
      body: ListView(
        children: [
          ///hero
          const HeroSection(),

          ///features
          DividerTitle(
            title: context.loc.better,
            subtitle: context.loc.beyond,
          ),

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
          DividerTitle(
            title: context.loc.transparent,
            subtitle: context.loc.financing,
          ),

          const SubscriptionType(),
          const Divider(),
          const PricingSection(),

          ///faq
          DividerTitle(
            title: context.loc.faq,
          ),

          ...faqs.map((x) {
            return FaqCard(faq: x);
          }),

          ///contact
          DividerTitle(
            title: context.loc.contact,
          ),

          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text("Let's Talk."),
                    Text(
                        "If You Have Any Questions About The Subscription Or Are Not Sure Which Plan is Right For You, Contact Our Team And Let's Schedule A Call."),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              onPressed: () {},
                              child: const ListTile(
                                title: Text(
                                  "Call Us",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                subtitle: Text(
                                  "+201555905768",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    side: const BorderSide()),
                              ),
                              onPressed: () {},
                              child: const ListTile(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 8),
                                title: Text("Email Us"),
                                subtitle: Text("info@ProKliniK.app"),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: const LanguageBtn(),
    );
  }
}
