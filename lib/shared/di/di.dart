import 'package:fooddelivery/shared/cubit/cubit.dart';
import 'package:fooddelivery/shared/network/local/cache_helper.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt di = GetIt.I..allowReassignment = true;

Future init() async {
  final SharedPreferences sp = await SharedPreferences.getInstance();

  di.registerLazySingleton<SharedPreferences>(
    () => sp,
  );

  di.registerLazySingleton<CacheHelper>(
    () => CacheImpl(
      di<SharedPreferences>(),
    ),
  );

  di.registerFactory<AppCubit>(
    () => AppCubit(),
  );
}
