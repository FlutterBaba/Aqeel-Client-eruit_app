import 'package:eruit_app/const.dart';
import 'package:flutter/material.dart';

import '../../../widgets/drop_down_widget.dart';
import '../../event_list_page.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(18),
        color: const Color(0xffF9FAFB),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const EventListPage(),
            ));
          },
          child: const Text("Events"),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Order Date",
                  style: TextStyle(color: klightTextColor),
                ),
                const SizedBox(height: 5),
                Row(
                  children: const [
                    Icon(Icons.date_range_outlined),
                    SizedBox(width: 5),
                    Text(
                      "02/11/2022  11:26 AM",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Booking number",
                  style: TextStyle(color: klightTextColor),
                ),
                const SizedBox(height: 5),
                Row(
                  children: const [
                    Icon(Icons.date_range_outlined),
                    SizedBox(width: 5),
                    Text(
                      "123456",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ListView(
                  shrinkWrap: true,
                  primary: false,
                  children: const [
                    TextField(
                      decoration: InputDecoration(labelText: "Order"),
                    ),
                    SizedBox(height: 20),
                    DropDownWidget(title: ""),
                    SizedBox(height: 20),
                    DropDownWidget(title: ""),
                    SizedBox(height: 20),
                    DropDownWidget(title: ""),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(labelText: "Event Location"),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
