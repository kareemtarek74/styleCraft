import 'package:flutter/material.dart';
import 'package:style_craft/core/utils/text_styles.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Text(
            'Best Selling',
            textAlign: TextAlign.right,
            style: Styles.bold16(context),
          ),
          const Spacer(),
          Text(
            'More',
            textAlign: TextAlign.center,
            style: Styles.regular13(context).copyWith(
              color: const Color(0xFF949D9E),
            ),
          )
        ],
      ),
    );
  }
}
