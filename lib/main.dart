import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'core/domain/local_database/hive_helper.dart';
import 'package:voice_assistant/core/domain/local_database/local_database.dart';
import 'core/app.dart';
import 'core/config/di/service_locator.dart';
import 'presentation/providers/cubit/rick_and_morty_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await HiveHelper.init();
  final serviceLocator = GetItServiceLocator();
  serviceLocator.getItSetup();

  final localDatabase = GetIt.I<ILocalDatabase>();
  if (localDatabase.readData<String>('theme') == null) {
    await localDatabase.writeData<String>('theme', 'darkTheme');
  }

  GetIt.I<RickAndMortyCubit>().fetchCharacters();

  runApp(const MainApp());
}
