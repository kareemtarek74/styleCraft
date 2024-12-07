import 'package:flutter/material.dart';
import 'package:style_craft/Features/Auth/presentation/view/login_view.dart';
import 'package:style_craft/utils/text_styles.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacementNamed(LoginView.routeName);
      },
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
                text: 'Already have any account? ',
                style: Styles.styleRegular14(context).copyWith(
                  color: const Color(0xFF646E77),
                )),
            TextSpan(
              text: 'Login',
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
