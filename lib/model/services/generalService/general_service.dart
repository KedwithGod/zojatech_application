import '../../utilities/imports/general_import.dart';

class NetworkService {
  static const int timeoutDuration = 30; // Timeout duration in seconds

  final Map<String, String>? headers;

  NetworkService({this.headers});

  Future<GeneralResponse<T>> getRequest<T>(
      String endpoint, T Function(dynamic) create) async {
    try {
      final response =
          await get(Uri.parse('${baseUrl()}$endpoint'), headers: headers ?? {})
              .timeout(const Duration(seconds: timeoutDuration));
      return _handleResponse(response, create);
    } on SocketException {
      throw Exception(
          jsonEncode({"title": 'Network Error', 'message': networkError}));
    } on TimeoutException {
      throw Exception(connectionTimeoutString);
    }
  }

  Future<GeneralResponse<T>> postRequest<T>(String endpoint,
      Map<String, dynamic> body, T Function(dynamic) create) async {
    try {
      debugPrint('${baseUrl()}$endpoint');
      final response = await post(Uri.parse('${baseUrl()}$endpoint'),
              headers: headers ?? {}, body: json.encode(body))
          .timeout(const Duration(seconds: timeoutDuration));

      return _handleResponse(response, create);
    } on SocketException {
      throw Exception(
          jsonEncode({"title": 'Network Error', 'message': networkError}));
    } on TimeoutException {
      throw Exception(connectionTimeoutString);
    }
  }

  Future<GeneralResponse<T>> putRequest<T>(String endpoint,
      Map<String, dynamic> body, T Function(dynamic) create) async {
    try {
      final response = await put(Uri.parse('${baseUrl()}$endpoint'),
              headers: headers ?? {}, body: json.encode(body))
          .timeout(const Duration(seconds: timeoutDuration));
      return _handleResponse(response, create);
    } on SocketException {
      throw Exception(
          jsonEncode({"title": 'Network Error', 'message': networkError}));
    } on TimeoutException {
      throw Exception(connectionTimeoutString);
    }
  }

  Future<GeneralResponse<T>> deleteRequest<T>(
      String endpoint, T Function(dynamic) create) async {
    try {
      final response = await delete(Uri.parse('${baseUrl()}$endpoint'),
              headers: headers ?? {})
          .timeout(const Duration(seconds: timeoutDuration));
      return _handleResponse(response, create);
    } on SocketException {
      throw Exception(
          jsonEncode({"title": 'Network Error', 'message': networkError}));
    } on TimeoutException {
      throw Exception(connectionTimeoutString);
    }
  }

  GeneralResponse<T> _handleResponse<T>(
      Response response, T Function(dynamic) create) {
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      if (jsonResponse['code'] == 0) {
        return GeneralResponse<T>.fromJson(jsonResponse, create);
      } else {
        throw Exception(jsonEncode({
          "title": jsonResponse['title'],
          'message': jsonResponse['message']
        }));
      }
    } else {
      final jsonResponse = json.decode(response.body);
      throw Exception(jsonEncode({
        "title": jsonResponse['title'],
        'message': jsonResponse['message']
      }));
    }
  }
}
