import 'package:eruit_app/const.dart';
import 'package:flutter/material.dart';

class EventsTotalPricepopup extends StatelessWidget {
  const EventsTotalPricepopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: const BackButton(),
        title: const Text("Total Price"),
      ),
      body: Column(
        children: [
          Column(
            children: ListTile.divideTiles(
              context: context,
              tiles: [
                ListTile(
                  leading: Container(
                    alignment: Alignment.topLeft,
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: kborderColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("10.00"),
                    ),
                  ),
                  trailing: const Text("Commission %"),
                ),
                const ListTile(
                  leading: Text("02"),
                  trailing: Text("Items"),
                ),
                const ListTile(
                  leading: Text("02"),
                  trailing: Text("Qty"),
                ),
                const ListTile(
                  leading: Text("0.00"),
                  trailing: Text("Subtotal"),
                ),
                const ListTile(
                  leading: Text(
                    "0.00",
                    style: TextStyle(color: kpColor),
                  ),
                  trailing: Text(
                    "Total",
                    style: TextStyle(color: kpColor),
                  ),
                ),
              ],
            ).toList(),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Save"),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: Colors.black),
                        ),
                        backgroundColor: const Color(0xffF9FAFB),
                      ),
                      child: const Text(
                        "Clear",
                        style: TextStyle(color: ktextColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
