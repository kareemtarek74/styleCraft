import 'package:flutter/material.dart';

abstract class Styles {
  static TextStyle styleRegular14(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w400,
      fontFamily: 'Nunito',
      color: const Color(0xffBABABA),
    );
  }

  static TextStyle styleMedium16(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w500,
      fontFamily: 'Nunito',
      color: const Color(0xff00060D),
    );
  }

  static TextStyle styleExtraBold32(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 32),
      fontWeight: FontWeight.w800,
      fontFamily: 'Nunito',
      color: const Color(0xff000000),
    );
  }

  static TextStyle styleSmallBold14(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w800,
      fontFamily: 'Nunito',
      color: const Color(0xff000000),
    );
  }

  static TextStyle styleExtraBold24(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 24),
      fontWeight: FontWeight.w800,
      fontFamily: 'Nunito',
      color: const Color(0xff000000),
    );
  }

  static TextStyle styleSemiBold16(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w600,
      fontFamily: 'Nunito',
      color: const Color(0xff000000),
    );
  }

  static TextStyle styleBold40(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 40),
      fontWeight: FontWeight.w700,
      fontFamily: 'Nunito',
      color: const Color(0xff000000),
    );
  }
}

double getResoponsiveFontSize(BuildContext context,
    {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFotSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFotSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;

  return width / 400;
}
