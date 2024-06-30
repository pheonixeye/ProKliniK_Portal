import 'package:flutter/material.dart';
import 'package:portal/models/faq_model.dart';
import 'package:portal/providers/locale_px.dart';
import 'package:provider/provider.dart';

class FaqCard extends StatelessWidget {
  const FaqCard({super.key, required this.faq});
  final Faq faq;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 50,
        vertical: 10,
      ),
      child: Consumer<PxLocale>(
        builder: (context, l, _) {
          return ExpansionTile(
            leading: const CircleAvatar(),
            title: Text(l.isEnglish ? faq.qEn : faq.qAr),
            backgroundColor: Colors.teal.shade100.withOpacity(0.7),
            childrenPadding: const EdgeInsets.all(8),
            children: [
              Text(
                l.isEnglish ? faq.aEn : faq.aAr,
                textAlign: TextAlign.start,
              ),
            ],
          );
        },
      ),
    );
  }
}
