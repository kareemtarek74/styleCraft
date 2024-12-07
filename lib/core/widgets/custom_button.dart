import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.style,
    required this.onPressed,
    required this.backgroundColor,
    this.hight = 49,
  });
  final String text;
  final TextStyle? style;
  final void Function() onPressed;
  final Color backgroundColor;
  final double hight;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            fixedSize: Size(MediaQuery.sizeOf(context).width, hight),
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: style,
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        ));
  }
}
