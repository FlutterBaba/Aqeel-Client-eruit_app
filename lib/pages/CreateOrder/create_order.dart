import 'package:eruit_app/const.dart';
import 'package:eruit_app/provider/order_provider/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'tabs/booking_details.dart';
import 'tabs/order_details.dart';

class CreateOrder extends StatelessWidget {
  const CreateOrder({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(18),
          color: const Color(0xffF9FAFB),
          width: double.infinity,
          child: Consumer<OrderProvider>(
            builder: (context, value, child) => ElevatedButton(
              onPressed: () {
                value.createOrderValidation(context);
              },
              child: const Text("Events"),
            ),
          ),
        ),
        appBar: AppBar(
          leading: const BackButton(),
          title: const Text("Create Order"),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(18),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Booking Details",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Consumer<OrderProvider>(builder: (context, value, child) {
                return ValueListenableBuilder(
                  valueListenable: value.name,
                  builder: (context, valuee, child) => IgnorePointer(
                    ignoring: value.name.text.isEmpty ? true : false,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffE4E6EF),
                      ),
                      child: TabBar(
                        unselectedLabelStyle:
                            const TextStyle(fontWeight: FontWeight.w500),
                        unselectedLabelColor: ktextColor,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kpColor,
                        ),
                        tabs: const [
                          Tab(
                            text: "Booking Details",
                          ),
                          Tab(
                            text: "Order Details",
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  BookingDetails(),
                  OrderDetails(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
