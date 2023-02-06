import 'package:eruit_app/const.dart';
import 'package:eruit_app/widgets/drop_down_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'category_dropdown.dart';
import 'events_total_price_popup.dart';

class EventsItem extends StatelessWidget {
  const EventsItem({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        color: const Color(0xffF9FAFB),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const EventsTotalPricepopup(),
            ));
          },
          child: const Text("Show Total"),
        ),
      ),
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const Text(
              "Event items",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const EventFilterPopup(),
                ));
              },
              child: SvgPicture.asset(
                "assets/icons/filter.svg",
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
            color: const Color(0xffF9FAFB),
            child: Row(
              children: const [
                Text("Item Selected\t"),
                Text(
                  "0",
                  style: TextStyle(
                    color: kpColor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DropDownWidget(
              value: "Select",
              title: "",
              items: const [],
              onTap: (value) {},
            ),
          ),
          const ListTile(
            leading: Text(
              "Bread and Drinks",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            height: 500,
            decoration: BoxDecoration(
              border: Border.all(color: kborderColor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Container(
                  height: 200,
                  alignment: Alignment.topRight,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/image5.png"),
                    ),
                  ),
                  child: Transform.scale(
                    scale: 0.6,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: const Icon(
                        Icons.close,
                        color: ktextColor,
                      ),
                    ),
                  ),
                  // color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Expanded(
                              child: TextField(
                            decoration: InputDecoration(
                              labelText: "Start Time",
                              suffixIcon: Icon(Icons.time_to_leave),
                            ),
                          )),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: "Start Time",
                                suffixIcon: Icon(Icons.time_to_leave),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const TextField(
                        decoration: InputDecoration(labelText: "Item"),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: const [
                          Expanded(
                              child: TextField(
                            decoration: InputDecoration(labelText: "Discount"),
                          )),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              decoration:
                                  InputDecoration(labelText: "Sub Total"),
                            ),
                          ),
                        ],
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
