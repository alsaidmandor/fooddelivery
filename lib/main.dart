import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooddelivery/layout/home.dart';
import 'package:fooddelivery/shared/Repository/auth/User_Authentication.dart';
import 'package:fooddelivery/shared/bloc_observer.dart';
import 'package:fooddelivery/shared/constants.dart';
import 'package:fooddelivery/shared/cubit/cubit.dart';
import 'package:fooddelivery/shared/cubit/states.dart';
import 'package:fooddelivery/shared/di/di.dart';
import 'package:fooddelivery/shared/style/thems.dart';

import 'modules/login/login_sc.dart';
import 'modules/register/cubit/cubit.dart';
import 'modules/spalsh/splash_sc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await init();
  bool? appThemeMode = await getThemeMode();



  Widget start ;
  if ( userId != null)
  {
    start = const HomeScreen();
  }
  else{
     start = LoginScreen();
  }

  BlocOverrides.runZoned(
      ()=> runApp(MyApp(
        start:  SplashScreen(widget: LoginScreen(),),
        isDark: appThemeMode,
      )) ,
      blocObserver: MyBlocObserver());
}

class MyApp extends StatelessWidget {
  bool? isDark;
  Widget start;

  MyApp({
    Key? key,
    this.isDark,
    required this.start,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
        BlocProvider(
        create: (BuildContext context) => RegisterCubit(repository: UserAuthenticationRepository( )),
        ),
          BlocProvider(
            create: (BuildContext context) => AppCubit()
              ..setAppThemeMode(
                dark: isDark ?? false,
              ),
          ),
        ],
        child: BlocConsumer<AppCubit, AppStates>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = AppCubit.get(context);
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: lightTheme(context),
                darkTheme: darkTheme(context),
                themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
                home: start,
              );
            },),);
  }
}
