// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get consoleTitle => 'Termux Controller';

  @override
  String get console => 'Terminal';

  @override
  String get settingTitle => 'Setting Central';

  @override
  String get setting => 'Setting';

  @override
  String get helloWorld => 'Hello Termux';
}
