import 'package:flutter/material.dart';
import '../const.dart';

class DropDownWidget extends StatefulWidget {
  final String? title;
  final List<String> items;
  final Function(String?)? onTap;
  final String value;
  const DropDownWidget({
    super.key,
    this.title,
    required this.value,
    required this.onTap,
    required this.items,
  });
  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
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
          child: DropdownButtonHideUnderline(
            child: DropdownButtonFormField(
              itemHeight: 60,
              style: const TextStyle(
                color: klightTextColor,
                fontSize: 17,
              ),
              value: widget.value,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: widget.items.map(
                (items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                },
              ).toList(),
              onChanged: widget.onTap,
              isExpanded: true,
            ),
          ),
        ),
      ],
    );
  }
}
