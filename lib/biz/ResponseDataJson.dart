class ResponseDataJson {
  String message;
  String code;
  var result;

  ResponseDataJson.fromJson(Map<String, dynamic> map)
      : message = map['message'],
        code = map['code'],
        result = map['result'];
}