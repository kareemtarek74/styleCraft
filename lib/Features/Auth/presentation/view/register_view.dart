import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:style_craft/Features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:style_craft/Features/Auth/presentation/cubit/auth_state.dart';
import 'package:style_craft/Features/Auth/presentation/view/login_view.dart';
import 'package:style_craft/Features/Auth/presentation/view/widgets/register_view_body.dart';
import 'package:style_craft/core/widgets/custom_success_snack_bar.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const String routeName = "register";
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubitCubit, AuthCubitState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          CustomSuccessSnackbar.showSuccess(
            context: context,
            message: "Welcome! Your account has been successfully created.",
            actionLabel: "Undo",
            onAction: () {},
          );
          Navigator.pushReplacementNamed(context, LoginView.routeName);
        }
        if (state is RegisterErrorState) {}
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is RegisterLoadingState ? true : false,
            child: const RegisterViewBody());
      },
    );
  }
}
