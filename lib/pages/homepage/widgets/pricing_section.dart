import 'package:flutter/material.dart';
import 'package:portal/extensions/loc_ext.dart';
import 'package:portal/models/subscription_model.dart';
import 'package:portal/pages/homepage/widgets/pricing_card.dart';
import 'package:portal/providers/locale_px.dart';
import 'package:provider/provider.dart';

class PricingSection extends StatelessWidget {
  const PricingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                                child:
                                    Text(l.isEnglish ? x.titleEn : x.titleAr),
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
    );
  }
}
