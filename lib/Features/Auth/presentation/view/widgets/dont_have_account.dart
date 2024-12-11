import 'package:flutter/material.dart';
import 'package:style_craft/Features/Auth/presentation/view/register_view.dart';

import '../../../../../core/utils/text_styles.dart';

class DidntHaveAccount extends StatelessWidget {
  const DidntHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacementNamed(RegisterView.routeName);
      },
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
                text: 'Do you have an account?  ',
                style: Styles.styleRegular14(context).copyWith(
                  color: const Color(0xFF646E77),
                )),
            TextSpan(
              text: 'Sign Up here',
              style: Styles.styleExtraBold24(context).copyWith(
                fontSize: 14,
                color: Colors.black,
                decoration: TextDecoration.underline,
                height: 0.10,
                letterSpacing: 0.20,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
