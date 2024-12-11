import 'package:flutter/material.dart';
import 'package:style_craft/Features/Home/Domain/Entities/buttom_navigation_bar_entity.dart';
import 'package:style_craft/Features/Home/presentation/View/widgets/navigation_bar_active_item.dart';
import 'package:style_craft/Features/Home/presentation/View/widgets/navigation_bar_inActive_item.dart';

class NaivgationBarItem extends StatelessWidget {
  const NaivgationBarItem(
      {super.key,
      required this.isSelected,
      required this.bottomNavigationBarEntity});

  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarEntity;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(
            image: bottomNavigationBarEntity.activeImage,
            text: bottomNavigationBarEntity.name,
          )
        : InActiveItem(
            image: bottomNavigationBarEntity.inActiveImage,
          );
  }
}
