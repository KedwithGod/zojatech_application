// terms and condition
// const baseSiteUrl = 'http://localhost:8069/';
import '../../imports/general_import.dart';

String siteBaseSiteUrl() {
  if (Platform.isAndroid) {
    return 'http://10.0.2.2:8069/'; // Android emulator's localhost
  } else if (Platform.isIOS) {
    return 'http://localhost:8069/'; // iOS simulator's localhost
  } else {
    return 'http://192.168.1.10:8069/'; // Replace with your machine's local IP address
  }
}

String webSocketBaseSiteUrl(int userId) {
  if (Platform.isAndroid) {
    return 'ws://10.0.2.2:8765?user_id=$userId'; // Android emulator's localhost
  } else if (Platform.isIOS) {
    return 'ws://localhost:8765?user_id=$userId'; // iOS simulator's localhost
  } else {
    return 'ws://localhost:8765?user_id=$userId'; // Replace with your machine's local IP address
  }
}

// external api




 







