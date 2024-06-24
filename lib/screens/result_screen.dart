import 'package:flutter/material.dart';
import 'package:gst_verify/widgets/constants.dart';

import '../widgets/CustomButton.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Container(
                height: 75,
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black, width: 1.5)),
                child: const Text(
                  "ABC Private Limited",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              1.5.ph,
              Container(
                alignment: Alignment.center,
                height: 75,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black, width: 1.5)),
                child: const Text(
                  "ABC Private Limited",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              1.5.ph,
              Container(
                alignment: Alignment.center,
                height: 75,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black, width: 1.5)),
                child: const Text(
                  "ABC Private Limited",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              const Spacer(),
              CustomButton(
                  onTap: () {},
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
