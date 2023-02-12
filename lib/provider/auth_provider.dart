import 'dart:io';
import 'package:eruit_app/models/create_user.dart';
import 'package:eruit_app/models/profile_model.dart';
import 'package:eruit_app/pages/bottom_bar.dart';
import 'package:eruit_app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  bool isSignUpLoadding = false;
  bool isLoginLoadding = false;
  bool isForgotLoadding = false;
  ProfileModel? profileModel;
  String bearerToken = "";

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('accessToken')!;
    bearerToken = token;
    notifyListeners();
    await getUserDetails(); //
  }

  logOut(context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove("accessToken");
    await Fluttertoast.showToast(msg: "Logout");
    await Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }

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
        // "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
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

// fatchLogin Data

  fatchLogin({
    required String firmName,
    required String userName,
    required String password,
    required BuildContext context,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoginLoadding = true;
    notifyListeners();
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
      var value = json.decode(response.body);
      isLoginLoadding = false;
      await prefs.setString("accessToken", value["Data"]);
      notifyListeners();
      if (value["RequestResponse"] == true) {
        getToken();
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const BottomBar(),
        ));
      } else {
        List<dynamic> error = value["Messages"];
        return Fluttertoast.showToast(msg: error[0].toString());
      }
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

// User Forget Password API.

  fatchForgetPassword({
    required String userName,
    required String emailId,
  }) async {
    isForgotLoadding = true;
    notifyListeners();
    final response = await http.post(
      Uri.parse(
          "http://54.74.47.46:82/AccountMob/ForgotPassword?firmName=meir_eruit"),
      headers: <String, String>{
        "Content-Type": "application/json; charset=utf-8",
      },
      body: jsonEncode(<String, String>{
        "userName": userName,
        "emailId": emailId,
      }),
    );
    if (response.statusCode == 200) {
      isForgotLoadding = false;
      notifyListeners();
      var value = json.decode(response.body);
      List<dynamic> error = value["Messages"];
      return Fluttertoast.showToast(msg: error[0]);
      // return CreateUserModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 400) {
      isForgotLoadding = false;
      notifyListeners();
      var value = json.decode(response.body);
      List<dynamic> error = value["Messages"];
      return Fluttertoast.showToast(msg: error[0]);
    } else {
      isForgotLoadding = false;
      notifyListeners();
      throw Exception('Failed to create album.');
    }
  }

  //  Change  password api fatch . in flutter//
  bool isloadingchangePassword = false;
  bool successfulChangePassword = false;
  fatchChangePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    isloadingchangePassword = true;
    notifyListeners();
    final response = await http.post(
      Uri.parse(
          "http://54.74.47.46:82/AccountMob/ChangeUserPassword?firmName=meir_eruit"),
      headers: <String, String>{
        "Content-Type": "application/json; charset=utf-8",
        "Authorization": "Bearer $bearerToken",
      },
      body: jsonEncode(<String, String>{
        "oldPassword": oldPassword,
        "newPassword": newPassword,
      }),
    );
    if (response.statusCode == 200) {
      isloadingchangePassword = false;
      successfulChangePassword = true;
      notifyListeners();
      print(newPassword);
      print(oldPassword);
      var value = json.decode(response.body);
      List<dynamic> error = value["Messages"];
      return Fluttertoast.showToast(msg: error[0]);
    } else if (response.statusCode == 400) {
      isloadingchangePassword = false;
      notifyListeners();
      var value = json.decode(response.body);
      List<dynamic> error = value["Messages"];
      return Fluttertoast.showToast(msg: error[0]);
    } else {
      successfulChangePassword = false;
      isloadingchangePassword = false;
      notifyListeners();
      throw Exception('Failed to create album.');
    }
  }

//Deactivate User :
  bool isDeleteLoading = false;
  bool successfulDelete = false;
  deleteUserAccount() async {
    isDeleteLoading = true;
    notifyListeners();
    final response = await http.post(
      Uri.parse("http://54.74.47.46:82/AccountMob/DeactiveUser"),
      headers: <String, String>{
        "Content-Type": "application/json; charset=utf-8",
        "Authorization": "Bearer $bearerToken",
      },
    );
    if (response.statusCode == 200) {
      isDeleteLoading = false;
      successfulDelete = true;
      notifyListeners();
      var value = json.decode(response.body);
      List<dynamic> error = value["Messages"];

      return Fluttertoast.showToast(msg: error[0]);
    } else if (response.statusCode == 400) {
      isDeleteLoading = false;
      notifyListeners();
      var value = json.decode(response.body);
      List<dynamic> error = value["Messages"];
      return Fluttertoast.showToast(msg: error[0]);
    } else {
      isDeleteLoading = false;
      notifyListeners();
      throw Exception('Failed to create album.');
    }
  }

  //  get User profile

  getUserDetails() async {
    final response = await http.get(
      Uri.parse("http://54.74.47.46:82/UserMob/GetUserMobProfile"),
      headers: <String, String>{
        "Content-Type": "application/json; charset=utf-8",
        "Authorization": "Bearer $bearerToken",
      },
    );
    if (response.statusCode == 200) {
      var value = json.decode(response.body);
      if (value["RequestResponse"] == true) {
        profileModel = ProfileModel.fromJson(value["Data"]);
        notifyListeners();
        print(profileModel!.firstName);
      } else {
        List<dynamic> error = value["Messages"];
        return Fluttertoast.showToast(msg: error[0]);
      }
    } else if (response.statusCode == 400) {
      var value = json.decode(response.body);
      List<dynamic> error = value["Messages"];
      return Fluttertoast.showToast(msg: error[0]);
    } else {
      throw Exception('Failed to create album.');
    }
  }

  File? image;
  TextEditingController profilefirstName = TextEditingController();
  TextEditingController profilelastName = TextEditingController();
  TextEditingController profileuserName = TextEditingController();
  TextEditingController profileemail = TextEditingController();
  TextEditingController profilephone = TextEditingController();

  ///  update profile
  bool isprofileLoadoing = false;
  updateProfile() async {
    getUserDetails();
    print(image);
    isprofileLoadoing = true;
    notifyListeners();
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=utf-8",
      "Authorization": "Bearer $bearerToken",
    };
    var uri = Uri.parse("http://54.74.47.46:82/UserMob/UpdateUserMobProfile");
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(headers);

    if (image == null) {
      request.fields['UserName'] = profileuserName.text;
      request.fields['FirstName'] = profilefirstName.text;
      request.fields['LastName'] = profilelastName.text;
      request.fields['EmailId'] = profileemail.text;
      request.fields['Phone'] = profilephone.text;
      request.fields['Language'] = 'English';
    } else {
      var stream = http.ByteStream(DelegatingStream.typed(image!.openRead()));
      var length = await image!.length();
      var multipartFileSign = http.MultipartFile(
        'ProfilePic',
        stream,
        length,
        filename: basename(image!.path),
      );
      request.files.add(multipartFileSign);
      request.fields['UserName'] = profileuserName.text;
      request.fields['FirstName'] = profilefirstName.text;
      request.fields['LastName'] = profilelastName.text;
      request.fields['EmailId'] = profileemail.text;
      request.fields['Phone'] = profilephone.text;
      request.fields['Language'] = 'English';
    }

    var response = await request.send();
    if (response.statusCode == 200) {
      isprofileLoadoing = false;
      notifyListeners();
      String? errorResponse =
          await response.stream.transform(utf8.decoder).first;
      var value = json.decode(errorResponse);
      List<dynamic> error = value["Messages"];
      return Fluttertoast.showToast(msg: error[0]);
    }
    if (response.statusCode == 400) {
      isprofileLoadoing = false;
      notifyListeners();
      String? errorResponse =
          await response.stream.transform(utf8.decoder).first;
      var value = json.decode(errorResponse);
      List<dynamic> error = value["Messages"];
      return Fluttertoast.showToast(msg: error[0]);
    }
    isprofileLoadoing = false;
    notifyListeners();
  }

  ///  ------------------------------------------------------------------------------------------------------------------------
  // Save Order Summary Details :
  bool isordersummaryloding = false;
  TextEditingController addCommon = TextEditingController(text: "0.00");
  TextEditingController numCommon = TextEditingController();
  TextEditingController possiblePortions = TextEditingController();
  TextEditingController addition1 = TextEditingController();
  TextEditingController lastUser = TextEditingController();
  TextEditingController text1 = TextEditingController();

  saveOrderSummary() async {
    isordersummaryloding = true;
    notifyListeners();
    final response = await http.post(
        Uri.parse("http://54.74.47.46:82/OrderMob/SaveOrderSummary"),
        headers: <String, String>{
          "Content-Type": "application/json; charset=utf-8",
          "Authorization": "Bearer $bearerToken",
        },
        body: jsonEncode(<dynamic, dynamic>{
          "order": 124275,
          "add_common": addCommon.text,
          "num_portions": numCommon.text,
          "possible_portions": possiblePortions.text,
          "addition_1": addition1.text,
          "last_user": "Yaqoob",
          "cost_1": 0,
          "min_portions": 0,
          "practical": 0,
          "duty_hist": 0,
          "isIncludeVAT": true,
          "discount_2": 0,
          "add_portion": 0,
          "hist_dollar": 0,
          "discount_percent": 0,
          "add_sum": 0,
          "changeColumn": "string",
          "date_finish": "2023-01-13T05:47:34.821Z",
          "text_1": "string",
          "sum_total": 0
        }));
    if (response.statusCode == 200) {
      isordersummaryloding = false;
      notifyListeners();
      var value = json.decode(response.body);
      print(value);
    } else if (response.statusCode == 400) {
      isordersummaryloding = true;
      notifyListeners();
    }
  }
}
