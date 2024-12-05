import 'package:flutter/material.dart';
import 'package:style_craft/Features/Auth/presentation/view/on_boarding_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());

    default:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
  }
}
