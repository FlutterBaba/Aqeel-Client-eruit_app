import 'package:eruit_app/provider/auth_provider.dart';
import 'package:eruit_app/widgets/drop_down_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'events_Item.dart';
import 'events_details.dart';

class Events extends StatefulWidget {
  const Events({super.key});
  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  TextEditingController dateInputController = TextEditingController();
  TimeOfDay toTime = const TimeOfDay(hour: 8, minute: 30);
  TimeOfDay fromTime = const TimeOfDay(hour: 12, minute: 30);
  TextEditingController hebdate = TextEditingController();
  TextEditingController dayEvent = TextEditingController();

  static List<String> hallList = [
    "Hall",
    "הארמון",
    "האחוזה",
    "גן",
    "הארמון+ האחוזה",
    "הארמון+ הגן",
    "האחוזה+ הגן",
    "הארמון+ האחוזה+ הגן",
    "לימוזינהדגכדגכ",
    "סנס",
    "חדר טעימות",
    "חיצוני",
    'פנטהאוז 2020',
    "כיגכטכגטכרט",
    "צילום והפקות",
    "33",
    "חוף דקל",
    'רדשעכדגשהדגע',
    "פליי",
    "אופציה לאירוע",
    "אהוד בנא",
    'rahul test',
    "גגגגגגגגגגגגגג",
    "bloomingdales",
    "macys",
    "23423macys",
    "דשא",
    "סנטיאגו הול",
    "אולם מרכזי",
    "אולם מיכל",
    "zobi",
  ];

  static List<String> menuList = [
    "Menu",
    "פנטהאוז",
    "תפריט 2015",
    "הדגמה",
    "דוגמא",
    "גוטניק",
    "פנטהאוז",
    "תפריט מיכל",
    'מפרט צילום והפקות',
    "אלמה הפקות",
    "תפריט נסיוני",
    "תפריט חדש",
    "תפריט ראשי",
  ];

  static List<String> serverList = [
    "Server",
    "אמריקן סרוויס",
    "שולחנות עגולים",
    "הגשה לשולחנות",
    "tessst",
    'no server',
    'VIP',
    "בופה",
  ];

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
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
            DropDownWidget(
              title: "",
              value: hallList[authProvider.hall],
              items: hallList,
              onTap: (value) {
                setState(() {
                  authProvider.hall = hallList.indexOf(value!);
                });
              },
            ),
            const SizedBox(height: 20),
            DropDownWidget(
              title: "",
              value: menuList[authProvider.menu],
              items: menuList,
              onTap: (value) {
                setState(() {
                  authProvider.menu = menuList.indexOf(value!);
                });
              },
            ),
            const SizedBox(height: 20),
            DropDownWidget(
              title: "",
              value: serverList[authProvider.server],
              items: serverList,
              onTap: (value) {
                setState(() {
                  authProvider.server = serverList.indexOf(value!);
                });
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Date',
                suffixIcon: Icon(Icons.date_range),
              ),
              controller: dateInputController,
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2050));
                if (pickedDate != null) {
                  dateInputController.text =
                      DateFormat('dd MMMM yyyy').format(pickedDate);
                }
                await authProvider.getHedateAndDayEventByDate(
                    date: dateInputController.text);

                hebdate.text = authProvider.hebdate!;
                dayEvent.text = authProvider.dayEvent!;
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: toTime.format(context).toString(),
                      suffixIcon: const Icon(Icons.timer_sharp),
                    ),
                    // controller:
                    readOnly: true,
                    onTap: () {
                      showTimePicker(
                        helpText: "TO TIME",
                        context: context,
                        initialTime: TimeOfDay.now(),
                      ).then((value) {
                        setState(() {
                          toTime = value!;
                        });
                      });
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: fromTime.format(context).toString(),
                      suffixIcon: const Icon(Icons.timer_sharp),
                    ),
                    // controller:
                    readOnly: true,
                    onTap: () {
                      showTimePicker(
                        helpText: "From TIME",
                        context: context,
                        initialTime: TimeOfDay.now(),
                      ).then((value) {
                        setState(() {
                          fromTime = value!;
                        });
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: hebdate,
              decoration: const InputDecoration(
                labelText: 'Hebdate',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: dayEvent,
              decoration: const InputDecoration(labelText: 'Day Event'),
            ),
          ],
        ),
      ),
    );
  }
}
