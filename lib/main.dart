import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_craft/Features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:style_craft/Features/Auth/presentation/view/on_boarding_view.dart';
import 'package:style_craft/core/functions/on_generate_function.dart';
import 'package:style_craft/core/services/get_it_service.dart';

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
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoute,
        initialRoute: OnBoardingView.routeName,
      ),
    );
  }
}
