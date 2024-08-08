// constants of string
// screen sizing

import '../imports/general_import.dart';

// instantiate classes

// constant strings
const String tokenKey = 'token';
const String imageKey = 'image';
const String securityQuestionSet = 'securityQuestion';
const String offlineModeKey = 'offlineMode';
const String publicUser = 'Public user';

// class initialization
DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
AuthService authService = AuthService();
DatabaseHelper databaseHelper = DatabaseHelper();
// for handling api_call
final networkService = NetworkService();

// error string
const String networkError =
    'Unable to process request, check your network and try again later';
const String undefinedError = 'Error occurred, try gain later';
const String invalidBaseUrl = 'Unable to access host, invalid base url';
const String connectionTimeOutTitle = 'Connection Timeout Error';
const String connectionTimeoutError =
    'The connection has timed out, please try again later.';
String connectionTimeoutString = jsonEncode(
    {"title": connectionTimeOutTitle, 'message': connectionTimeoutError});
const String invalidAccountNumber =
    'The account number you entered is incorrect, kindly check again';
const String notificationRead = "Notification marked as read";
const String assetImagePlaceHolder = "assets/avatar.jpeg";
const String assetImagePlaceHolderRecipient = "assets/avatar2.png";
const String networkImagePlaceHolder =
    "https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250";
const String invalidPassword =
    'Password should contain 1 uppercase, 1 lowecase, alphanumeric character, and one sysmbol, with length grater than 8';
const String invalidEmail = ' Please enter a valid email address.';
const String isEmptyString = " must be filled";
const String serviceUnavailableError = "Service provider not available";

// string for RTS
// savedCard status
const String savedStatus = "Saved";
//
const String success = 'success';
const String failed = 'failed';
const String cardCharge = '5000';

// primary swatch color map
final Map<int, Color> primarySwatchColor = {
  50: green.withOpacity(0.1),
  100: green.withOpacity(0.2),
  200: green.withOpacity(0.3),
  300: green.withOpacity(0.4),
  400: green.withOpacity(0.5),
  500: green.withOpacity(0.6),
  600: green.withOpacity(0.7),
  700: green.withOpacity(0.8),
  800: green.withOpacity(0.9),
  900: green.withOpacity(1.0),
};
