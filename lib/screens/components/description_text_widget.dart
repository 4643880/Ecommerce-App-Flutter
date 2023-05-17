import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_project/controllers/height_controller.dart';

import '../../constants/constants.dart';

class DescriptionTextWidget extends StatefulWidget {
  final String text;

  DescriptionTextWidget({
    super.key,
    required this.text,
  });

  @override
  State<DescriptionTextWidget> createState() => _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  late final String firstHalf;
  late final String secondHalf;
  bool flag = true;

  @override
  void initState() {
    if (widget.text.length > 140) {
      firstHalf = widget.text.substring(0, 140);
      secondHalf = widget.text.substring(140, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HeightController myController = Get.find();
    return Container(
      child: secondHalf.isEmpty
          ? Column(
              children: [
                Text(
                  firstHalf,
                  textAlign: TextAlign.end,
                ),
              ],
            )
          : Column(
              children: [
                Text(
                  flag ? (firstHalf + "...") : (firstHalf + secondHalf),
                  textAlign: TextAlign.justify,
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      flag = !flag;
                      print(flag);
                    });
                    if (flag == true) {
                      myController.setHeight(230);
                    } else {
                      myController.setHeight(280);
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        flag ? "see more" : "see less",
                        style: const TextStyle(color: Color(0xffeb7039)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
