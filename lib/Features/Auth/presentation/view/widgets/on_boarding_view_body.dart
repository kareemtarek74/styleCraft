import 'package:flutter/material.dart';
import 'package:style_craft/Features/Auth/presentation/view/login_view.dart';
import 'package:style_craft/core/utils/app_images.dart';
import 'package:style_craft/core/widgets/custom_button.dart';
import 'package:style_craft/utils/text_styles.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffcbe3ff),
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
                    'Find your Perfect Products',
                    style: Styles.styleExtraBold32(context),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "We've helped alot across the nation find their perfect match... and you're next!",
                    style: Styles.styleRegular14(context)
                        .copyWith(color: const Color(0xFF646E77), fontSize: 16),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 1,
                            color: Color(0xFF181D20),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        )),
                    child: CustomButton(
                        backgroundColor: Colors.white,
                        text: 'Explore',
                        style: Styles.styleSemiBold16(context),
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(LoginView.routeName);
                        }),
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  const Image(
                      fit: BoxFit.cover,
                      width: double.infinity,
                      image: AssetImage(Assets.imagesNomadsStanding)),
                  const SizedBox(
                    height: 50,
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
