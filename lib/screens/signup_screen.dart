import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gst_verify/screens/otp_screen.dart';
import 'package:gst_verify/widgets/CustomButton.dart';
import 'package:gst_verify/widgets/CustomTextFromField.dart';
import 'package:gst_verify/widgets/constants.dart';
import 'package:gst_verify/widgets/validation.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  static String verifay = "";

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  RxBool isChecked = false.obs;
  TextEditingController number = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    toggleChecked();
  }

  void toggleChecked() {
    isChecked.value = !isChecked.value;
    print("ischecked value: $isChecked");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      bottomSheet: Container(
        width: double.infinity,
        height:  Get.height / 2.5,
        padding: const EdgeInsets.all(40),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(25), topLeft: Radius.circular(25))),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 5, bottom: 2),
                child: Text(
                  "Mobile Number",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              CustomTextFormField(
                keyboardType: TextInputType.number,
                controller: number,
                hintText: "Enter your Number",
                validator: (value) {
                  return Validator.validateMobile(value);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          toggleChecked();
                        });
                      },
                      child: Container(
                        height: 20,
                        width: 20,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          color: isChecked.value
                              ? Colors.black
                              : Colors.transparent,
                        ),
                        child: isChecked.value
                            ? const Icon(
                                Icons.check,
                                size: 16,
                                color: Colors.white,
                              )
                            : null,
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        "Enable WhatsApp permission to send reminders, updates etc.",
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              CustomButton(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    sendOTP(number.text).then((value) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpScreen(
                            phonenumber: number.text,
                          ),
                        ),
                      );
                    });
                  }
                },
                title: "SEND OTP",
                boxColor: Colors.black,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: Get.height/10,),

            const Image(
              image: AssetImage("assets/image/whitelogo.png"),
              height: 200,
              width: 200,
              fit: BoxFit.fill,
            ),
            const Text(
              "Create Your Account",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            const SizedBox(height: 3),
            const Text(
              "Please enter your\nMobile number",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 17),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

Future<void> sendOTP(
  String phonNumber,
) async {
  await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: '${"+91" + phonNumber}',
    verificationCompleted: (PhoneAuthCredential credential) {

    },
    verificationFailed: (FirebaseAuthException e) {},
    timeout: const Duration(seconds: 60),
    codeSent: (String verificationId, int? resendToken) {
      SignUpPage.verifay = (verificationId);
      print("=====${verificationId}");
      print("=====${resendToken}");
    },

    codeAutoRetrievalTimeout: (String verificationId) {},

  );
}
