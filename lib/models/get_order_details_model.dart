class GetOrderDetailsModel {
  int? order;
  String? orderId;
  String? status;
  int? event;
  String? invest;
  String? eventLocation;
  int? agent;
  String? dateOrder;
  String? lastUpdate;
  String? telephon1;
  bool? isRemind;
  String? hallName;
  String? lastUser;
  double? addCommon;
  int? numPortions;
  int? possiblePostions;
  double? addition1;
  double? cost1;
  String? minPostions;
  String? practical;
  double? dutyHist;
  double? discount2;
  String? dateFinish;
  double? sumTotal;
  int? nextOrder;
  int? previousOrder;
  String? colorHexa;
  Booking? booking;
  List<Events>? events;

  GetOrderDetailsModel(
      {this.order,
      this.orderId,
      this.status,
      this.event,
      this.invest,
      this.eventLocation,
      this.agent,
      this.dateOrder,
      this.lastUpdate,
      this.telephon1,
      this.isRemind,
      this.hallName,
      this.lastUser,
      this.addCommon,
      this.numPortions,
      this.possiblePostions,
      this.addition1,
      this.cost1,
      this.minPostions,
      this.practical,
      this.dutyHist,
      this.discount2,
      this.dateFinish,
      this.sumTotal,
      this.nextOrder,
      this.previousOrder,
      this.colorHexa,
      this.booking,
      this.events});

  GetOrderDetailsModel.fromJson(Map<String, dynamic> json) {
    order = json['order'];
    orderId = json['OrderId'];
    status = json['status'];
    event = json['event'];
    invest = json['invest'];
    eventLocation = json['EventLocation'];
    agent = json['agent'];
    dateOrder = json['date_order'];
    lastUpdate = json['last_update'];
    telephon1 = json['telephon1'];
    isRemind = json['IsRemind'];
    hallName = json['HallName'];
    lastUser = json['LastUser'];
    addCommon = json['add_common'];
    numPortions = json['num_portions'];
    possiblePostions = json['possible_postions'];
    addition1 = json['addition_1'];
    cost1 = json['cost_1'];
    minPostions = json['min_postions'];
    practical = json['practical'];
    dutyHist = json['duty_hist'];
    discount2 = json['discount_2'];
    dateFinish = json['date_finish'];
    sumTotal = json['sum_total'];
    nextOrder = json['NextOrder'];
    previousOrder = json['PreviousOrder'];
    colorHexa = json['colorHexa'];
    booking =
        json['Booking'] != null ? Booking.fromJson(json['Booking']) : null;
    if (json['Events'] != null) {
      events = <Events>[];
      json['Events'].forEach((v) {
        events!.add(Events.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order'] = order;
    data['OrderId'] = orderId;
    data['status'] = status;
    data['event'] = event;
    data['invest'] = invest;
    data['EventLocation'] = eventLocation;
    data['agent'] = agent;
    data['date_order'] = dateOrder;
    data['last_update'] = lastUpdate;
    data['telephon1'] = telephon1;
    data['IsRemind'] = isRemind;
    data['HallName'] = hallName;
    data['LastUser'] = lastUser;
    data['add_common'] = addCommon;
    data['num_portions'] = numPortions;
    data['possible_postions'] = possiblePostions;
    data['addition_1'] = addition1;
    data['cost_1'] = cost1;
    data['min_postions'] = minPostions;
    data['practical'] = practical;
    data['duty_hist'] = dutyHist;
    data['discount_2'] = discount2;
    data['date_finish'] = dateFinish;
    data['sum_total'] = sumTotal;
    data['NextOrder'] = nextOrder;
    data['PreviousOrder'] = previousOrder;
    data['colorHexa'] = colorHexa;
    if (booking != null) {
      data['Booking'] = booking!.toJson();
    }
    if (events != null) {
      data['Events'] = events!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Booking {
  int? bookingNumber;
  String? bookingId;
  String? name;
  String? address1;
  String? telefon1;
  String? emailAdress;
  int? terms;
  String? number;
  String? picture;

  Booking(
      {this.bookingNumber,
      this.bookingId,
      this.name,
      this.address1,
      this.telefon1,
      this.emailAdress,
      this.terms,
      this.number,
      this.picture});

  Booking.fromJson(Map<String, dynamic> json) {
    bookingNumber = json['BookingNumber'];
    bookingId = json['BookingId'];
    name = json['name'];
    address1 = json['address_1'];
    telefon1 = json['telefon_1'];
    emailAdress = json['email_adress'];
    terms = json['terms'];
    number = json['num'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['BookingNumber'] = bookingNumber;
    data['BookingId'] = bookingId;
    data['name'] = name;
    data['address_1'] = address1;
    data['telefon_1'] = telefon1;
    data['email_adress'] = emailAdress;
    data['terms'] = terms;
    data['num'] = number;
    data['picture'] = picture;
    return data;
  }
}

class Events {
  String? tEventId;
  int? order;
  String? dateEvent;
  String? fromDate;
  String? toDate;
  String? fromTime;
  String? toTime;
  String? hallName;
  String? menuName;
  String? serverName;
  int? hall;
  int? menu;
  int? server;
  String? commission;
  bool? editEventFlag;

  Events(
      {this.tEventId,
      this.order,
      this.dateEvent,
      this.fromDate,
      this.toDate,
      this.fromTime,
      this.toTime,
      this.hallName,
      this.menuName,
      this.serverName,
      this.hall,
      this.menu,
      this.server,
      this.commission,
      this.editEventFlag});

  Events.fromJson(Map<String, dynamic> json) {
    tEventId = json['t_eventId'];
    order = json['order'];
    dateEvent = json['date_event'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
    hallName = json['HallName'];
    menuName = json['MenuName'];
    serverName = json['ServerName'];
    hall = json['hall'];
    menu = json['menu'];
    server = json['server'];
    commission = json['Commission'];
    editEventFlag = json['editEventFlag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['t_eventId'] = tEventId;
    data['order'] = order;
    data['date_event'] = dateEvent;
    data['from_date'] = fromDate;
    data['to_date'] = toDate;
    data['from_time'] = fromTime;
    data['to_time'] = toTime;
    data['HallName'] = hallName;
    data['MenuName'] = menuName;
    data['ServerName'] = serverName;
    data['hall'] = hall;
    data['menu'] = menu;
    data['server'] = server;
    data['Commission'] = commission;
    data['editEventFlag'] = editEventFlag;
    return data;
  }
}
