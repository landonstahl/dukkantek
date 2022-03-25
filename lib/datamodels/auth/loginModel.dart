class LoginModel {
  final String accessToken;
  final String tokenType;
  final bool accountFlag;

  final String statusCode;
  final int httpCode;
  final String message;
  final String description;

  LoginModel(
      {required this.accessToken,
      required this.tokenType,
      required this.accountFlag,
      required this.statusCode,
      required this.httpCode,
      required this.message,
      required this.description});

  LoginModel.fromJson(Map<String, dynamic> map)
      : accessToken = map['data']['accessToken'],
        tokenType = map['data']['tokenType'],
        accountFlag = map['data']['accountFlag'],
        statusCode = map['statusCode'],
        httpCode = map['responseInfo']['httpCode'],
        message = map['responseInfo']['message'],
        description = map['responseInfo']['description'];
}
