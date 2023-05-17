import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:otp_project/constants/constants.dart';
import 'package:otp_project/screens/login_screen.dart';
import 'package:otp_project/utils/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color(0xff188F79),
          child: Padding(
            padding: kpaddingMargin,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("assets/images/Group 1.png"),
                SizedBox(
                  height: 22.0.h,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Let’s Get \n'
                    'Started',
                    style: textTheme.headlineLarge,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Connect with each other while chatting or calling. Enjoy safe and private texting',
                    style: textTheme.titleLarge,
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(22),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(MyRoutes.login_route);
                  },
                  child: Container(
                    height: 44.h,
                    width: double.infinity.w,
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Text(
                      "Join Now",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(20.0),
                        color: const Color(0xff188F79),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
