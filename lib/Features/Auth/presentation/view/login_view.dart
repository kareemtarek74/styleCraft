import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:style_craft/Features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:style_craft/Features/Auth/presentation/cubit/auth_state.dart';
import 'package:style_craft/Features/Auth/presentation/view/widgets/login_view_body.dart';
import 'package:style_craft/Features/Home/presentation/View/main_view.dart';
import 'package:style_craft/core/widgets/custom_error_snack_bar.dart';
import 'package:style_craft/core/widgets/custom_progress_indicator.dart';
import 'package:style_craft/core/widgets/custom_success_snack_bar.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String routeName = "login";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubitCubit, AuthCubitState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          CustomSuccessSnackbar.showSuccess(
            context: context,
            message: "You’re now logged in. Enjoy your session!",
          );
          Navigator.pushNamedAndRemoveUntil(
            context,
            MainView.routeName,
            (route) => false,
          );
        }
        if (state is LoginErrorState) {
          CustomErrorSnackbar.showError(
            context: context,
            message: state.errorMessage.toString(),
            actionLabel: 'Retry',
            onAction: () =>
                BlocProvider.of<AuthCubitCubit>(context).loginUser(),
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is LoginLoadingState ? true : false,
            progressIndicator: const CustomProgressIndicator(),
            child: const LoginViewBody());
      },
    );
  }
}
