import 'package:eruit_app/const.dart';
import 'package:flutter/material.dart';

class EventsDetails extends StatelessWidget {
  const EventsDetails({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const ListTile(
              leading: Text(
                "Events Details",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Column(
              children: ListTile.divideTiles(
                //          <-- ListTile.divideTiles
                context: context,
                tiles: [
                  const ListTile(
                    title: Text(
                      'Hall',
                      style: TextStyle(
                        color: klightTextColor,
                      ),
                    ),
                    subtitle: Text(
                      "Marriage hall",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ktextColor,
                      ),
                    ),
                  ),
                  const ListTile(
                    title: Text(
                      'Menu',
                      style: TextStyle(
                        color: klightTextColor,
                      ),
                    ),
                    subtitle: Text(
                      "Chef Haim Cohen's menu",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ktextColor,
                      ),
                    ),
                  ),
                  const ListTile(
                    title: Text(
                      'Form submission',
                      style: TextStyle(
                        color: klightTextColor,
                      ),
                    ),
                    subtitle: Text(
                      "456789",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ktextColor,
                      ),
                    ),
                  ),
                  const ListTile(
                    title: Text(
                      'Form Date',
                      style: TextStyle(
                        color: klightTextColor,
                      ),
                    ),
                    trailing: Icon(Icons.date_range),
                    subtitle: Text(
                      "29th Oc 2022",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ktextColor,
                      ),
                    ),
                  ),
                  const ListTile(
                    title: Text(
                      'Event from time',
                      style: TextStyle(
                        color: klightTextColor,
                      ),
                    ),
                    trailing: Icon(Icons.history_toggle_off_sharp),
                    subtitle: Text(
                      "10:00 am",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ktextColor,
                      ),
                    ),
                  ),
                  const ListTile(
                    title: Text(
                      'Form Date',
                      style: TextStyle(
                        color: klightTextColor,
                      ),
                    ),
                    trailing: Icon(Icons.history_toggle_off_sharp),
                    subtitle: Text(
                      "29th Oc 2022",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ktextColor,
                      ),
                    ),
                  ),
                  const ListTile(
                    title: Text(
                      'To Date',
                      style: TextStyle(
                        color: klightTextColor,
                      ),
                    ),
                    trailing: Icon(Icons.date_range),
                    subtitle: Text(
                      "29th Oc 2022",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ktextColor,
                      ),
                    ),
                  ),
                  const ListTile(
                    title: Text(
                      'Day Event',
                      style: TextStyle(
                        color: klightTextColor,
                      ),
                    ),
                    subtitle: Text(
                      "B",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ktextColor,
                      ),
                    ),
                  ),
                  const ListTile(
                    title: Text(
                      'Budgets',
                      style: TextStyle(
                        color: klightTextColor,
                      ),
                    ),
                    subtitle: Text(
                      "\$456.00",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ktextColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text("Items"),
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Color(0xffF9FAFB),
                    ),
                    child: const Center(
                      child: ListTile(
                        trailing: Text("\$456.00"),
                        leading: Text("Total"),
                      ),
                    ),
                  ),
                ],
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
