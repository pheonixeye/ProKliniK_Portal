import 'package:flutter/material.dart';
import 'package:portal/extensions/loc_ext.dart';
import 'package:portal/models/faq_model.dart';
import 'package:portal/models/feature_model.dart';
import 'package:portal/pages/homepage/widgets/divider_title.dart';
import 'package:portal/pages/homepage/widgets/faq_card.dart';
import 'package:portal/pages/homepage/widgets/feature_card.dart';
import 'package:portal/pages/homepage/widgets/hero_section.dart';
import 'package:portal/pages/homepage/widgets/language_btn.dart';
import 'package:portal/pages/homepage/widgets/map_view.dart';
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
              const Spacer(flex: 1),

              ///contact info div
              Expanded(
                flex: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.loc.letsTalk,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Text(context.loc.haveQuestions),
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            onPressed: () {},
                            child: ListTile(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              title: Text(
                                context.loc.callUs,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              subtitle: const Text(
                                "+201555905768",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  side: const BorderSide()),
                            ),
                            onPressed: () {},
                            child: ListTile(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              title: Text(context.loc.emailUs),
                              subtitle: const Text("info@ProKliniK.app"),
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 4),
                      leading: const Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                      ),
                      title: Text(context.loc.visitHelpCenter),
                    ),
                    const SizedBox(height: 10),
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 4),
                      leading: const Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                      ),
                      isThreeLine: true,
                      title: Text(context.loc.visitUsPersonally),
                      subtitle: Text.rich(
                        TextSpan(
                          text: '',
                          children: [
                            TextSpan(text: "${context.loc.addressOne}\n"),
                            TextSpan(text: "${context.loc.addressTwo}\n"),
                            TextSpan(text: "${context.loc.addressThree}\n"),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const MapViewContainer()
                  ],
                ),
              ),
              const Spacer(flex: 1),
              Expanded(
                flex: 10,

                ///contact form
                child: Card.outlined(
                  elevation: 6,
                  color: Colors.amber.shade100,
                  child: Form(
                    key: GlobalKey<FormState>(debugLabel: "TODO"),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            context.loc.contact,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(context.loc.plansToPowerBus),
                        ),
                        const SizedBox(height: 10),
                        ListTile(
                          title: Text(
                            context.loc.existingCustomer,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Row(
                            children: [
                              Expanded(
                                child: RadioListTile(
                                  title: Text(context.loc.yes),
                                  value: "yes",
                                  groupValue: null,
                                  onChanged: (value) {},
                                ),
                              ),
                              Expanded(
                                child: RadioListTile(
                                  title: Text(context.loc.no),
                                  value: "no",
                                  groupValue: null,
                                  onChanged: (value) {},
                                ),
                              ),
                              Expanded(
                                child: RadioListTile(
                                  title: Text(context.loc.onTrial),
                                  value: "ontrial",
                                  groupValue: null,
                                  onChanged: (value) {},
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        ListTile(
                          title: Text("${context.loc.fullName} *"),
                          subtitle: TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ListTile(
                          title: Text("${context.loc.email} *"),
                          subtitle: TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ListTile(
                          title: Text("${context.loc.phone} *"),
                          subtitle: TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ListTile(
                          title: Text("${context.loc.helpYouWith} *"),
                          subtitle: SizedBox(
                            height: 200,
                            child: TextFormField(
                              expands: true,
                              maxLines: null,
                              minLines: null,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        side: const BorderSide()),
                                  ),
                                  onPressed: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(24.0),
                                    child: Text(context.loc.contact),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 1),
            ],
          ),
        ],
      ),
      floatingActionButton: const LanguageBtn(),
    );
  }
}
