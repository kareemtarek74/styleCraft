import 'package:flutter/material.dart';

abstract class Styles {
  static TextStyle bold13(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 13),
      fontWeight: FontWeight.bold,
      fontFamily: 'Cairo',
    );
  }

  static TextStyle bold23(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 23),
      fontWeight: FontWeight.bold,
      fontFamily: 'Cairo',
    );
  }

  static TextStyle semiBold13(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 13),
      fontWeight: FontWeight.w600,
      fontFamily: 'Cairo',
    );
  }

  static TextStyle regular13(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 13),
      fontWeight: FontWeight.normal,
      fontFamily: 'Cairo',
    );
  }

  static TextStyle bold16(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.bold,
      fontFamily: 'Cairo',
    );
  }

  static TextStyle bold19(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 19),
      fontWeight: FontWeight.bold,
      fontFamily: 'Cairo',
    );
  }

  static TextStyle semiBold16(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w600,
      fontFamily: 'Cairo',
    );
  }

  static TextStyle bold28(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 28),
      fontWeight: FontWeight.bold,
      fontFamily: 'Cairo',
    );
  }

  static TextStyle regular22(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 22),
      fontWeight: FontWeight.normal,
      fontFamily: 'Cairo',
    );
  }

  static TextStyle semiBold11(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 11),
      fontWeight: FontWeight.w600,
      fontFamily: 'Cairo',
    );
  }

  static TextStyle medium15(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 15),
      fontWeight: FontWeight.w500,
      fontFamily: 'Cairo',
    );
  }

  static TextStyle regular26(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 26),
      fontWeight: FontWeight.normal,
      fontFamily: 'Cairo',
    );
  }

  static TextStyle regular16(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.normal,
      fontFamily: 'Cairo',
    );
  }

  static TextStyle regular11(BuildContext context) {
    return TextStyle(
      fontSize: getResoponsiveFontSize(context, fontSize: 11),
      fontWeight: FontWeight.normal,
      fontFamily: 'Cairo',
    );
  }

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
