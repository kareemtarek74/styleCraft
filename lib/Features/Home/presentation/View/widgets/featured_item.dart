import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:style_craft/Features/Home/presentation/cubits/theme_cubit.dart';
import 'package:style_craft/core/utils/app_colors.dart';
import 'package:style_craft/core/utils/app_images.dart';
import 'package:style_craft/core/utils/text_styles.dart';
import 'package:style_craft/core/widgets/custom_button.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.sizeOf(context).width - 32;
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox(
        width: itemWidth,
        child: AspectRatio(
          aspectRatio: 342 / 158,
          child: Stack(
            children: [
              Positioned(
                left: itemWidth * .4,
                top: 0,
                bottom: 0,
                right: 0,
                child: const FittedBox(
                  fit: BoxFit.fill,
                  child: Image(
                    image: AssetImage(
                      Assets.imagesSplashphotopreview,
                    ),
                  ),
                ),
              ),
              BlocBuilder<ThemeCubit, ThemeMode>(
                builder: (context, themeMode) {
                  return Container(
                    width: itemWidth * .5,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: svg.Svg(Assets.imagesFeaturedItemBackground),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 33,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            'Eid Offers ',
                            style: Styles.regular13(context).copyWith(
                              color: themeMode == ThemeMode.dark
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'Sale 25%',
                            style: Styles.bold19(context).copyWith(
                              color: themeMode == ThemeMode.dark
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 11,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 45),
                            child: CustomButton(
                              hight: 16,
                              backgroundColor: themeMode == ThemeMode.dark
                                  ? Colors.black
                                  : Colors.white,
                              text: 'Shop Now',
                              style: Styles.bold13(context)
                                  .copyWith(color: AppColors.primaryColor),
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(
                            height: 29,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
