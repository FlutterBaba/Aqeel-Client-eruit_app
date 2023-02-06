// import 'package:eruit_app/const.dart';
// import 'package:eruit_app/pages/events.dart';
// import 'package:eruit_app/provider/auth_provider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../models/order_model.dart';
// import '../test_ui/product_list.dart';
// import 'OrderSummary /order_summary.dart';

// class EventListPage extends StatelessWidget {
//   const EventListPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     AuthProvider authProvider = Provider.of<AuthProvider>(context);
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         elevation: 0,
//         backgroundColor: kpColor,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(16.0)),
//         ),
//         onPressed: () {},
//         child: const Icon(Icons.add),
//       ),
//       body: Container(
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
//               title: const Text("Event"),
//             ),
//             const SizedBox(height: 30),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 18),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   CupertinoButton(
//                     padding: EdgeInsets.zero,
//                     onPressed: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => const OrderSummary(),
//                       ));
//                     },
//                     child: Row(
//                       children: const [
//                         Text(
//                           "20\t",
//                           style: TextStyle(color: kpColor),
//                         ),
//                         Text(
//                           "Events",
//                           style: TextStyle(
//                             color: ktextColor,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Row(
//                     children: const [
//                       Text(
//                         "Order Summary\t",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Icon(
//                         Icons.arrow_forward_ios,
//                         size: 20,
//                         color: kpColor,
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 physics: const BouncingScrollPhysics(),
//                 padding: EdgeInsets.zero,
//                 shrinkWrap: true,
//                 // primary: true,
//                 itemCount: authProvider.orderslist.length,
//                 itemBuilder: (context, index) {
//                   OrderModel orderModel = authProvider.orderslist[index];
//                   return CupertinoButton(
//                     onPressed: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => const Events(),
//                       ));
//                     },
//                     padding: EdgeInsets.zero,
//                     child: ProductRowItem(
//                       orderModel: orderModel,
//                     ),
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
