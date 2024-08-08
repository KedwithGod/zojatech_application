import '../../imports/general_import.dart';

String baseUrl() {
  if (kIsWeb) {
    return 'http://localhost:8069/api/'; // Replace with your web API URL
  } else if (Platform.isAndroid) {
    return 'http://10.0.0.20:8069/api/'; // Android emulator's localhost
  } else if (Platform.isIOS) {
    return 'http://localhost:8069/api/'; // iOS simulator's localhost
  } else {
    return 'http://127.0.0.1:8069/api/'; // Replace with your machine's local IP address
  }
}

// authentication urls
const String loginUrl = "login";
const String registerUpUrl = "register";
const String logoutUrl = "logout";
const String fetchProductUrl = "fetchProduct";
const String addProductUrl = "addProduct";
const String getProductDetailsUrl = "getProductDetails";
const String updateProductUrl = "updateProduct";
const String deleteProductUrl = "deleteProduct";
const String transactionUrl = "transaction";
const String disputeUrl = "disputeTransaction";



