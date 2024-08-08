// function to format a number with comma
import 'package:intl/intl.dart';

String displayWithComma(String value) {
  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String Function(Match) matchFunc = (Match match) => '${match[1]},';

  // Split the number into integer and decimal parts
  List<String> parts = value.split('.');
  String integerPart = parts[0];
  String decimalPart = parts.length > 1 ? '.${parts[1]}' : '';

  // Format the integer part with commas
  String formattedIntegerPart = integerPart.replaceAllMapped(reg, matchFunc);

  // Combine the formatted integer part and the decimal part
  String result = formattedIntegerPart + decimalPart;

  return result;
}

String? formatAmount(dynamic value,
    {String? sign = '₦', bool enableDecimal = true}) {
  if (value == null) {
    return null;
  } else {
    var formatter = enableDecimal
        ? NumberFormat("#,##0.00", "en_US")
        : NumberFormat("#,##0", "en_US");
    if (value is double) {
      String formattedAmount = formatter.format(value);
      return "$sign$formattedAmount";
    } else {
      double amount = double.parse(value);
      String formattedAmount = formatter.format(amount);
      return "$sign$formattedAmount";
    }
  }
}
