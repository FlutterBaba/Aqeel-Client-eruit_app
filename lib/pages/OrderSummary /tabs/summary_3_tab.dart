import 'package:flutter/material.dart';

import '../../../const.dart';

class Summary3Tab extends StatelessWidget {
  const Summary3Tab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Vat"),
                Row(
                  children: const [
                    Icon(
                      Icons.circle_outlined,
                      size: 15,
                      color: klightTextColor,
                    ),
                    SizedBox(width: 10),
                    Text("Note included")
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("discount_2˝"),
                      SizedBox(height: 5),
                      TextField(
                        decoration: InputDecoration(labelText: "0.00"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("%"),
                      SizedBox(height: 5),
                      TextField(
                        decoration: InputDecoration(labelText: "NaN"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(labelText: "date_finish"),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(labelText: "Cost_1"),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(labelText: "min portions"),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(labelText: "Practical"),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(labelText: "duty_hist"),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(labelText: "last update"),
            ),
          ],
        ),
      ),
    );
  }
}
