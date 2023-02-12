class GetOrdersModel {
  int? order;
  String? dateOrder;
  String? status;
  String? statusLabel;
  String? lastUpdate;
  String? isRemind;
  double? sumTotal;
  int? bookingNumber;
  String? name;
  String? email;
  String? phone;
  String? fromDate;
  int? hall;
  String? hallName;
  String? lastUser;
  String? orderId;
  String? bookingId;
  String? tEventId;
  String? colorHexa;

  GetOrdersModel({
    this.order,
    this.dateOrder,
    this.status,
    this.statusLabel,
    this.lastUpdate,
    this.isRemind,
    this.sumTotal,
    this.bookingNumber,
    this.name,
    this.email,
    this.phone,
    this.fromDate,
    this.hall,
    this.hallName,
    this.lastUser,
    this.orderId,
    this.bookingId,
    this.tEventId,
    this.colorHexa,
  });

  GetOrdersModel.fromJson(Map<String, dynamic> json) {
    order = json['order'];
    dateOrder = json['date_order'];
    status = json['status'];
    statusLabel = json['StatusLabel'];
    lastUpdate = json['last_update'];
    isRemind = json['IsRemind'];
    sumTotal = json['sum_total'];
    bookingNumber = json['BookingNumber'];
    name = json['name'];
    email = json['Email'];
    phone = json['Phone'];
    fromDate = json['from_date'];
    hall = json['hall'];
    hallName = json['HallName'];
    lastUser = json['LastUser'];
    orderId = json['OrderId'];
    bookingId = json['BookingId'];
    tEventId = json['t_eventId'];
    colorHexa = json['colorHexa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order'] = order;
    data['date_order'] = dateOrder;
    data['status'] = status;
    data['StatusLabel'] = statusLabel;
    data['last_update'] = lastUpdate;
    data['IsRemind'] = isRemind;
    data['sum_total'] = sumTotal;
    data['BookingNumber'] = bookingNumber;
    data['name'] = name;
    data['Email'] = email;
    data['Phone'] = phone;
    data['from_date'] = fromDate;
    data['hall'] = hall;
    data['HallName'] = hallName;
    data['LastUser'] = lastUser;
    data['OrderId'] = orderId;
    data['BookingId'] = bookingId;
    data['t_eventId'] = tEventId;
    data['colorHexa'] = colorHexa;
    return data;
  }
}
