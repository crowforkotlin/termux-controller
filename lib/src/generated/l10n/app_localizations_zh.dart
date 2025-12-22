// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get consoleTitle => 'Termux 控制器';

  @override
  String get console => '控制台';

  @override
  String get settingTitle => '设置中心';

  @override
  String get setting => '设置';

  @override
  String get helloWorld => '你好 Termux';
}
