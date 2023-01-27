import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../const.dart';
import '../../event_list_page.dart';

class BookingDetails extends StatelessWidget {
  const BookingDetails({super.key});

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
                          image: AssetImage("assets/images/profile.png"),
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
            ListView(
              shrinkWrap: true,
              primary: false,
              children: const [
                TextField(
                  decoration: InputDecoration(labelText: "Name"),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(labelText: "Address 1"),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(labelText: "Telephone 1"),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(labelText: "Email"),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(labelText: "Phone"),
                ),
                SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
