import 'package:flutter/material.dart';

class Summary1Tab extends StatelessWidget {
  const Summary1Tab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [
          TextField(
            decoration: InputDecoration(labelText: "Add common"),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(labelText: "Num Portions"),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(labelText: "Possible Portions"),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(labelText: "Addition 1"),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(labelText: "Last User"),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(labelText: "Text 1"),
          ),
        ],
      ),
    );
  }
}
