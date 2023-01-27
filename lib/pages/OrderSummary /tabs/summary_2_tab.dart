import 'package:flutter/material.dart';

class Summary2Tab extends StatelessWidget {
  const Summary2Tab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: const [
          TextField(
            decoration: InputDecoration(labelText: "date_finish"),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(labelText: "Cost_1"),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(labelText: "min portions"),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(labelText: "Practical"),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(labelText: "duty_hist"),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(labelText: "last update"),
          ),
        ],
      ),
    );
  }
}
