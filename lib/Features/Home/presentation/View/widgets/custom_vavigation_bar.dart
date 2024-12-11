import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_craft/Features/Home/presentation/View/widgets/navigation_bar_item.dart';
import 'package:style_craft/Features/Home/presentation/cubits/theme_cubit.dart';

import '../../../Domain/Entities/buttom_navigation_bar_entity.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key, required this.onItemTapped});
  final ValueChanged<int> onItemTapped;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return Container(
          width: 375,
          height: 70,
          decoration: ShapeDecoration(
            color: themeMode == ThemeMode.light ? Colors.white : Colors.black,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x19000000),
                blurRadius: 25,
                offset: Offset(0, -2),
                spreadRadius: 0,
              )
            ],
          ),
          child: Row(
            children: bottomNavigationBarItems.asMap().entries.map((e) {
              var index = e.key;
              var entity = e.value;

              return Expanded(
                flex: index == selectedIndex ? 3 : 2,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      widget.onItemTapped(index);
                    });
                  },
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 150),
                    transitionBuilder: (child, animation) {
                      return ScaleTransition(
                        scale: animation,
                        child: child,
                      );
                    },
                    child: NaivgationBarItem(
                      key: ValueKey(index ==
                          selectedIndex), // Ensure unique key for animation
                      isSelected: selectedIndex == index,
                      bottomNavigationBarEntity: entity,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
