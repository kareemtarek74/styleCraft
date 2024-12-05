import 'package:flutter/material.dart';
import 'package:style_craft/utils/text_styles.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Find the Perfect Roommate',
                    style: Styles.styleExtraBold32(context),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
