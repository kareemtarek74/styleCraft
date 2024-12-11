import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_craft/Features/Home/presentation/View/widgets/change_app_mode.dart';
import 'package:style_craft/Features/Home/presentation/cubits/theme_cubit.dart';
import 'package:style_craft/core/utils/app_images.dart';
import 'package:style_craft/core/utils/text_styles.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          trailing: const ModeButton(),
          leading: Image.asset(Assets.imagesProfileImage),
          title: Text(
            ' Good Morning !..',
            textAlign: TextAlign.left,
            style: Styles.regular16(context).copyWith(
              color: const Color(0xFF949D9E),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              'Kareem',
              textAlign: TextAlign.left,
              style: Styles.bold16(context).copyWith(
                  color: themeMode == ThemeMode.light
                      ? Colors.black
                      : Colors.white),
            ),
          ),
        );
      },
    );
  }
}
