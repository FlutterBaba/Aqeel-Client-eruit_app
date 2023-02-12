import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginProvider with ChangeNotifier {
  bool _loginLoading = false;
  bool get loading => _loginLoading;

  void loginLoad(bool loading) {
    _loginLoading = loading;
    notifyListeners();
  }

  getlogindata({
    required String firmName,
    required String userName,
    required String password,
    required BuildContext context,
  }) async {
    loginLoad(true);
    final response = await http.post(
      Uri.parse("http://54.74.47.46:82/Account/Login?firmName=$firmName"),
      headers: <String, String>{
        "Content-Type": "application/json; charset=utf-8",
      },
      body: jsonEncode(<String, String>{
        "userName": userName,
        "password": password,
      }),
    );
    if (response.statusCode == 200) {
      loginLoad(false);

      var value = json.decode(response.body);
      if (value["RequestResponse"] == true) {
      } else {
        List<dynamic> error = value["Messages"];
        return Fluttertoast.showToast(msg: error[0].toString());
      }
    } else if (response.statusCode == 400) {
      loginLoad(false);
      var value = json.decode(response.body);
      List<dynamic> error = value["Messages"];
      return Fluttertoast.showToast(msg: error[0]);
    } else {
      loginLoad(false);
      throw Exception('Failed to create album.');
    }
  }
}
