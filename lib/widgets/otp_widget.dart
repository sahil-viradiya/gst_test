import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';



class OTPWidget extends StatelessWidget {
  const OTPWidget({super.key,this.controller,this.validator});
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      //controller: controller.smsCode,
      length: 6,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      validator:validator,
      isCursorAnimationEnabled: true,
      pinAnimationType: PinAnimationType.fade,
      closeKeyboardWhenCompleted: true,
      keyboardType: TextInputType.number,
      listenForMultipleSmsOnAndroid: true,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      animationDuration: Durations.long1,
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
      controller: controller,
      animationCurve: Curves.bounceOut,
      defaultPinTheme: PinTheme(
        height: 50.0,
        width: 50.0,
        textStyle:TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ) ,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(
            color: Colors.black,
            width: 1.5,
          ),
        ),
      ),
      focusedPinTheme: PinTheme(
        height: 55.0,
        width: 55.0,
        textStyle: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ) ,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(
            color: Colors.black,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}