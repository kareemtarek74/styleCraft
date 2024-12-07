import 'package:flutter/material.dart';
import 'package:style_craft/Features/Auth/presentation/view/login_view.dart';
import 'package:style_craft/Features/Auth/presentation/view/on_boarding_view.dart';
import 'package:style_craft/Features/Auth/presentation/view/register_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case RegisterView.routeName:
      return MaterialPageRoute(builder: (context) => const RegisterView());
    default:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
  }
}
