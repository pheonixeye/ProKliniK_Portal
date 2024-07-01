import 'package:flutter/material.dart';
import 'package:portal/pages/homepage/widgets/home_list_widgets.dart';
import 'package:portal/pages/homepage/widgets/language_btn.dart';
import 'package:portal/pages/homepage/widgets/nav_bar.dart';
import 'package:portal/providers/scroll_px.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PxScroll>(
      builder: (context, s, _) {
        return Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: NavBar(),
          ),
          body: ScrollablePositionedList.builder(
            itemScrollController: s.controller,
            itemBuilder: (context, index) {
              return HomeWidgetsList.widgets(context)[index];
            },
            itemCount: HomeWidgetsList.widgets(context).length,
          ),
          floatingActionButton: const LanguageBtn(),
        );
      },
    );
  }
}
