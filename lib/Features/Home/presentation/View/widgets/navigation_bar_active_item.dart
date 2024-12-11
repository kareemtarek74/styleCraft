import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:style_craft/Features/Home/presentation/cubits/theme_cubit.dart';
import 'package:style_craft/core/utils/app_colors.dart';
import 'package:style_craft/core/utils/text_styles.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.text, required this.image});

  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return Container(
            padding: const EdgeInsets.only(right: 16),
            decoration: ShapeDecoration(
              color: themeMode == ThemeMode.dark
                  ? const Color.fromARGB(255, 48, 47, 47)
                  : const Color(0xFFEEEEEE),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 26,
                  height: 30,
                  decoration: ShapeDecoration(
                    color: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Center(
                      child: SvgPicture.asset(
                    image,
                    color: themeMode == ThemeMode.light
                        ? Colors.white
                        : Colors.black,
                  )),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  text,
                  style: Styles.semiBold11(context)
                      .copyWith(color: AppColors.primaryColor),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
