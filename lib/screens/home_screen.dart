import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_project/controllers/quantity_controller.dart';
import 'package:otp_project/widgets/description_text_widget.dart';
import 'package:otp_project/widgets/extras_widget.dart';
import 'package:otp_project/widgets/quantity_widget.dart';
import 'package:otp_project/widgets/slider.dart';
import 'dart:developer' as devtools show log;

import 'package:otp_project/widgets/title_ratings_description_widget.dart';

import '../widgets/dips_and_souces.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<Map> quantityList = [
    {
      "title": "For One",
      "desc":
          "100g Organic Scottish Sashimi Salmon (5-8pcs) + Sushi Rice Bowl + Japanese Mayo + Soy/Ginger/Wasabi + 2 Nori Sheets (4 Handrolls or 16 pcs)"
    },
    {
      "title": "For Two",
      "desc":
          "250g Organic Scottish sashimi Salmon (14-18pcs) + 2 Sushi Rice Bowls + 1 Japanese Mayo + Soy/ Ginger/Wasabi + 4 Nori Sheets (8 Handrolls or 32 pieces)"
    },
  ];

  @override
  Widget build(BuildContext context) {
    QuantityController controller = Get.find();
    return Scaffold(
      backgroundColor: const Color(0xfff4f7fb),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.share,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              //=======================================================
              // Silder
              //=======================================================
              const HomeSlider(),
              //=======================================================
              // Title, Rating, Description
              //=======================================================
              const TitleRatingsDescriptionWidget(),
              //=======================================================
              // Quantity
              //=======================================================
              QuantityWidget(
                quantityList: quantityList,
                controller: controller,
              ),
              //=======================================================
              // Extras
              //=======================================================
              ExtrasWidget(),
              //=======================================================
              // Dips & Souces
              //=======================================================
              DipsAndSaucesWidget(),
            ],
          ),
        ),
      ),
    );
  }
}