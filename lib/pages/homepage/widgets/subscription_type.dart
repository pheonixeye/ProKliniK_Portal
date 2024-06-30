import 'package:flutter/material.dart';
import 'package:portal/extensions/loc_ext.dart';
import 'package:portal/providers/pricing_px.dart';
import 'package:provider/provider.dart';

class SubscriptionType extends StatefulWidget {
  const SubscriptionType({super.key});

  @override
  State<SubscriptionType> createState() => _SubscriptionTypeState();
}

class _SubscriptionTypeState extends State<SubscriptionType> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Consumer<PxPricing>(
        builder: (context, p, _) {
          return SwitchListTile(
            title: Row(
              children: [
                Text(context.loc.choosePlan),
                const SizedBox(width: 10),
                Text(
                    "( ${p.isMonthly ? context.loc.monthly : context.loc.yearly} )"),
              ],
            ),
            value: p.isMonthly,
            onChanged: (value) {
              p.swap();
            },
          );
        },
      ),
    );
  }
}
