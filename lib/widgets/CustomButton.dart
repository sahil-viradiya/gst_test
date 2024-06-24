import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color boxColor;
  final TextStyle style;
  final GestureTapCallback? onTap;

  CustomButton({
    super.key,
    required this.title,
    required this.boxColor,
    required this.style,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: boxColor,
      ),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            "${title}",
            style: style,
          ),
        ),
      ),
    );
  }
}
