import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/quantity_controller.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({
    super.key,
    required this.quantityList,
    required this.controller,
  });

  final List<Map> quantityList;
  final QuantityController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(08.0),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(12),
        height: 370,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            // Title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Title
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 08,
                  ),
                  child: Text(
                    "Quantity",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                // Required
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: const Color(0xffeb7039),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 05,
                        horizontal: 08,
                      ),
                      child: Text(
                        "Required",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            // Radio Tile
            Column(
              children: quantityList.map((index) {
                return Obx(
                  () => RadioListTile<String>(
                    tileColor: Colors.black,
                    dense: true,
                    activeColor: const Color(0xffeb7039),
                    title: Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            index["title"],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            index["desc"],
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                    value: index["title"],
                    groupValue: controller.quantity,
                    onChanged: (newQuantity) {
                      controller.setQuantity(newQuantity!);
                    },
                  ),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
