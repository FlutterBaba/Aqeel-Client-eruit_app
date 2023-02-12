import 'package:eruit_app/provider/order_provider/order_provider.dart';
import 'package:eruit_app/widgets/drop_down_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});
  @override
  State<EventsPage> createState() => _EventsState();
}

class _EventsState extends State<EventsPage> {
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

  // chooseTime({required BuildContext context, required selectedTime}) async {
  //   TimeOfDay? pickedTime = await showTimePicker(
  //       context: context,
  //       initialTime: selectedTime,
  //       builder: (context, child) {
  //         return Theme(data: ThemeData.dark(), child: child!);
  //       },
  //       initialEntryMode: TimePickerEntryMode.input,
  //       helpText: 'Select Departure Time',
  //       errorInvalidText: 'Provide valid time',
  //       hourLabelText: 'Select Hour',
  //       minuteLabelText: 'Select Minute');
  //   if (pickedTime != null && pickedTime != selectedTime) {
  //     setState(() {
  //       selectedTime = pickedTime;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    OrderProvider orderProvider = Provider.of<OrderProvider>(context);
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
                    orderProvider.eventValidation();
                    print(orderProvider.fromTime.hour);
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => const EventsDetails(),
                    // ));
                  },
                  child: orderProvider.orderloading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text("Save"),
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
                  "EventsPage",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => const EventsItem(),
                    // ));
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
              value: hallList[orderProvider.hall],
              items: hallList,
              onTap: (value) {
                setState(() {
                  orderProvider.hall = hallList.indexOf(value!);
                });
              },
            ),
            const SizedBox(height: 20),
            DropDownWidget(
              title: "",
              value: menuList[orderProvider.menu],
              items: menuList,
              onTap: (value) {
                setState(() {
                  orderProvider.menu = menuList.indexOf(value!);
                });
              },
            ),
            const SizedBox(height: 20),
            DropDownWidget(
              title: "",
              value: serverList[orderProvider.server],
              items: serverList,
              onTap: (value) {
                setState(() {
                  orderProvider.server = serverList.indexOf(value!);
                });
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'From Date',
                suffixIcon: Icon(Icons.date_range),
              ),
              controller: orderProvider.fromDate,
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2050),
                );
                if (pickedDate != null) {
                  orderProvider.fromDate.text =
                      DateFormat('dd MMMM yyyy').format(pickedDate);
                }
                await orderProvider.getHedateAndDayEventByDate(
                    date: orderProvider.fromDate.text);

                hebdate.text = orderProvider.hebdate!;
                dayEvent.text = orderProvider.dayEvent!;
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: orderProvider.fromTime == TimeOfDay.now()
                          ? "From Time"
                          : "${orderProvider.fromTime.hour}:${orderProvider.fromTime.minute}",
                      suffixIcon: const Icon(Icons.timer_sharp),
                    ),
                    // controller:
                    readOnly: true,
                    onTap: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: orderProvider.fromTime,
                        builder: (context, child) {
                          return Theme(data: ThemeData.dark(), child: child!);
                        },
                        initialEntryMode: TimePickerEntryMode.input,
                        helpText: 'Select Departure Time',
                        errorInvalidText: 'Provide valid time',
                        hourLabelText: 'Select Hour',
                        minuteLabelText: 'Select Minute',
                      );
                      if (pickedTime != null &&
                          pickedTime != orderProvider.fromTime) {
                        setState(() {
                          orderProvider.fromTime = pickedTime;
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: orderProvider.toTime == TimeOfDay.now()
                          ? "To Time"
                          : "${orderProvider.toTime.hour}:${orderProvider.toTime.minute}",
                      suffixIcon: const Icon(Icons.timer_sharp),
                    ),
                    // controller:
                    readOnly: true,
                    onTap: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: orderProvider.toTime,
                        builder: (context, child) {
                          return Theme(data: ThemeData.dark(), child: child!);
                        },
                        initialEntryMode: TimePickerEntryMode.input,
                        helpText: 'Select Departure Time',
                        errorInvalidText: 'Provide valid time',
                        hourLabelText: 'Select Hour',
                        minuteLabelText: 'Select Minute',
                      );
                      if (pickedTime != null &&
                          pickedTime != orderProvider.toTime) {
                        setState(() {
                          orderProvider.toTime = pickedTime;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: hebdate,
              readOnly: true,
              decoration: const InputDecoration(labelText: 'Hebdate'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: dayEvent,
              readOnly: true,
              decoration: const InputDecoration(labelText: 'Day Event'),
            ),
          ],
        ),
      ),
    );
  }
}
