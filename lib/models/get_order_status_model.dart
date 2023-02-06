class GetOrderStatusModel {
  final String type = "Order Status";
  final String text;
  final String value;
  GetOrderStatusModel({
    required this.text,
    required this.value,
  });
  factory GetOrderStatusModel.fromJson(Map<String, dynamic> json) {
    return GetOrderStatusModel(
      text: json['Text'],
      value: json['Value'],
    );
  }
}
