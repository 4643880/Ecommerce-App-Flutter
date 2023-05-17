import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:otp_project/screens/home_screen.dart';
import 'dart:developer' as devtools show log;

import 'package:otp_project/screens/login_screen.dart';
import 'package:otp_project/screens/verify_otp_screen.dart';
import 'package:otp_project/utils/show_error_dialog.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // =======================================================
  // Send OTP
  // =======================================================
  String? _verificationId;
  void sendOtp(
    BuildContext context, {
    required String phoneNumber,
  }) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
        signInWithPhone(phoneAuthCredential, context);
      },
      verificationFailed: (FirebaseAuthException error) {
        showErrorDialog(context, "Something Went Wrong", error.toString());
      },
      codeSent: (verificationId, forceResendingToken) {
        _verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        _verificationId = verificationId;
      },
    );
  }

  // =======================================================
  // SignIn With Phone
  // =======================================================
  void signInWithPhone(
    PhoneAuthCredential phoneAuthCredential,
    BuildContext context,
  ) async {
    try {
      UserCredential userCredential =
          await _auth.signInWithCredential(phoneAuthCredential);
      // if (userCredential.user != null) {
      //   Get.to(HomeScreen());
      // }
    } catch (e) {
      showErrorDialog(context, "Something Went Wrong", e.toString());
    }
  }

  // =======================================================
  // Verify OTP
  // =======================================================
  void verifyOTP(BuildContext context, {required String otp}) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: otp,
      );
      signInWithPhone(credential, context);
    } catch (e) {
      showErrorDialog(context, "Something Went Wrong", e.toString());
    }
  }

  // =======================================================
  // Logout
  // =======================================================
  void logOut() async {
    await _auth.signOut();
    // Get.to(const LoginPage());
  }
}
