import 'package:flutter/material.dart';
import 'package:portal/extensions/is_mobile_context.dart';
import 'package:portal/extensions/loc_ext.dart';
import 'package:portal/models/faq_model.dart';
import 'package:portal/models/feature_model.dart';
import 'package:portal/pages/homepage/widgets/contact_div/form_contact.dart';
import 'package:portal/pages/homepage/widgets/contact_div/info_contact.dart';
import 'package:portal/pages/homepage/widgets/divider_title.dart';
import 'package:portal/pages/homepage/widgets/faq_card.dart';
import 'package:portal/pages/homepage/widgets/feature_card.dart';
import 'package:portal/pages/homepage/widgets/footer_div.dart';
import 'package:portal/pages/homepage/widgets/hero_section.dart';
import 'package:portal/pages/homepage/widgets/pricing_section.dart';
import 'package:portal/pages/homepage/widgets/subscription_type.dart';
import 'package:portal/widgets/selective_intrinsic.dart';

class HomeWidgetsList {
  const HomeWidgetsList();

  static List<Widget> widgets(BuildContext context) => [
        const HeroSection(), //0

        ///features //1
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

        ///pricing //7
        DividerTitle(
          title: context.loc.transparent,
          subtitle: context.loc.financing,
        ),

        ///subscription type
        const SubscriptionType(),
        const Divider(),

        ///pricing div //10
        const PricingSection(),

        ///faq // 11
        DividerTitle(
          title: context.loc.faq,
        ),

        ...faqs.map((x) {
          return FaqCard(faq: x);
        }),

        ///contact //18
        DividerTitle(
          title: context.loc.contact,
        ),

        SelectiveIntrinsic(
          child: Flex(
            direction: context.isMobile ? Axis.vertical : Axis.horizontal,
            children: const [
              Spacer(flex: 1),

              ///contact info div
              InfoContact(),
              Spacer(flex: 1),

              ///contact form div
              FormContact(),
              Spacer(flex: 1),
            ],
          ),
        ),

        ///footer
        const Divider(),
        const FooterDiv(),
      ];
}
