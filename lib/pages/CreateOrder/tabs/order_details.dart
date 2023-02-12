import 'package:eruit_app/const.dart';
import 'package:eruit_app/provider/order_provider/order_provider.dart';
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
  String event = "Event";
  @override
  void initState() {
    OrderProvider orderProvider =
        Provider.of<OrderProvider>(context, listen: false);
    orderProvider.getOrderStatusList();
    super.initState();
  }

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
    return Scaffold(
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
                Consumer<OrderProvider>(
                  builder: (context, value, child) => Row(
                    children: [
                      const Icon(Icons.date_range_outlined),
                      const SizedBox(width: 5),
                      Text(
                        value.orderDate,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // const Text(
                //   "Booking number",
                //   style: TextStyle(color: klightTextColor),
                // ),
                // const SizedBox(height: 5),
                // Row(
                //   children: const [
                //     Icon(Icons.date_range_outlined),
                //     SizedBox(width: 5),
                //     Text(
                //       "123456",
                //       style: TextStyle(
                //         fontWeight: FontWeight.w500,
                //       ),
                //     ),
                //   ],
                // ),
                // const SizedBox(height: 20),
                Consumer<OrderProvider>(
                  builder: (context, value, child) => OverflowBar(
                    overflowSpacing: 20,
                    children: [
                      // const TextField(
                      //   decoration: InputDecoration(labelText: "Order"),
                      // ),

                      DropDownWidget(
                        title: "",
                        value: termsList[value.terms],
                        items: termsList,
                        onTap: (onTapvalue) {
                          setState(() {
                            value.terms = termsList.indexOf(onTapvalue!);
                          });
                          // print(value);
                        },
                      ),

                      DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
                          itemHeight: 60,
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                          value: value.orderStatus,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: value.statuslist.map(
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
                          onChanged: (onchangeValue) {
                            setState(() {
                              value.orderStatus = onchangeValue!;
                            });
                          },
                          isExpanded: true,
                        ),
                      ),

                      DropDownWidget(
                        title: "",
                        value: agentList[value.agent],
                        items: agentList,
                        onTap: (onTapvalue) {
                          setState(() {
                            value.agent = agentList.indexOf(onTapvalue!);
                          });
                        },
                      ),
                      TextField(
                        controller: value.eventLocation,
                        decoration:
                            const InputDecoration(labelText: "Event Location"),
                      ),
                      DropDownWidget(
                        title: "",
                        value: eventList[value.event],
                        items: eventList,
                        onTap: (onTapvalue) {
                          setState(() {
                            value.event = eventList.indexOf(onTapvalue!);
                          });
                        },
                      ),
                    ],
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
