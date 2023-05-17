import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_project/controllers/auth_controller.dart';
import 'package:otp_project/screens/verify_otp_screen.dart';
import 'dart:developer' as devtools show log;

import 'package:otp_project/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _phoneController;
  String countryCode = "";

  @override
  void initState() {
    _phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _phoneController.dispose();
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
                  "https://images.unsplash.com/photo-1509822929063-6b6cfc9b42f2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"),
              fit: BoxFit.cover,
              // height: 300,
              // width: 300,
            ),
            const SizedBox(
              width: 200,
              height: 10,
            ),
            const Text(
              "Welcome",
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
                  ElevatedButton(
                    onPressed: () {
                      showCountryPicker(
                        context: context,
                        onSelect: (Country value) {
                          devtools.log(value.countryCode.toString());
                          devtools.log(value.phoneCode.toString());
                          setState(() {
                            countryCode = value.phoneCode.toString();
                          });
                        },
                      );
                    },
                    child: countryCode == ""
                        ? Text("Tap")
                        : Text(countryCode.toString()),
                  ),
                  TextFormField(
                    controller: _phoneController,
                    decoration: const InputDecoration(
                      hintText: "Enter Your Phone Number",
                      labelText: "Phone Number",
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
                      String phoneNumber =
                          "+$countryCode${_phoneController.text}";
                      _authController.sendOtp(
                        context,
                        phoneNumber: phoneNumber,
                      );
                      Get.toNamed(MyRoutes.verify_otp_route);
                    },
                    child: const Text(
                      "Login",
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
