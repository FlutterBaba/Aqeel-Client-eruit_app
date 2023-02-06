import 'package:eruit_app/const.dart';
import 'package:flutter/material.dart';
import '../widgets/drop_down_widget.dart';

class CalendarFilter extends StatefulWidget {
  const CalendarFilter({super.key});
  @override
  State<CalendarFilter> createState() => _CalendarFilterState();
}

class _CalendarFilterState extends State<CalendarFilter> {
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
                  onPressed: () {},
                  child: const Text("Apply"),
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
      appBar: AppBar(
        title: const Text("Filter"),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const Divider(thickness: 1.2),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Calendar",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: const BorderSide(color: kborderColor),
                            ),
                            backgroundColor: Colors.white,
                          ),
                          child: const Text(
                            "Select All",
                            style: TextStyle(color: Colors.black),
                          ),
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
                              side: const BorderSide(color: kborderColor),
                            ),
                            backgroundColor: Colors.white,
                          ),
                          child: const Text(
                            "Holidays",
                            style: TextStyle(color: ktextColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(color: kborderColor),
                            ),
                            backgroundColor: Colors.white,
                          ),
                          child: const Text(
                            "Select All",
                            style: TextStyle(color: ktextColor),
                          ),
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
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(color: kborderColor),
                            ),
                            backgroundColor: Colors.white,
                          ),
                          child: const Text(
                            "Holidays",
                            style: TextStyle(color: ktextColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                DropDownWidget(
                  value: "Select",
                  title: "Month",
                  items: const [],
                  onTap: (value) {
                    // setState(() {
                    //   dropdownvalue = value!;
                    // });
                  },
                ),
                DropDownWidget(
                  value: "Select",
                  title: "Hall",
                  items: const [],
                  onTap: (value) {
                    // setState(() {
                    //   dropdownvalue = value!;
                    // });
                  },
                ),
                DropDownWidget(
                  value: "Select",
                  title: "Order status",
                  items: const [],
                  onTap: (value) {
                    // setState(() {
                    //   dropdownvalue = value!;
                    // });
                  },
                ),
                DropDownWidget(
                  value: "Select",
                  title: "Agent",
                  items: const [],
                  onTap: (value) {
                    // setState(() {
                    //   dropdownvalue = value!;
                    // });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
