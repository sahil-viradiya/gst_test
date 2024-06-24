import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gst_verify/screens/processing_screen.dart';
import 'package:gst_verify/screens/signup_screen.dart';
import 'package:gst_verify/widgets/constants.dart';
import 'package:gst_verify/widgets/validation.dart';

import '../widgets/CustomButton.dart';
import '../widgets/CustomTextFromField.dart';

class VerifyGstPage extends StatefulWidget {
  const VerifyGstPage({super.key});

  @override
  State<VerifyGstPage> createState() => _VerifyGstPageState();
}

class _VerifyGstPageState extends State<VerifyGstPage> {
  String userName = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final DatabaseReference _userRef =
      FirebaseDatabase.instance.ref().child('users');

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  void _loadUserName() {
    _userRef
        .child(SignUpPage.verifay)
        .child('firstName')
        .onValue
        .listen((event) {
      if (event.snapshot.value != null) {
        setState(() {
          userName = event.snapshot.value.toString();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print("${SignUpPage.verifay}");

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          // crossAxisAlignment: CrossAxisAlignment.center,
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
            Text(
              "Hello ${userName},",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            3.ph,
            const Text(
              "Let's set-up your\nBusiness Account",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 17),
            ),
            4.ph,
          ],
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: Get.height / 2.1,
        padding: const EdgeInsets.all(40),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(25), topLeft: Radius.circular(25))),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 5, bottom: 20),
                child: Text(
                  "Enter your Email-id\nregistered with GST",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              CustomTextFormField(
                hintText: "Enter your Email",
                validator: (value) {
                  return Validator.validateEmails(value);
                },
              ),
              const Spacer(),
              CustomButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProcessPage(),
                          ));
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
    );
  }
}
