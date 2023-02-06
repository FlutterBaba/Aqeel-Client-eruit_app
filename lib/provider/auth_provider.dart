import 'dart:io';
import 'package:eruit_app/models/create_user.dart';
import 'package:eruit_app/models/get_order_status_model.dart';
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
import '../models/order_model.dart';

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
    await getOrderStatusList();
    await getOrders();
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
      isLoginLoadding = false;
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

  fatchChangePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
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
      print(newPassword);
      print(oldPassword);
      var value = json.decode(response.body);
      List<dynamic> error = value["Messages"];
      return Fluttertoast.showToast(msg: error[0]);
    } else if (response.statusCode == 400) {
      var value = json.decode(response.body);
      List<dynamic> error = value["Messages"];
      return Fluttertoast.showToast(msg: error[0]);
    } else {
      throw Exception('Failed to create album.');
    }
  }

//Deactivate User :
  deleteUserAccount() async {
    final response = await http.post(
      Uri.parse("http://54.74.47.46:82/AccountMob/DeactiveUser"),
      headers: <String, String>{
        "Content-Type": "application/json; charset=utf-8",
        "Authorization": "Bearer $bearerToken",
      },
    );
    if (response.statusCode == 200) {
      var value = json.decode(response.body);
      List<dynamic> error = value["Messages"];
      return Fluttertoast.showToast(msg: error[0]);
    } else if (response.statusCode == 400) {
      var value = json.decode(response.body);
      List<dynamic> error = value["Messages"];
      return Fluttertoast.showToast(msg: error[0]);
    } else {
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
        print(profileModel!.profilePic);
        print(value);
        notifyListeners();
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

  ///  update profile

  updateProfile({
    required String userName,
    required File image,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
  }) async {
    var stream = http.ByteStream(DelegatingStream.typed(image.openRead()));
    var length = await image.length();
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=utf-8",
      "Authorization": "Bearer $bearerToken",
    };
    var uri = Uri.parse("http://54.74.47.46:82/UserMob/UpdateUserMobProfile");
    var request = http.MultipartRequest("POST", uri);
    var multipartFileSign = http.MultipartFile(
      'ProfilePic',
      stream,
      length,
      filename: basename(image.path),
    );
    request.files.add(multipartFileSign);
    request.headers.addAll(headers);
    request.fields['UserName'] = userName.toString();
    request.fields['FirstName'] = firstName.toString();
    request.fields['LastName'] = lastName.toString();
    request.fields['EmailId'] = email.toString();
    request.fields['Phone'] = phone.toString();
    request.fields['Language'] = 'English';
    var response = await request.send();
    if (response.statusCode == 200) {
      String? errorResponse =
          await response.stream.transform(utf8.decoder).first;
      var value = json.decode(errorResponse);
      List<dynamic> error = value["Messages"];
      return Fluttertoast.showToast(msg: error[0]);
    }
    if (response.statusCode == 400) {
      String? errorResponse =
          await response.stream.transform(utf8.decoder).first;
      var value = json.decode(errorResponse);
      List<dynamic> error = value["Messages"];
      return Fluttertoast.showToast(msg: error[0]);
    }
  }

  //    done

  TextEditingController name = TextEditingController();
  TextEditingController address1 = TextEditingController();
  TextEditingController telephone1 = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController telephone2 = TextEditingController();
  TextEditingController email1 = TextEditingController();
  int terms = 0;
  String orderStatus = "Quotation";
  int agent = 0;
  TextEditingController eventLocation = TextEditingController();
  int event = 0;
  int hall = 0;
  int menu = 0;
  int server = 0;
  yaqoobFunction() async {
    final response = await http.post(
      Uri.parse("http://54.74.47.46:82/OrderMob/SaveOrderData"),
      headers: <String, String>{
        "Content-Type": "application/json; charset=utf-8",
        "Authorization": "Bearer $bearerToken",
      },
      body: jsonEncode(<dynamic, dynamic>{
        "status": orderStatus == "Order Status" ? "" : orderStatus,
        "event": event,
        "EventLocation": eventLocation.text,
        "agent": agent,
        "date_order": "2022-01-06T00:00:00",
        "last_update": "2023-01-31T00:00:00",
        "telephon1": telephone2.text,
        "contact": contact.text,
        "email1": email.text,
        // "IsRemind": false,
        // "HallName": "Yaqoob Hall",
        // "LastUser": "ChonAlax225",
        // "add_common": 0.00,
        // "num_portions": 0,
        // "possible_postions": 0,
        // "addition_1": 0.00,
        // "cost_1": 0.00,
        // "min_postions": 0,
        // "practical": 0,
        // "duty_hist": 0.00,
        // "discount_2": 0.00,
        // "date_finish": "2023-01-13T00:00:00",
        // "sum_total": 0.0,
        // "NextOrder": 123454,
        // "PreviousOrder": 123452,
        // "colorHexa": "#8db3e2",
        "Booking": {
          "name": name.text,
          "address_1": address1.text,
          "telefon_1": telephone1.text,
          "email_adress": email.text,
          "terms": terms,
          "num": phone.text,
          "picture": ""
        },
        "Events": [
          {
            "date_event": "2021-11-10T00:00:00",
            "from_date": "2021-11-10T00:00:00",
            "to_date": "2021-11-10T00:00:00",
            "from_time": "08:00:00",
            "to_time": "09:00:00",
            "HallName": "Yaqoob Hall",
            "MenuName": "תפריט השף חיים כהן",
            "ServerName": "בוצע",
            "hall": 4,
            "menu": 3,
            "server": 1,
            "Commission": 10.00,
            "editEventFlag": true
          }
        ]
      }),
    );
    if (response.statusCode == 200) {
      var value = json.decode(response.body);
      print(value["Data"]);
      List<dynamic> error = value["Messages"];
      return Fluttertoast.showToast(msg: error[0]);
    } else if (response.statusCode == 400) {
      var value = json.decode(response.body);
      List<dynamic> error = value["Messages"];
      return Fluttertoast.showToast(msg: error[0]);
    }
  }

//GetHedate And Day Event By Date

  String? hebdate;
  String? dayEvent;

  getHedateAndDayEventByDate({required date}) async {
    final response = await http.get(
      Uri.parse(
        "http://54.74.47.46:82/OrderMob/GetHebdateAndDayEvent?FromDate=$date",
      ),
      headers: <String, String>{
        "Content-Type": "application/json; charset=utf-8",
        "Authorization": "Bearer $bearerToken",
      },
    );
    if (response.statusCode == 200) {
      var value = json.decode(response.body);
      hebdate = value["Data"]["Hebdate"];
      dayEvent = value["Data"]["dayEvent"];
      notifyListeners();
    }
  }

  ///   	•	Get Order Status list

  List<GetOrderStatusModel> statuslist = [];

  getOrderStatusList() async {
    List<GetOrderStatusModel> newList = [];
    final response = await http.get(
      Uri.parse("http://54.74.47.46:82/QuickSelect/GetOrderStatus"),
      headers: <String, String>{
        "Content-Type": "application/json; charset=utf-8",
        "Authorization": "Bearer $bearerToken",
      },
    );
    if (response.statusCode == 200) {
      var value = json.decode(response.body);
      List data = value["Data"];
      for (var element in data) {
        GetOrderStatusModel getOrderStatusModel =
            GetOrderStatusModel.fromJson(element);
        newList.add(getOrderStatusModel);
      }
      statuslist = newList;
      notifyListeners();
    }
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

  ///  get Order Details
  ///
  List<OrderModel> orderslist = [];
  getOrders() async {
    List<OrderModel> newList = [];
    final response = await http.post(
      Uri.parse("http://54.74.47.46:82/Order/GetOrders"),
      headers: <String, String>{
        "Content-Type": "application/json; charset=utf-8",
        "Authorization": "Bearer $bearerToken",
      },
      body: jsonEncode(<dynamic, dynamic>{}),
    );
    if (response.statusCode == 200) {
      var value = json.decode(response.body);
      List data = value["Data"]["entities"];
      print("\n\n\n\n\n.....................................");
      print(data);
      for (var element in data) {
        OrderModel orderModel = OrderModel.fromJson(element);
        newList.add(orderModel);
      }
      orderslist = newList;
      notifyListeners();
    }
  }
}
