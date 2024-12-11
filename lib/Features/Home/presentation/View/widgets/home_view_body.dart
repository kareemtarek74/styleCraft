import 'package:flutter/material.dart';
import 'package:style_craft/Features/Home/presentation/View/widgets/custom_home_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                CustomHomeAppBar()
              ],
            ),
          )
        ],
      ),
    );
  }
}
