import 'package:flutter/material.dart';
import 'package:portal/core/localization/app_localizations.dart';

extension LocalizedBuildContext on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this);
}
