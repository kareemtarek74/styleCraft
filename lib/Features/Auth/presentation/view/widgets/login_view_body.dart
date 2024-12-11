import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_craft/Features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:style_craft/Features/Auth/presentation/view/widgets/dont_have_account.dart';
import 'package:style_craft/core/utils/text_styles.dart';
import 'package:style_craft/core/widgets/custom_button.dart';
import 'package:style_craft/core/widgets/custom_password_field.dart';
import 'package:style_craft/core/widgets/custom_phone_field.dart';

import '../../../../../core/utils/app_images.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: BlocProvider.of<AuthCubitCubit>(context).loginFormKey,
            autovalidateMode: autovalidateMode,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Image(
                    width: double.infinity,
                    fit: BoxFit.cover,
                    image: AssetImage(Assets.imagesIllustration),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: Styles.styleExtraBold32(context),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomPhoneField(
                          controller: context
                              .read<AuthCubitCubit>()
                              .loginPhoneController,
                          initialCountryCode: 'EG',
                          onPhoneChanged: (completeNumber, number) {
                            context
                                .read<AuthCubitCubit>()
                                .validatePhoneNumber(completeNumber, number);
                          },
                          onCountryChanged: (dialCode, minLength, maxLength) {
                            context.read<AuthCubitCubit>().updateCountryCode(
                                dialCode, minLength, maxLength);
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomPasswordField(
                          controller: context
                              .read<AuthCubitCubit>()
                              .loginPasswordController,
                        ),
                        const SizedBox(height: 16),
                        CustomButton(
                          hight: 60,
                          backgroundColor: Colors.black,
                          onPressed: () {
                            if (BlocProvider.of<AuthCubitCubit>(context)
                                .loginFormKey
                                .currentState!
                                .validate()) {
                              BlocProvider.of<AuthCubitCubit>(context)
                                  .loginUser();
                            } else {
                              setState(() {
                                autovalidateMode = AutovalidateMode.always;
                              });
                            }
                          },
                          text: 'Login',
                          style: Styles.styleSemiBold16(context)
                              .copyWith(color: Colors.white, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Center(child: DidntHaveAccount())
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
