import 'package:eruit_app/provider/order_provider/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../const.dart';

class BookingDetails extends StatelessWidget {
  const BookingDetails({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Align(
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: kborderColor,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(6),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage("assets/images/no-image.png"),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: kpColor,
                      child: SvgPicture.asset("assets/icons/edit-2.svg"),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Consumer<OrderProvider>(
              builder: (context, value, child) => OverflowBar(
                overflowSpacing: 20,
                children: [
                  TextField(
                    controller: value.name,
                    decoration: const InputDecoration(labelText: "Name"),
                  ),
                  TextField(
                    controller: value.address1,
                    decoration: const InputDecoration(labelText: "Address 1"),
                  ),
                  TextField(
                    controller: value.telephone1,
                    decoration: const InputDecoration(labelText: "Telephone 1"),
                  ),
                  TextField(
                    controller: value.email,
                    decoration: const InputDecoration(labelText: "Email"),
                  ),
                  TextField(
                    controller: value.phone,
                    decoration: const InputDecoration(labelText: "Phone"),
                  ),
                  TextField(
                    controller: value.contact,
                    decoration: const InputDecoration(labelText: "Contact"),
                  ),
                  TextField(
                    controller: value.telephone2,
                    decoration: const InputDecoration(labelText: "Telephone 2"),
                  ),
                  TextField(
                    controller: value.email1,
                    decoration: const InputDecoration(labelText: "Email 1"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
