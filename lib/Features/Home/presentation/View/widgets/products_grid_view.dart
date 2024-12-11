import 'package:flutter/material.dart';
import 'package:style_craft/Features/Home/presentation/View/widgets/product_item.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 163 / 214,
          mainAxisSpacing: 8,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          return const ProductItem();
        });
  }
}
