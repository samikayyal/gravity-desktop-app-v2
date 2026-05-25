import 'package:flutter/widgets.dart';
import 'package:gravity_desktop_app_v2/l10n/app_localizations.dart';

extension AppLocalizationLookup on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
