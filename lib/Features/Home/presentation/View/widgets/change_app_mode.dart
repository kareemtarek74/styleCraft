import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_craft/Features/Home/presentation/cubits/theme_cubit.dart';

class ModeButton extends StatelessWidget {
  const ModeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return GestureDetector(
          onTap: () {
            context.read<ThemeCubit>().toggleTheme();
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: themeMode == ThemeMode.light
                  ? Colors.grey.shade300
                  : Colors.grey.shade800,
              shape: BoxShape.circle,
            ),
            child: Icon(
              themeMode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode,
              color: themeMode == ThemeMode.light ? Colors.black : Colors.white,
            ),
          ),
        );
      },
    );
  }
}
