import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../datamodels/auth/loginModel.dart';
import '../constants/serviceConstants.dart';

class LoginApi {
  Future<LoginModel> loginApi(BuildContext context, String passedUserName,
      String passedPassword) async {
    String url = '${baseUrl}auth/login';

    Map data = {
      "userName": passedUserName,
      "password": passedPassword,
    };

    String body = json.encode(data);

    http.Response response = await http.post(Uri.parse(url),
        headers: {"Basic-Auth": basicAuth, "Content-Type": "application/json"},
        body: body);

    return LoginModel.fromJson(jsonDecode(response.body));
  }
}
