import 'package:flutter/material.dart';

import '../const.dart';

class DropDownWidget extends StatefulWidget {
  final String? title;
  const DropDownWidget({super.key, this.title});
  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String dropdownvalue = 'Select';
  // List of items in our dropdown menu
  var items = [
    'Select',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title!.isEmpty
            ? Container()
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
                child: Text(
                  widget.title!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: ktextColor,
                  ),
                ),
              ),
        Center(
          child: Container(
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
                  color: klightTextColor,
                  fontSize: 17,
                ),
                value: dropdownvalue,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: items.map(
                  (String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  },
                ).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
                isExpanded: true,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
