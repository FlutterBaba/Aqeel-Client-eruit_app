import 'package:eruit_app/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Summary1Tab extends StatelessWidget {
  const Summary1Tab({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: OverflowBar(
        overflowSpacing: 20,
        children: [
          TextField(
            controller: authProvider.addCommon,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: "Add common",
            ),
          ),
          TextField(
            controller: authProvider.numCommon,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Num Portions"),
          ),
          const TextField(
            decoration: InputDecoration(labelText: "Possible Portions"),
          ),
          const TextField(
            decoration: InputDecoration(labelText: "Addition 1"),
          ),
          const TextField(
            decoration: InputDecoration(labelText: "Last User"),
          ),
          const TextField(
            decoration: InputDecoration(labelText: "Text 1"),
          ),
        ],
      ),
    );
  }
}
