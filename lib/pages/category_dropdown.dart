import 'package:eruit_app/const.dart';
import 'package:eruit_app/widgets/drop_down_widget.dart';
import 'package:flutter/material.dart';

class EventFilterPopup extends StatefulWidget {
  const EventFilterPopup({super.key});

  @override
  State<EventFilterPopup> createState() => _EventFilterPopupState();
}

class _EventFilterPopupState extends State<EventFilterPopup> {
  static final TextEditingController _searchItem = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: const Color(0xffF9FAFB),
        padding: const EdgeInsets.all(18),
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            side: const BorderSide(color: ktextColor),
            backgroundColor: const Color(0xffF9FAFB),
          ),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: ktextColor,
          ),
          label: const Text(
            "Back to item",
            style: TextStyle(
              color: ktextColor,
            ),
          ),
          // : const Text(""),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Search Item"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: DropDownWidget(
              value: "Select",

              title: "",
              items: const [],
              onTap: (value) {},
              // onTap: (value){

              // },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              onSubmitted: (value) {
                setState(() {
                  _searchItem.text = value;
                });
              },
              decoration: const InputDecoration(
                labelText: "Search Item",
              ),
            ),
          ),
          _searchItem.text.isEmpty
              ? Container()
              : Expanded(
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Text("Roast beef sirloin sandwich bar"),
                        trailing: Container(
                          decoration: BoxDecoration(
                            color: kpColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 40,
                          width: 40,
                          child: const Center(
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const Text("Roast beef sirloin sandwich bar"),
                        trailing: Container(
                          decoration: BoxDecoration(
                            color: kpColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 40,
                          width: 40,
                          child: const Center(
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const Text("Roast beef sirloin sandwich bar"),
                        trailing: Container(
                          decoration: BoxDecoration(
                            color: kpColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 40,
                          width: 40,
                          child: const Center(
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
        ],
      ),
    );
  }
}
