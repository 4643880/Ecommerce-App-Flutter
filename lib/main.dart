import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer' as devtools show log;

import 'package:otp_project/screens/home_screen.dart';
import 'package:otp_project/screens/login_screen.dart';
import 'package:otp_project/screens/splash_screen.dart';
import 'package:otp_project/screens/verify_otp_screen.dart';
import 'package:otp_project/helper/helper.dart' as di;
import 'package:otp_project/config/routes.dart';

void main() async {
  // Add this line
  // await ScreenUtil.ensureScreenSize();
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
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const SplashScreen(),
        MyRoutes.login_route: (context) => const LoginPage(),
        MyRoutes.verify_otp_route: (context) => const VerifyOtpPage(),
        MyRoutes.home_route: (context) => HomeScreen(),
        MyRoutes.splash_route: (context) => const SplashScreen(),
      },
    );
  }
}
