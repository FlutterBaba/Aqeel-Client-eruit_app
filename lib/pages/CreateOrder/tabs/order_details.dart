import 'package:eruit_app/const.dart';
import 'package:eruit_app/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/get_order_status_model.dart';
import '../../../widgets/drop_down_widget.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});
  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  AuthProvider? authProvider;
  // String agent = "Agent";
  String event = "Event";
  List<String> termsList = [
    'Terms',
    'תשלום 60 יום',
    'תשלום 90 יום',
    'תשלום 99 יום',
    '555555555555555',
  ];
  List<String> agentList = [
    'Agent',
    "רותי",
    "נועה",
    "אופציה",
    "אירועית בדיקה",
    "Eruit",
    "יובל 3",
    "מיני ישראל זכירת נתונים",
    "Test Agent",
    'teeet',
  ];
  List<String> eventList = [
    'Event',
    "חתונה",
    "בר מצוה",
    "בת מצוה",
    "ברית מילה",
    "מסיבת בת",
    "ברית תאומים בנים",
    "מסיבת הולדת תאומות",
    'מסיבת תאומים בן-בת',
    "נשף",
    "כנס",
    "יום עיון",
    "הרמת כוסית",
    "קייטרינג",
    "השכרת אולם",
    "ארוחת בוקר",
    "מסיבת עיתונאים",
    "פדיון הבן",
    "בר+בת מצוה",
    "בר מצווה לתאומים",
    "שונות",
    "ארוחת צהריים",
    "חינה",
    "שבע ברכות",
    "בנות מצוה- תאומות",
    "אירוע חברה",
    "99",
    "100",
    "101",
    "252",
    "סיור קבוצות",
    "teeet",
  ];

  @override
  Widget build(BuildContext context) {
    authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(18),
        color: const Color(0xffF9FAFB),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            // if (authProvider!.terms == 0) {
            //   Fluttertoast.showToast(msg: "Terms is required");
            // } else {
            //   authProvider!.yaqoobFunction();
            // }
            // Navigator.of(context).push(MaterialPageRoute(
            //   builder: (context) => const EventListPage(),
            // ));
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
                  children: [
                    const TextField(
                      decoration: InputDecoration(labelText: "Order"),
                    ),
                    const SizedBox(height: 20),
                    DropDownWidget(
                      title: "",
                      value: termsList[authProvider!.terms],
                      items: termsList,
                      onTap: (value) {
                        setState(() {
                          authProvider!.terms = termsList.indexOf(value!);
                        });
                        print(value);
                      },
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: kborderColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          itemHeight: 60,
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                          value: authProvider!.orderStatus,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: authProvider!.statuslist.map(
                            (GetOrderStatusModel items) {
                              return DropdownMenuItem(
                                value: items.value,
                                child: Text(
                                  items.value,
                                  style:
                                      const TextStyle(color: klightTextColor),
                                ),
                              );
                            },
                          ).toList(),
                          onChanged: (value) {
                            setState(() {
                              authProvider!.orderStatus = value!;
                            });
                          },
                          isExpanded: true,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    DropDownWidget(
                      title: "",
                      value: agentList[authProvider!.agent],
                      items: agentList,
                      onTap: (value) {
                        setState(() {
                          authProvider!.agent = agentList.indexOf(value!);
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: authProvider!.eventLocation,
                      decoration:
                          const InputDecoration(labelText: "Event Location"),
                    ),
                    const SizedBox(height: 20),
                    DropDownWidget(
                      title: "",
                      value: eventList[authProvider!.event],
                      items: eventList,
                      onTap: (value) {
                        setState(() {
                          authProvider!.event = eventList.indexOf(value!);
                        });
                      },
                    ),
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
