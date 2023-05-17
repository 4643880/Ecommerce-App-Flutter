import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:otp_project/constants/constants.dart';
import 'package:otp_project/config/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: ScreenUtilInit(
          designSize: Size(width, height),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) => Container(
            width: width,
            height: height,
            color: const Color(0xff188F79),
            child: SingleChildScrollView(
              child: Padding(
                padding: kpaddingMargin,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    Image.asset(
                      "assets/images/Group 1.png",
                      height: ScreenUtil().setHeight(300),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(22),
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
                      height: 22.0.h,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(MyRoutes.login_route);
                      },
                      child: Container(
                        height: 44.h,
                        width: double.infinity,
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: Text(
                          "Join Now",
                          style: TextStyle(
                            fontSize: 20.0.sp,
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
        ),
      ),
    );
  }
}
