import 'package:flutter/material.dart';
import 'package:style_craft/core/utils/app_colors.dart';
import 'package:style_craft/core/utils/app_images.dart';
import 'package:style_craft/core/utils/text_styles.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_outline,
                )),
          ),
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Flexible(child: Image.asset(Assets.imagesSplashphotopreview)),
                const SizedBox(
                  height: 24,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  title: Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    'Buffer Jacket',
                    textAlign: TextAlign.left,
                    style: Styles.semiBold16(context),
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '200 EGP',
                          style: Styles.bold13(context).copyWith(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: '/',
                          style: Styles.bold13(context).copyWith(
                            color: AppColors.lightSecondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: ' ',
                          style: Styles.semiBold13(context).copyWith(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: 'One',
                          style: Styles.semiBold13(context).copyWith(
                            color: AppColors.lightSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                  trailing: GestureDetector(
                    onTap: () {},
                    child: const CircleAvatar(
                      backgroundColor: AppColors.primaryColor,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
