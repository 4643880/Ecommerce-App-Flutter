import 'package:flutter/material.dart';

class MyDropDownWidget extends StatefulWidget {
  final String heading;
  String selectedValueOfItem;
  final String dropdownTitle;
  final List<DropdownMenuItem<String>> getDropdownMenuItems;

  MyDropDownWidget(
    this.selectedValueOfItem, {
    super.key,
    required this.heading,
    required this.dropdownTitle,
    required this.getDropdownMenuItems,
  });

  @override
  State<MyDropDownWidget> createState() => _MyDropDownWidgetState();
}

class _MyDropDownWidgetState extends State<MyDropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(widget.heading),
          ),
        ),
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 03),
            child: DropdownButton(
              isExpanded: true,
              underline: const SizedBox(),
              value: widget.selectedValueOfItem,
              items: widget.getDropdownMenuItems,
              onChanged: (value) {
                setState(() {
                  print(value);
                  widget.selectedValueOfItem = value!;
                });
              },
            ),
          ),
          // child: Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     const Text(
          //       "   " + "Select Quantity",
          //       maxLines: 1,
          //       overflow: TextOverflow.ellipsis,
          //     ),
          //     DropdownButton(
          //       value: widget.selectedValueOfItem,
          //       items: widget.getDropdownMenuItems,
          //       onChanged: (value) {
          //         setState(() {
          //           print(value);
          //           widget.selectedValueOfItem = value!;
          //         });
          //       },
          //     ),
          //   ],
          // ),
        ),
      ],
    );
  }
}
