import 'package:flutter/material.dart';
import 'package:style_craft/Features/Home/presentation/View/cart_view.dart';
import 'package:style_craft/Features/Home/presentation/View/product_view.dart';

import '../home_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({
    super.key,
    required this.currentViewIndex,
  });

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentViewIndex,
      children: const [
        HomeView(),
        ProductsView(),
        CartView(),
      ],
    );
  }
}
