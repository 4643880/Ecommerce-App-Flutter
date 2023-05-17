import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_project/controllers/auth_controller.dart';
import 'package:otp_project/screens/home_screen.dart';
import 'package:otp_project/config/routes.dart';

class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage({Key? key}) : super(key: key);

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  late final TextEditingController _otpController;

  @override
  void initState() {
    _otpController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthController _authController = Get.find();
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Image(
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1614064643087-96ce7f0737c8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8dmVyaWZpY2F0aW9ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),
              fit: BoxFit.cover,
              // height: 300,
              // width: 300,
            ),
            const SizedBox(
              width: 200,
              height: 10,
            ),
            const Text(
              "Verification Screen",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 200,
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 30,
              ),
              child: Column(
                children: [
                  TextFormField(
                    controller: _otpController,
                    decoration: const InputDecoration(
                      hintText: "Enter Your OTP",
                      labelText: "OTP",
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(
                    width: 200,
                    height: 40,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 30,
                        )),
                    onPressed: () {
                      if (_otpController.text.isNotEmpty) {
                        _authController.verifyOTP(
                          context,
                          otp: _otpController.text,
                        );
                      }
                      Get.toNamed(MyRoutes.home_route);
                    },
                    child: const Text(
                      "Verify",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
