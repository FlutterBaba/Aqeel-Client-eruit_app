class OrderModel {
  final int order;
  final String dateOrder;
  final String status;
  final String lastUpdate;
  final double sumTotal;
  final int bookingNumber;
  final String name;
  final String email;
  final String phone;
  final String fromDate;
  final int hall;
  final String hallName;
  final String lastUser;
  final String orderId;
  final String bookingId;
  final String tEventId;
  final String colorHexa;
  OrderModel({
    required this.order,
    required this.dateOrder,
    required this.status,
    required this.lastUpdate,
    required this.sumTotal,
    required this.bookingNumber,
    required this.name,
    required this.email,
    required this.phone,
    required this.fromDate,
    required this.hall,
    required this.hallName,
    required this.lastUser,
    required this.orderId,
    required this.bookingId,
    required this.tEventId,
    required this.colorHexa,
  });
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      order: json['order'],
      dateOrder: json['date_order'],
      status: json['status'],
      lastUpdate: json['last_update'],
      sumTotal: json['sum_total'],
      bookingNumber: json['BookingNumber'],
      name: json['name'],
      email: json['Email'] ?? "",
      phone: json['Phone'] ?? "",
      fromDate: json["from_date"],
      hall: json['hall'],
      hallName: json['HallName'],
      lastUser: json['LastUser'],
      orderId: json['OrderId'],
      bookingId: json['BookingId'],
      tEventId: json['t_eventId'],
      colorHexa: json['colorHexa'],
    );
  }
}
