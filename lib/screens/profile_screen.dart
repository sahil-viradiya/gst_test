import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gst_verify/screens/signup_screen.dart';
import 'package:gst_verify/screens/verify_screen.dart';
import 'package:gst_verify/widgets/constants.dart';

import '../widgets/CustomButton.dart';
import '../widgets/CustomTextFromField.dart';
import '../widgets/validation.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final DatabaseReference _userRef =
      FirebaseDatabase.instance.ref().child('users');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  void _saveUserData() async {
    await _userRef.child(SignUpPage.verifay).set({
      'firstName': firstNameController.text.trim(),
      'lastName': lastNameController.text.trim(),
    });
  }

  @override
  Widget build(BuildContext context) {
    print("${SignUpPage.verifay}");
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height / 10,
            ),
            const Image(
              image: AssetImage("assets/image/blacklogo.png"),
              height: 200,
              width: 200,
              fit: BoxFit.fill,
            ),
            const Text(
              "Please tell us your Name",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 20),
            ),
            8.ph,
          ],
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: Get.height / 2,
        padding: const EdgeInsets.all(40),
        decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(25), topLeft: Radius.circular(25))),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  "First Name",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              CustomTextFormField(
                controller: firstNameController,
                boxColor: Colors.white,
                textColor: Colors.white,
                hintText: "Enter your name",
                validator: (value) {
                  return Validator.validateFirstName(value);
                },
              ),
              2.ph,
              const Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  "Last Name",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              CustomTextFormField(
                controller: lastNameController,
                boxColor: Colors.white,
                textColor: Colors.white,
                hintText: "Enter your name",
                validator: (value) {
                  return Validator.validateLastName(value);
                },
              ),
              const Spacer(),
              CustomButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      _saveUserData();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const VerifyGstPage(),
                          ));
                    }
                  },
                  title: "CONTINUE",
                  boxColor: Colors.white,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
