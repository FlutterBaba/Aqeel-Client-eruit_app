import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../../models/get_order_details_model.dart';
import '../../models/get_order_status_model.dart';
import '../../models/get_orders_model.dart';
import '../../pages/events.dart';

class OrderProvider with ChangeNotifier {
  ///  	•	Get Order list :
  String bearerToken =
      "eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJGaXJtTmFtZSI6Im1laXJfZXJ1aXQiLCJVc2VybmFtZSI6IkNob25BbGF4MjI1IiwiUGFzc3dvcmQiOiIralJncHFucG9yVnBSYUpxK1pISHRnPT0iLCJEYXRhYmFzZU5hbWUiOiJFcnVpdDA4MDUyMDE5IiwiVXNlcklkIjoiNjc2OGNlYTctMjBmZS00ODYzLThmY2EtMDhjMjUzYWZlOTcwIiwiZXhwIjoxNjc2MTk0MTgwLCJpc3MiOiJlcnAuZXJ1aXQuY28uaWwiLCJhdWQiOiJlcnAuZXJ1aXQuY28uaWwifQ.RGQqp1jv0f_DvSkxop8FB3WNC1gAP5Dis3uaIoVsCls";
  List<GetOrdersModel> getorderlist = [];
  Future<List<GetOrdersModel>> getOrders(
      TextEditingController dateInputController) async {
    final response = await http.post(
      Uri.parse("http://54.74.47.46:82/Order/GetOrders"),
      headers: <String, String>{
        "Content-Type": "application/json; charset=utf-8",
        "Authorization": "Bearer $bearerToken",
      },
      body: jsonEncode(<String, dynamic>{}),
    );
    var body = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in body["Data"]["entities"]) {
        getorderlist.add(GetOrdersModel.fromJson(i));
      }
      print(body["Data"]["totalCount"]);

      return getorderlist;
    } else {
      return getorderlist;
    }
  }

//   Create Order Hare ////

  final TextEditingController name = TextEditingController();
  final TextEditingController address1 = TextEditingController();
  final TextEditingController telephone1 = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController contact = TextEditingController();
  final TextEditingController telephone2 = TextEditingController();
  final TextEditingController email1 = TextEditingController();
  TextEditingController fromDate = TextEditingController();
  var toTime = TimeOfDay.now();
  var fromTime = TimeOfDay.now();
  int terms = 0;
  int agent = 0;
  String orderStatus = "Quotation";
  TextEditingController eventLocation = TextEditingController();
  int event = 0;
  int hall = 0;
  int menu = 0;
  int server = 0;
  var orderDate = DateFormat.yMd().add_jm().format(DateTime.now());
  bool orderloading = false;

  eventValidation() {
    int hallvalue = hall - 1;
    int menuValue = menu - 1;
    int serverValue = server - 1;
    if (hallvalue == -1) {
      return Fluttertoast.showToast(msg: "Hall is required");
    } else if (menuValue == -1) {
      return Fluttertoast.showToast(msg: "Menu is required");
    } else if (serverValue == -1) {
      return Fluttertoast.showToast(msg: "Server is required");
    } else if (fromDate.text.isEmpty) {
      return Fluttertoast.showToast(msg: "fromDate is required");
    } else if (fromTime == const TimeOfDay(hour: 0, minute: 0)) {
      return Fluttertoast.showToast(msg: "from Time is required");
    } else if (toTime == const TimeOfDay(hour: 0, minute: 0)) {
      return Fluttertoast.showToast(msg: "To Time is required");
    } else {
      createOrder();
    }
  }

  createOrderValidation(BuildContext context) {
    int termsvalue = terms - 1;
    int agentValue = agent - 1;
    int eventValue = event - 1;
    if (name.text.isEmpty) {
      return Fluttertoast.showToast(msg: "Name is required");
    } else if (termsvalue == -1) {
      return Fluttertoast.showToast(msg: "Terms is required");
    } else if (orderStatus.isEmpty) {
      return Fluttertoast.showToast(msg: "OrderStatus is required");
    } else if (agentValue == -1) {
      return Fluttertoast.showToast(msg: "Agent is required");
    } else if (eventValue == -1) {
      return Fluttertoast.showToast(msg: "Event is required");
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const EventsPage(),
      ));
    }
  }

  createOrder() async {
    orderloading = true;
    notifyListeners();
    final response = await http.post(
      Uri.parse("http://54.74.47.46:82/OrderMob/SaveOrderData"),
      headers: <String, String>{
        "Content-Type": "application/json; charset=utf-8",
        "Authorization": "Bearer $bearerToken",
      },
      body: jsonEncode(<dynamic, dynamic>{
        "status": orderStatus,
        "event": event,
        "EventLocation": eventLocation.text,
        "agent": agent,
        "last_update": "2023-01-31T00:00:00",
        "telephon1": telephone2.text,
        "contact": contact.text,
        "email1": email.text.trim(),
        "Booking": {
          "name": name.text,
          "address_1": address1.text,
          "telefon_1": telephone1.text,
          "email_adress": email.text.trim(),
          "terms": terms,
          "num": phone.text,
          "picture": ""
        },
        "Events": [
          {
            "from_date": fromDate.text,
            "to_date": "2023-01-31T00:00:00",
            "from_time": "${toTime.hour}:${toTime.minute}",
            "to_time": "${toTime.hour}:${toTime.minute}",
            "hall": hall,
            "menu": menu,
            "server": server,
            "editEventFlag": true
          }
        ]
      }),
    );
    if (response.statusCode == 200) {
      orderloading = false;
      notifyListeners();
      var value = json.decode(response.body);
      print(value);
      List<dynamic> error = value["Messages"];
      return Fluttertoast.showToast(msg: error[0]);
    } else if (response.statusCode == 400) {
      print("object1");
      orderloading = false;
      notifyListeners();
      var value = json.decode(response.body);
      List<dynamic> error = value["Messages"];
      return Fluttertoast.showToast(msg: error[0]);
    }
    print("object");
    orderloading = false;
    notifyListeners();
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

  GetOrderDetailsModel? getdetails;
  getOrderDetailsById({required int ordernumber}) async {
    final response = await http.get(
      Uri.parse(
        "http://54.74.47.46:82/OrderMob/GetOrderMobDetailsById?id=$ordernumber",
      ),
      headers: <String, String>{
        "Content-Type": "application/json; charset=utf-8",
        "Authorization": "Bearer $bearerToken",
      },
    );
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      Map<String, dynamic> getlist = data["Data"];
      getdetails = GetOrderDetailsModel.fromJson(getlist);
      notifyListeners();
    }
  }
}
