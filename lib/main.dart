import 'package:flutter/material.dart';
import 'package:style_craft/Features/Auth/presentation/view/on_boarding_view.dart';
import 'package:style_craft/core/functions/on_generate_function.dart';

void main() {
  runApp(const StyleCraftApp());
}

class StyleCraftApp extends StatelessWidget {
  const StyleCraftApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: OnBoardingView.routeName,
    );
  }
}
