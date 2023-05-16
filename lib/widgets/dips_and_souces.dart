import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/souces_controller.dart';

class DipsAndSaucesWidget extends StatelessWidget {
  DipsAndSaucesWidget({
    super.key,
  });

  List<Map> soucesList = [
    {
      "title": "Teriyaki",
      "price": "\$0.9",
    },
    {
      "title": "Soy Sauce",
      "price": "\$0.5",
    },
    {
      "title": "Spicy Mayo",
      "price": "\$1.0",
    },
    {
      "title": "Wasabi Mayo",
      "price": "\$2.0",
    },
  ];

  @override
  Widget build(BuildContext context) {
    SauceController myController = Get.find();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(12),
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: // Title
            Column(
          children: [
            // Title
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 08,
                ),
                child: Text(
                  "Dips & Sauces",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              height: 110,
              child: ListView.builder(
                itemCount: soucesList.length,
                itemBuilder: (context, index) {
                  final eachItem = soucesList[index];
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              GetBuilder<SauceController>(
                                builder: (controller) => InkWell(
                                  onTap: () {
                                    if (myController.listOfSouces.contains(
                                        eachItem["title"].toString())) {
                                      null;
                                    } else {
                                      myController.setSauces(
                                          eachItem["title"].toString());
                                    }
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: myController.listOfSouces
                                              .contains(eachItem["title"])
                                          ? Color(0xffeb7039)
                                          : Colors.grey,
                                      // border: Border.all(
                                      //   color: const Color(0xffc7d1d9),
                                      //   width: 2,
                                      // ),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(3.0),
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(eachItem["title"].toString()),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            eachItem["price"].toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
