import 'package:flutter/material.dart';
import 'package:portal/extensions/loc_ext.dart';
import 'package:portal/providers/scroll_px.dart';
import 'package:provider/provider.dart';

class NavListBtns extends StatelessWidget {
  const NavListBtns({super.key, this.inFooter = false});
  final bool inFooter;
  @override
  Widget build(BuildContext context) {
    return Consumer<PxScroll>(
      builder: (context, s, _) {
        return Row(
          children: [
            if (inFooter) const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  s.scrollToIndex(0);
                },
                child: Text(context.loc.home),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  s.scrollToIndex(1);
                },
                child: Text(context.loc.features),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  s.scrollToIndex(7);
                },
                child: Text(context.loc.pricing),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  s.scrollToIndex(11);
                },
                child: Text(context.loc.faq),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  s.scrollToIndex(18);
                },
                child: Text(context.loc.contact),
              ),
            ),
            if (inFooter) const Spacer(),
          ],
        );
      },
    );
  }
}
