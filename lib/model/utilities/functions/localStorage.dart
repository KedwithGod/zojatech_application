import '../imports/general_import.dart';

class LocalStorage {
//set String into shared preferences like this
  static Future<bool> setInt(String key, int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value).then((value) {
      if (kDebugMode) {
        print("value from shared preferenceWidget");
      }
    });
    return true;
  }

//get String value from shared preferences
  static Future<int?> getInt(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    int? storage;
    storage = pref.getInt(key) ?? 0;
    return storage;
  }

//set bool into shared preferences like this
  static Future<bool> setBool(String key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value).then((value) {
      if (kDebugMode) {
        print("value from shared preferenceWidget");
      }
    });
    return true;
  }

//get bool value from shared preferences
  static Future<bool?> getBool(String? key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    bool? storage;
    storage = pref.getBool(key!);
    return storage;
  }

  //set bool into shared preferences like this
  static Future<bool> setString(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value).then((value) {
      if (kDebugMode) {
        print("value from shared preferenceWidget for $key");
      }
    });
    return true;
  }

//get bool value from shared preferences
  static Future<String?> getString(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? storage;
    storage = pref.getString(key) ?? "";
    return storage;
  }

  //clear Preferences preferences
  static Future<bool?> clear() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    bool? cleared;
    cleared = await pref.clear();
    return cleared;
  }
}

Future<String?> getLongBase64String(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // Retrieve the number of chunks
  int? chunkCount = prefs.getInt('${key}_chunkCount');
  if (chunkCount == null) {
    return null;
  }

  // Retrieve and concatenate all chunks
  StringBuffer base64StringBuffer = StringBuffer();
  for (int i = 0; i < chunkCount; i++) {
    String? chunk = prefs.getString('$key$i');
    if (chunk == null) {
      return null; // If any chunk is missing, return null
    }
    base64StringBuffer.write(chunk);
  }
  printLongString(base64StringBuffer.toString());
  return base64StringBuffer.toString();
}

// Convert Base64 string to Uint8List
Uint8List convertBase64StringToUint8List(String base64String) {
  return base64.decode(base64String);
}
