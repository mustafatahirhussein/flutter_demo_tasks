import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String get formattedDate => DateFormat.yMd().format(this);
}