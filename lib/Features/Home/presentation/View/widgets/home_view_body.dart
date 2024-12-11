import 'package:flutter/material.dart';
import 'package:style_craft/Features/Home/presentation/View/widgets/best_seling_header.dart';
import 'package:style_craft/Features/Home/presentation/View/widgets/custom_home_app_bar.dart';
import 'package:style_craft/Features/Home/presentation/View/widgets/featured_list.dart';
import 'package:style_craft/Features/Home/presentation/View/widgets/products_grid_view.dart';
import 'package:style_craft/core/widgets/custom_search_text_field.dart';

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
                CustomHomeAppBar(),
                SizedBox(
                  height: 16,
                ),
                SearchTextField(),
                SizedBox(
                  height: 12,
                ),
                FeaturedList(),
                SizedBox(
                  height: 12,
                ),
                BestSellingHeader(),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          ProductsGridView()
        ],
      ),
    );
  }
}
