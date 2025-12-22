import 'package:flutter/material.dart';
import 'package:flutter_app/src/generated/l10n/app_localizations.dart';

extension ContextExt on BuildContext {
  AppLocalizations get loc { return AppLocalizations.of(this)!; }

  ThemeData get theme => Theme.of(this);

  ColorScheme get colors => Theme.of(this).colorScheme;
}