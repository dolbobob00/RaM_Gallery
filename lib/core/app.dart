import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:voice_assistant/core/config/routes/routes.dart';
import 'package:voice_assistant/core/domain/theme_provider/cubit/theme_provider_cubit.dart';
import 'package:voice_assistant/presentation/providers/cubit/rick_and_morty_cubit.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeProviderCubit(),
        ),
        BlocProvider(
          create: (context) => GetIt.I<RickAndMortyCubit>(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            routerConfig: Routes.routerConfig,
            theme: context.watch<ThemeProviderCubit>().state,
          );
        },
      ),
    );
  }
}
