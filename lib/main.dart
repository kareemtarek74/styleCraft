import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_craft/Features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:style_craft/Features/Home/presentation/View/main_view.dart';
import 'package:style_craft/Features/Home/presentation/cubits/theme_cubit.dart';
import 'package:style_craft/core/functions/on_generate_function.dart';
import 'package:style_craft/core/services/get_it_service.dart';
import 'package:style_craft/core/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();

  runApp(const StyleCraftApp());
}

class StyleCraftApp extends StatelessWidget {
  const StyleCraftApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AuthCubitCubit>(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: onGenerateRoute,
            initialRoute: MainView.routeName,
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: themeMode,
          );
        },
      ),
    );
  }
}
