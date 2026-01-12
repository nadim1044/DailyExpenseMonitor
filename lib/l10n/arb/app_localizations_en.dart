// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app_title => 'Expense Manager';

  @override
  String get transactions => 'Transactions';

  @override
  String get add_transactions => 'Add Transactions';

  @override
  String get transaction_details => 'Transaction Details';

  @override
  String get transaction_id => 'Transaction ID';

  @override
  String get date => 'Date';

  @override
  String get time => 'Time';
}
