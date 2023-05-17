import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:developer' as devtools show log;

import 'package:otp_project/screens/home_screen.dart';
import 'package:otp_project/screens/login_screen.dart';
import 'package:otp_project/screens/splash_screen.dart';
import 'package:otp_project/screens/verify_otp_screen.dart';
import 'package:otp_project/utils/helper.dart' as di;
import 'package:otp_project/utils/routes.dart';

void main() async {
  // Add this line
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().whenComplete(
    () {
      devtools.log("Firebase Initialized Successfully...");
    },
  );
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => const SplashScreen(),
          MyRoutes.login_route: (context) => const LoginPage(),
          MyRoutes.verify_otp_route: (context) => const VerifyOtpPage(),
          MyRoutes.home_route: (context) => HomeScreen(),
        },
      ),
    );
  }
}
