import 'package:eruit_app/models/create_user.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  bool isSignUpLoadding = false;
  bool isLoginLoadding = false;
  fatchCreateUser(
    CreateUserModel createUserModel,
  ) async {
    isSignUpLoadding = true;
    notifyListeners();
    final response = await http.post(
      Uri.parse('http://54.74.47.46:82/Account/CreateUser'),
      headers: <String, String>{
        "Content-Type": "application/json; charset=utf-8",
      },
      body: jsonEncode(<String, String>{
        "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
        "userName": createUserModel.userName,
        "firstName": createUserModel.firmName,
        "lastName": createUserModel.lastName,
        "firmName": createUserModel.firmName,
        "password": createUserModel.password,
        "email": createUserModel.email,
        "phone": createUserModel.phone,
        "createdOn": DateTime.now().toString(),
        // "2023-01-12T13:46:25.154Z",
      }),
    );
    if (response.statusCode == 200) {
      isSignUpLoadding = false;
      notifyListeners();
      var value = json.decode(response.body);
      List<dynamic> error = value["Messages"];

      return Fluttertoast.showToast(msg: error[0]);
      // return CreateUserModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 400) {
      isSignUpLoadding = false;
      notifyListeners();
      var value = json.decode(response.body);
      List<dynamic> error = value["Messages"];
      return Fluttertoast.showToast(msg: error[0]);
    } else {
      isSignUpLoadding = false;
      notifyListeners();
      throw Exception('Failed to create album.');
    }
  }

// Login Post Data

  fatchLogin({required String userName, required String password}) async {
    isLoginLoadding = true;
    notifyListeners();
    final response = await http.post(
      Uri.parse("http://54.74.47.46:82/Account/Login?firmName=meir_eruit"),
      headers: <String, String>{
        "Content-Type": "application/json; charset=utf-8",
      },
      body: jsonEncode(<String, String>{
        "userName": userName,
        "password": password,
      }),
    );
    if (response.statusCode == 200) {
      isLoginLoadding = false;
      notifyListeners();
      var value = json.decode(response.body);
      List<dynamic> error = value["Messages"];
      return Fluttertoast.showToast(msg: error[0]);
      // return CreateUserModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 400) {
      isLoginLoadding = false;
      notifyListeners();
      var value = json.decode(response.body);
      List<dynamic> error = value["Messages"];
      return Fluttertoast.showToast(msg: error[0]);
    } else {
      isLoginLoadding = false;
      notifyListeners();
      throw Exception('Failed to create album.');
    }
  }
}
