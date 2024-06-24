import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gst_verify/screens/profile_screen.dart';
import 'package:gst_verify/screens/signup_screen.dart';
import 'package:gst_verify/widgets/constants.dart';

import '../widgets/CustomButton.dart';
import '../widgets/otp_widget.dart';
import '../widgets/validation.dart';

class OtpScreen extends StatefulWidget {
  String phonenumber;

  OtpScreen({super.key, required this.phonenumber});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController pinPutController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomSheet: Container(
        width: double.infinity,
        height: Get.height / 2.5,
        padding: const EdgeInsets.all(40),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(25), topLeft: Radius.circular(25))),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              OTPWidget(
                controller: pinPutController,
                validator: ((value) {
                  return Validator.validateMobileOtp(value!);
                }),
              ),
              2.ph,
              const Text(
                "Didn't resend OTP?",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              2.ph,
              InkWell(
                onTap: () {
                  sendOTP(widget.phonenumber);
                },
                child: const Text(
                  "Resend OTP",
                  style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Spacer(),
              const Text(
                "By proceeding you are Indicating that\nyou have read and agree to our.",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  children: [
                    TextSpan(
                        text: "Terms of Use",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        )),
                    TextSpan(text: " and "),
                    TextSpan(
                        text: "Privacy Policy",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ))
                  ],
                ),
              ),
              1.ph,
              CustomButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                        verificationId: SignUpPage.verifay,
                        smsCode: pinPutController.value.text,
                      );
                      await auth.signInWithCredential(credential).then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProfilePage(),
                            ));
                      });
                    }
                  },
                  title: "CONTINUE",
                  boxColor: Colors.black,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ))
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height / 10,
            ),
            const Image(
              image: AssetImage("assets/image/whitelogo.png"),
              height: 200,
              width: 200,
              fit: BoxFit.fill,
            ),
            const Text(
              "Enter OTP sent to your\nMobile Number",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 20),
            ),
            8.ph,
          ],
        ),
      ),
    );
  }
}
