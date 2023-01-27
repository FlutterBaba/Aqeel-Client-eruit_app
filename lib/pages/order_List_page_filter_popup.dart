import 'package:eruit_app/const.dart';
import 'package:flutter/material.dart';

enum SingingCharacter { eventdate, orderdate, lastupdate }

class OrderListPageFilterPopup extends StatefulWidget {
  const OrderListPageFilterPopup({super.key});

  @override
  State<OrderListPageFilterPopup> createState() =>
      _OrderListPageFilterPopupState();
}

class _OrderListPageFilterPopupState extends State<OrderListPageFilterPopup> {
  SingingCharacter _character = SingingCharacter.eventdate;
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
        leading: const BackButton(),
        title: const Text("Order Filter"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: ListView(
          children: [
            const Text("Doc"),
            const SizedBox(height: 10),
            Row(
              children: const [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: "From Order"),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: "From Order"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text("Doc"),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: "From Date - To Date",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.date_range_rounded),
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text("Order total"),
            const SizedBox(height: 10),
            Row(
              children: const [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: "From Total"),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: "To Total"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text("Hall"),
            const SizedBox(height: 10),
            const TextField(),
            const SizedBox(height: 10),
            const Text("Status"),
            const SizedBox(height: 10),
            const TextField(),
            const SizedBox(height: 10),
            const Text("Date filter type"),
            const SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  child: RadioListTile<SingingCharacter>(
                    contentPadding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: _character == SingingCharacter.eventdate
                            ? kpColor
                            : kborderColor,
                      ),
                    ),
                    title: const Text(
                      'Event Date',
                    ),
                    value: SingingCharacter.eventdate,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: RadioListTile<SingingCharacter>(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Order Date'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: _character == SingingCharacter.orderdate
                            ? kpColor
                            : kborderColor,
                      ),
                    ),
                    value: SingingCharacter.orderdate,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: RadioListTile<SingingCharacter>(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Last Upd'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: _character == SingingCharacter.lastupdate
                            ? kpColor
                            : kborderColor,
                      ),
                    ),
                    value: SingingCharacter.lastupdate,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
