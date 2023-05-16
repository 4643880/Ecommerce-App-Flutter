import 'package:flutter/material.dart';

import 'my_drop_down_widget.dart';

class ExtrasWidget extends StatefulWidget {
  ExtrasWidget({
    super.key,
  });

  @override
  State<ExtrasWidget> createState() => _ExtrasWidgetState();
}

class _ExtrasWidgetState extends State<ExtrasWidget> {
  // For Quantity
  String selectedValueOfQuantity = "One";
  List<DropdownMenuItem<String>> get dropdownItemsOfQuantity {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "One", child: Text("One")),
      const DropdownMenuItem(value: "Two", child: Text("Two")),
      const DropdownMenuItem(value: "Three", child: Text("Three")),
      const DropdownMenuItem(value: "Four", child: Text("Four")),
    ];
    return menuItems;
  }

  // Increase Quantity
  String selectedValueOfIncreasedItems = "1 Kg";
  List<DropdownMenuItem<String>> get dropdownItemsIncreasedItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "1 Kg", child: Text("1 Kg")),
      const DropdownMenuItem(value: "2 Kg", child: Text("2 Kg")),
      const DropdownMenuItem(value: "3 Kg", child: Text("3 Kg")),
      const DropdownMenuItem(value: "4 Kg", child: Text("4 Kg")),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 275,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Title
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 08,
                ),
                child: Text(
                  "Extras",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // Quantity
            MyDropDownWidget(
              selectedValueOfQuantity,
              heading: "Crabsticks (Osaka Brand for Sushi",
              dropdownTitle: "Select Quantity",
              getDropdownMenuItems: dropdownItemsOfQuantity,
            ),
            const SizedBox(
              height: 20,
            ),
            // Increasing Weight of Item
            MyDropDownWidget(
              selectedValueOfIncreasedItems,
              heading:
                  "Extra Organic Scottish Sashmi Salmon (served with 1 soy/ginger/wasabi)",
              dropdownTitle: "  1Kg: 70+ sashimi pieces (\$68.0)",
              getDropdownMenuItems: dropdownItemsIncreasedItems,
            ),
          ],
        ),
      ),
    );
  }
}
