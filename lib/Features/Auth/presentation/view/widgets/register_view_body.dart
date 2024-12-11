import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_craft/Features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:style_craft/Features/Auth/presentation/view/widgets/already_have_account.dart';
import 'package:style_craft/core/utils/app_images.dart';
import 'package:style_craft/core/widgets/custom_button.dart';
import 'package:style_craft/core/widgets/custom_phone_field.dart';

import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/custom_password_field.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: BlocProvider.of<AuthCubitCubit>(context).registerFormKey,
            autovalidateMode: autovalidateMode,
            child: Stack(
              children: [
                // Background Image
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: const Image(
                    image: AssetImage(Assets.imagesRegister),
                    width: double.infinity,
                    height: 380,
                    fit: BoxFit.cover,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 240),
                      Text(
                        'Register',
                        style: Styles.styleExtraBold32(context),
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormField(
                        controller: BlocProvider.of<AuthCubitCubit>(context)
                            .registerNameController,
                        hintText: 'Name...',
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(height: 16),
                      CustomPhoneField(
                        controller: BlocProvider.of<AuthCubitCubit>(context)
                            .registerPhoneController,
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormField(
                        controller: BlocProvider.of<AuthCubitCubit>(context)
                            .registerAddressController,
                        hintText: 'Address...',
                      ),
                      const SizedBox(height: 16),
                      CustomPasswordField(
                        controller: BlocProvider.of<AuthCubitCubit>(context)
                            .registerPasswordController,
                      ),
                      const SizedBox(height: 24),
                      CustomButton(
                        hight: 60,
                        backgroundColor: Colors.black,
                        text: 'Sign up',
                        style: Styles.styleSemiBold16(context)
                            .copyWith(color: Colors.white, fontSize: 18),
                        onPressed: () {
                          if (BlocProvider.of<AuthCubitCubit>(context)
                              .registerFormKey
                              .currentState!
                              .validate()) {
                            BlocProvider.of<AuthCubitCubit>(context)
                                .registerUser();
                          } else {
                            setState(() {
                              autovalidateMode = AutovalidateMode.always;
                            });
                          }
                        },
                      ),
                      const SizedBox(height: 24),
                      const AlreadyHaveAccount(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
