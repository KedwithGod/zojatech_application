String k_m_b_generator(num number) {
  if (number >= 1000 && number < 1000000) {
    return "${(number / 1000).toStringAsFixed(1)} K";
  } else if (number >= 1000000 && number < 1000000000) {
    return "${(number / 1000000).toStringAsFixed(1)} M";
  } else if (number >= 1000000000) {
    return "${(number / 1000000000).toStringAsFixed(1)} B";
  } else {
    return number.toString();
  }
}


// change month to years plus month
String monthsToYear(int value) {
  if (value == 1) {
    return "1 Month";
  }
  if (value < 12) {
    return "$value Months";
  }
  if (value >= 12) {
    String year = (value / 12).floor().toString();
    int month = value % 12;
    return "$year ${int.parse(year) == 1 ? "Year" : "Years"}${month > 0 ? ", $month ${month == 1 ? "Month" : "Months"}" : ""}";
  } else {
    return "";
  }
}

String formatPhoneNumber(String phoneNumber, {String code = '234'}) {
  String formatted = '';
  if (phoneNumber != "") {
    if (phoneNumber[0] == '0') {
      formatted = code + phoneNumber.substring(1);
    } else {
      formatted = code + phoneNumber;
    }
  }
  return formatted;
}

String formatPhoneNumberBack(String phoneNumber, {String code = '234'}) {
  String formatted = '';
  List splitList = phoneNumber.split(code);
  if (splitList.length == 1) {
    formatted = splitList[0];
  } else {
    formatted = '0' + splitList[1];
  }
  return formatted;
}
