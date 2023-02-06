// import 'dart:math';

// import 'package:eruit_app/const.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import '../models/order_model.dart';

// class OrderDetailsPage extends StatefulWidget {
//   final OrderModel orderModel;
//   const OrderDetailsPage({
//     super.key,
//     required this.orderModel,
//   });

//   @override
//   State<OrderDetailsPage> createState() => _OrderDetailsPageState();
// }

// class _OrderDetailsPageState extends State<OrderDetailsPage> {
//   final double convertHeight = 190;
//   final double signleOrderHeight = 80;

//   bool switchBool = false;

//   Widget buildCoverImage() {
//     return Container(
//       decoration: const BoxDecoration(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(10),
//           topRight: Radius.circular(10),
//         ),
//         image: DecorationImage(fit: BoxFit.cover, image: AssetImage("sdsd")),
//       ),
//       height: convertHeight,
//       width: double.infinity,
//     );
//   }

//   Widget buildOrderItem() {
//     return Container(
//       height: 100,
//       width: MediaQuery.of(context).size.width - 70,
//       decoration: BoxDecoration(
//         boxShadow: [
//           BoxShadow(
//             offset: const Offset(0, 4),
//             blurRadius: 24,
//             color: const Color(0xff000000).withOpacity(0.1),
//             spreadRadius: 0,
//           ),
//         ],
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Container(
//             margin: const EdgeInsets.all(12),
//             width: 60,
//             decoration: BoxDecoration(
//               color: kpColor.withOpacity(0.2),
//               borderRadius: BorderRadius.circular(4),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: const [
//                 Text(
//                   "07",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.red,
//                   ),
//                 ),
//                 Text(
//                   "Oct",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 10),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Row(
//                 children: [
//                   const Text(
//                     "Elimelech Meir",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   const SizedBox(width: 5),
//                   Icon(
//                     Icons.circle_outlined,
//                     size: 17,
//                     color: Colors
//                         .primaries[Random().nextInt(Colors.primaries.length)],
//                   )
//                 ],
//               ),
//               const SizedBox(height: 5),
//               const Text(
//                 '#Order number',
//                 style: TextStyle(
//                   fontWeight: FontWeight.w500,
//                   color: klightTextColor,
//                 ),
//               ),
//               Text(
//                 widget.orderModel.order.toString(),
//                 style: const TextStyle(
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Transform.scale(
//                 scale: 0.7,
//                 child: CupertinoSwitch(
//                   value: switchBool,
//                   onChanged: (va) {
//                     setState(() {
//                       switchBool = va;
//                     });
//                   },
//                 ),
//               ),
//               Row(
//                 children: [
//                   const Icon(Icons.notifications_none_rounded),
//                   Transform.scale(
//                     scale: 0.7,
//                     child: CupertinoSwitch(
//                       value: switchBool,
//                       onChanged: (va) {
//                         setState(() {
//                           switchBool = va;
//                         });
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   Widget buildTop() {
//     double bottom = signleOrderHeight / 2;
//     double top = convertHeight - signleOrderHeight / 2;

//     return Stack(
//       clipBehavior: Clip.none,
//       alignment: Alignment.center,
//       children: [
//         Padding(
//           padding: EdgeInsets.only(bottom: bottom),
//           child: buildCoverImage(),
//         ),
//         Positioned(
//           top: top,
//           child: buildOrderItem(),
//         ),
//       ],
//     );
//   }

//   Widget buildListTile() {
//     return Column(
//       children: [
//         Row(
//           children: const [
//             Expanded(
//               child: ListTile(
//                 title: Text(
//                   "Hall",
//                   style: TextStyle(color: klightTextColor),
//                 ),
//                 subtitle: Text(
//                   "Marriage hall",
//                   style: TextStyle(color: ktextColor),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: ListTile(
//                 title: Text(
//                   "Booking number",
//                   style: TextStyle(color: klightTextColor),
//                 ),
//                 subtitle: Text(
//                   "12456",
//                   style: TextStyle(color: ktextColor),
//                 ),
//               ),
//             )
//           ],
//         ),
//         Row(
//           children: const [
//             Expanded(
//               child: ListTile(
//                 title: Text(
//                   "Hall",
//                   style: TextStyle(color: klightTextColor),
//                 ),
//                 subtitle: Text(
//                   "Marriage hall",
//                   style: TextStyle(color: ktextColor),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: ListTile(
//                 title: Text(
//                   "Booking number",
//                   style: TextStyle(color: klightTextColor),
//                 ),
//                 subtitle: Text(
//                   "12456",
//                   style: TextStyle(color: ktextColor),
//                 ),
//               ),
//             )
//           ],
//         ),
//         Row(
//           children: const [
//             Expanded(
//               child: ListTile(
//                 title: Text(
//                   "Hall",
//                   style: TextStyle(color: klightTextColor),
//                 ),
//                 subtitle: Text(
//                   "Marriage hall",
//                   style: TextStyle(color: ktextColor),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: ListTile(
//                 title: Text(
//                   "Booking number",
//                   style: TextStyle(color: klightTextColor),
//                 ),
//                 subtitle: Text(
//                   "12456",
//                   style: TextStyle(color: ktextColor),
//                 ),
//               ),
//             )
//           ],
//         ),
//         Row(
//           children: const [
//             Expanded(
//               child: ListTile(
//                 title: Text(
//                   "Hall",
//                   style: TextStyle(color: klightTextColor),
//                 ),
//                 subtitle: Text(
//                   "Marriage hall",
//                   style: TextStyle(color: ktextColor),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: ListTile(
//                 title: Text(
//                   "Booking number",
//                   style: TextStyle(color: klightTextColor),
//                 ),
//                 subtitle: Text(
//                   "12456",
//                   style: TextStyle(color: ktextColor),
//                 ),
//               ),
//             )
//           ],
//         ),
//         const ListTile(
//           title: Text(
//             "Email",
//             style: TextStyle(color: klightTextColor),
//           ),
//           subtitle: Text(
//             "elimelechmeir@eruit.co.il",
//             style: TextStyle(color: ktextColor),
//           ),
//         ),
//         const Divider(color: Colors.white),
//         Row(
//           children: const [
//             Expanded(
//               child: ListTile(
//                 title: Text(
//                   "Hall",
//                   style: TextStyle(color: klightTextColor),
//                 ),
//                 subtitle: Text(
//                   "Marriage hall",
//                   style: TextStyle(color: ktextColor),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: ListTile(
//                 title: Text(
//                   "Booking number",
//                   style: TextStyle(color: klightTextColor),
//                 ),
//                 subtitle: Text(
//                   "12456",
//                   style: TextStyle(color: ktextColor),
//                 ),
//               ),
//             )
//           ],
//         ),
//         Row(
//           children: const [
//             Expanded(
//               child: ListTile(
//                 title: Text(
//                   "Hall",
//                   style: TextStyle(color: klightTextColor),
//                 ),
//                 subtitle: Text(
//                   "Marriage hall",
//                   style: TextStyle(color: ktextColor),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: ListTile(
//                 title: Text(
//                   "Booking number",
//                   style: TextStyle(color: klightTextColor),
//                 ),
//                 subtitle: Text(
//                   "12456",
//                   style: TextStyle(color: ktextColor),
//                 ),
//               ),
//             )
//           ],
//         ),
//         const SizedBox(height: 10),
//         SizedBox(
//           width: double.infinity,
//           child: ElevatedButton(
//             onPressed: () {},
//             child: const Text("Edit"),
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 18),
//         width: double.infinity,
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             fit: BoxFit.cover,
//             image: AssetImage("assets/images/background.png"),
//           ),
//         ),
//         child: Column(
//           children: [
//             AppBar(
//               backgroundColor: Colors.transparent,
//               elevation: 0,
//               title: const Text("Order"),
//               leading: const BackButton(),
//               // leading: IconButton(
//               //   icon: Image.asset('assets/logo.png'),
//               //   onPressed: () {},
//               // ),
//             ),
//             Expanded(
//               child: ListView(
//                 padding: EdgeInsets.zero,
//                 physics: const BouncingScrollPhysics(),
//                 children: [
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.white),
//                       color: Colors.white.withOpacity(0.4),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Column(
//                       children: [
//                         buildTop(),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         buildListTile(),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
