import 'package:eruit_app/widgets/drop_down_widget.dart';
import 'package:flutter/material.dart';

import 'events_Item.dart';
import 'events_details.dart';

class Events extends StatelessWidget {
  const Events({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(15),
        color: const Color(0xffF9FAFB),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const EventsDetails(),
                    ));
                  },
                  child: const Text("Save"),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Colors.black),
                    ),
                    elevation: 0,
                    backgroundColor: const Color(0xffF9FAFB),
                  ),
                  child: const Text(
                    "Clear",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Events",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const EventsItem(),
                    ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text("items"),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            const DropDownWidget(title: ""),
            const SizedBox(height: 20),
            const DropDownWidget(title: ""),
            const SizedBox(height: 20),
            const DropDownWidget(title: ""),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'From Date',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.date_range),
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'From Time',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.timer_sharp),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'From Time',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.timer_sharp),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Hebdate',
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(labelText: 'Day Event'),
            ),
          ],
        ),
      ),
    );
  }
}
