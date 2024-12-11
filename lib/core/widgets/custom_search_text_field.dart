import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:style_craft/Features/Home/presentation/cubits/theme_cubit.dart';
import 'package:style_craft/core/utils/app_images.dart';
import 'package:style_craft/core/utils/text_styles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0x0A000000),
                blurRadius: 9,
                offset: Offset(0, 2),
                spreadRadius: 0,
              )
            ],
          ),
          child: TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: SizedBox(
                width: 20,
                child: Center(
                  child: SvgPicture.asset(Assets.imagesSearchIcon),
                ),
              ),
              suffixIcon: SizedBox(
                width: 20,
                child: Center(
                  child: SvgPicture.asset(
                    Assets.imagesFilter,
                  ),
                ),
              ),
              hintStyle: Styles.regular13(context).copyWith(
                color: const Color(0xFF949D9E),
              ),
              hintText: 'Search about ...',
              filled: true,
              fillColor:
                  themeMode == ThemeMode.dark ? Colors.black : Colors.white,
              border: buildBorder(dark: themeMode == ThemeMode.dark),
              enabledBorder: buildBorder(dark: themeMode == ThemeMode.dark),
              focusedBorder: buildBorder(dark: themeMode == ThemeMode.dark),
            ),
          ),
        );
      },
    );
  }

  OutlineInputBorder buildBorder({required bool dark}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        width: 1,
        color: dark ? Colors.black : Colors.white,
      ),
    );
  }
}
