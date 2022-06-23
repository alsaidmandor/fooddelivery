import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooddelivery/shared/components/components.dart';
import 'package:fooddelivery/shared/cubit/states.dart';
import 'package:fooddelivery/shared/di/di.dart';
import 'package:fooddelivery/shared/network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppStateInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  changeAppThemeMode() {
    isDark = !isDark;

    di<CacheHelper>()
        .saveData(
      key: 'themeMode',
      value: isDark,
    )
        .then((value) {
      emit(AppStateChangeAppThemeMode());
    }).catchError((error) {
      print(error.toString());
    });
  }

  setAppThemeMode({required bool dark}) {
    isDark = dark;
    emit(AppStateChangeAppThemeMode());
  }

  navigateFromSplashToScreen(context , widget)
  {
    Future.delayed(const Duration(seconds: 2) , ).then((value) {
      navigateTo(context: context, widget: widget) ;
      emit(AppNavigateFromSplashState());
    });
  }

  List<Widget> bottomWidgets = [
    // HomeScreen(),
    // CategoriesScreen(),
    // FavoriteScreen(),
    // ProfileScreen(),
  ];

  int currentIndex = 0;

  void changeBottomIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomIndexState());
  }
}
