import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:voice_assistant/core/config/constants/constants.dart';
import 'package:voice_assistant/core/data/repository/network_repository.dart';
import 'package:voice_assistant/core/domain/local_database/local_database.dart';

import '../../../presentation/providers/cubit/rick_and_morty_cubit.dart';

abstract class IServiceLocator {
  void getItSetup();
}

class GetItServiceLocator implements IServiceLocator {
  final GetIt getIt = GetIt.instance;

  @override
  void getItSetup() {
    getIt.registerSingleton<Constants>(
      Constants(),
    );
    
    getIt.registerSingleton<ILocalDatabase>(
      HiveLocalDatabase(),
    );

    getIt.registerSingleton<Dio>(
      Dio(),
    );

    getIt.registerLazySingleton<INetworkRepository<Map<String, dynamic>>>(
      () => RaMNetworkRepository<Map<String, dynamic>>(
        () => getIt<Dio>(),
      ),
    );

    getIt.registerLazySingleton<RickAndMortyCubit>(
      () => RickAndMortyCubit(),
    );
  }
}
