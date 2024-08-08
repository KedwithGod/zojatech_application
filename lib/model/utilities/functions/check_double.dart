
import '../imports/general_import.dart';

bool checkIfDouble(value) {
   final regex = RegExp(r'^\d+(\.\d+)?$');
  return regex.hasMatch(value);
}

double roundUp(double value, int places) {
  num mod = pow(10.0, places);
  return ((value * mod).ceil().toDouble() / mod);
}
