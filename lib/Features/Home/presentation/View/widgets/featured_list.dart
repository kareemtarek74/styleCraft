import 'package:flutter/material.dart';
import 'package:style_craft/Features/Home/presentation/View/widgets/featured_item.dart';

class FeaturedList extends StatelessWidget {
  const FeaturedList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(4, (index) {
          return const FeaturedItem();
        }),
      ),
    );
  }
}
