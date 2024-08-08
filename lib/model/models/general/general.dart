class GeneralResponse<T> {
  final int code;
  final bool error;
  final String title;
  final String message;
  final List<T> data;

  GeneralResponse({
    required this.code,
    required this.error,
    required this.title,
    required this.message,
    required this.data,
  });

  factory GeneralResponse.fromJson(
      Map<String, dynamic> json, T Function(dynamic) create) {
    var rawData = json['data'];
    List<T> parsedData = [];
  
    if (rawData is List) {
      for (var item in rawData) {
        if (item is String || item is Map<String, dynamic> || item is List) {
          parsedData.add(create(item));
        } else {
          throw Exception(
              'Unexpected data format in list: ${item.runtimeType}');
        }
      }
    } else {
      parsedData.add(create(rawData));
      // throw Exception('Unexpected data format: ${rawData.runtimeType}');
    }

    return GeneralResponse<T>(
      code: json['code'],
      error: json['error'],
      title: json['title'],
      message: json['message'],
      // data: (json['data'] as List).map((i) => create(i)).toList(),
      data: parsedData,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'error': error,
      'title': title,
      'message': message,
      'data': data.map((i) => (i as dynamic).toJson()).toList(),
    };
  }
}
