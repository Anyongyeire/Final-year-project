import 'package:intl/intl.dart';

final ugxFormatter = NumberFormat.simpleCurrency(
  decimalDigits: 0,
  name: 'UGX ',
);

///Formats the date to a string
final dateFormatter = DateFormat('EEEE, dd MMMM yyyy');
