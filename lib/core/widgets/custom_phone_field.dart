import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../utils/text_styles.dart';

class CustomPhoneField extends StatelessWidget {
  final String initialCountryCode;
  final Function(String completeNumber, String number)? onPhoneChanged;
  final Function(String dialCode, int minLength, int maxLength)?
      onCountryChanged;
  final TextEditingController? controller;

  const CustomPhoneField({
    super.key,
    this.initialCountryCode = 'EG',
    this.onPhoneChanged,
    this.onCountryChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        counterText: "",
        labelText: "123 456-7890",
        labelStyle:
            Styles.styleRegular14(context).copyWith(color: Colors.black),
        border: buildBorder(),
        contentPadding: const EdgeInsets.all(15),
        focusedBorder: buildBorder(),
        enabledBorder: buildBorder(),
      ),
      initialCountryCode: initialCountryCode,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (phone) {
        if (onPhoneChanged != null) {
          onPhoneChanged!(phone.completeNumber, phone.number);
        }
      },
      dropdownIcon: const Icon(
        size: 16,
        FontAwesomeIcons.angleDown,
        color: Color(0xff7F7F7F),
      ),
      flagsButtonMargin: const EdgeInsets.only(left: 8, right: 4),
      dropdownTextStyle: Styles.styleSmallBold14(context),
      dropdownIconPosition: IconPosition.trailing,
      onCountryChanged: (country) {
        if (onCountryChanged != null) {
          onCountryChanged!(
              country.dialCode, country.minLength, country.maxLength);
        }
      },
    );
  }
}

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: const BorderSide(color: Color(0xFFABB8C2), width: 1),
  );
}
