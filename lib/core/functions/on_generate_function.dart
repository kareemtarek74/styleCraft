import 'package:flutter/material.dart';
import 'package:style_craft/Features/Auth/presentation/view/login_view.dart';
import 'package:style_craft/Features/Auth/presentation/view/on_boarding_view.dart';
import 'package:style_craft/Features/Auth/presentation/view/register_view.dart';
import 'package:style_craft/Features/Home/presentation/View/main_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case RegisterView.routeName:
      return MaterialPageRoute(builder: (context) => const RegisterView());
    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());
    default:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
  }
}
