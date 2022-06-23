import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fooddelivery/shared/style/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'network/local/cache_helper.dart';





TextTheme textSize(context) => Theme.of(context).textTheme;
bool isAppDark(context) => AppCubit.get(context).isDark;

Future<bool?> getThemeMode() async =>
    await CacheImpl(await SharedPreferences.getInstance()).getData(
      key: 'themeMode',
    );

Widget themeButton(context) => BlocBuilder<AppCubit, AppStates>(
      builder: (BuildContext context, state) {
        return IconButton(
          onPressed: () {
            AppCubit.get(context).changeAppThemeMode();
          },
          icon: const Icon(
            IconlyBold.swap,
            color: green,
          ),
        );
      },
    );

String? userId = '';
