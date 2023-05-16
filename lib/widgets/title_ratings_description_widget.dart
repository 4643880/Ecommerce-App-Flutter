import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_project/controllers/height_controller.dart';
import 'dart:developer' as devtools show log;

import 'package:otp_project/widgets/description_text_widget.dart';

import '../constants/constants.dart';

class TitleRatingsDescriptionWidget extends StatelessWidget {
  const TitleRatingsDescriptionWidget({
    super.key,
  });

  final heightOfTitleContainer = 230.0;

  @override
  Widget build(BuildContext context) {
    HeightController myHeightController = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 08),
      child: Obx(
        () => AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          height: myHeightController.height,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Title
                  const Text(
                    "Combo Scottish Salmon/Rice Bowl Sushiguide",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  // Price + Earn Points
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Price
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 08,
                        ),
                        child: Text(
                          "\$10.9-\$23.5",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                      // Earn Points
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          color: const Color(0xffdcfcf3),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 03,
                              horizontal: 08,
                            ),
                            child: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: 3,
                                  ),
                                  child: Icon(
                                    Icons.circle_notifications,
                                    color: Color(0xff2dc398),
                                  ),
                                ),
                                Text(
                                  "Earn up to 235 points",
                                  style: TextStyle(
                                    color: Color(0xff2dc398),
                                    fontSize: 10,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  // Reviews + Ratings
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Ratings
                      Row(
                        children: const [
                          // Ratings
                          Icon(
                            Icons.star,
                            color: Color(0xffe9ab4c),
                            size: 25,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 08,
                            ),
                            child: Text(
                              "4.4",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 08,
                            ),
                            child: Text(
                              "  (200)",
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Reviews
                      GestureDetector(
                        onTap: () {
                          devtools.log("clicing...");
                        },
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 08,
                              ),
                              child: Text(
                                "Reviews ",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0xffeb7039),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 08,
                              ),
                              child: Icon(
                                Icons.navigate_next,
                                color: Color(0xffeb7039),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Description Text Widget
                  Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        DescriptionTextWidget(
                          text:
                              "Flutter is Google’s mobile UI framework for crafting high-quality native interfaces on iOS and Android in record time. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
