import 'package:flutter/material.dart';
import 'package:style_craft/Features/Auth/presentation/view/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String routeName = "login";

  @override
  Widget build(BuildContext context) {
    return const LoginViewBody();
  }
}
