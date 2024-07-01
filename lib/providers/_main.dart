import 'package:portal/providers/locale_px.dart';
import 'package:portal/providers/pricing_px.dart';
import 'package:portal/providers/scroll_px.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => PxLocale()),
  ChangeNotifierProvider(create: (context) => PxPricing()),
  ChangeNotifierProvider(create: (context) => PxScroll()),
];
