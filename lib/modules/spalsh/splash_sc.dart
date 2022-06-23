import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooddelivery/shared/components/components.dart';
import 'package:fooddelivery/shared/constants.dart';
import 'package:fooddelivery/shared/cubit/cubit.dart';
import 'package:fooddelivery/shared/cubit/states.dart';
import 'package:fooddelivery/shared/style/colors.dart';
import 'package:fooddelivery/shared/style/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {

  final Widget widget;

   SplashScreen({Key? key, required this.widget}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3) , ()=>navigateTo(context: context, widget: widget.widget) );
  }


  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context) ;
    return BlocConsumer<AppCubit , AppStates>(
      listener: (context, state) {},
      builder: (context, state) {

        return Scaffold(
          backgroundColor: white,
          body: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.4,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          white,
                          white.withOpacity(0.2),
                        ],
                      )),
                  child: const Image(
                    image: AssetImage('assets/images/pattern.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Image.asset('assets/images/logo.png'),
              const SizedBox(
                height: 10.0,
              ),
              Column(
                children: [
                  Text(
                    'FoodNinja',
                    style: GoogleFonts.viga(textStyle:textSize(context).headline3!.copyWith(color:green )),
                  ),
                  Text(
                    'Deliever Favorite Food',
                    style: GoogleFonts.inter(
                      textStyle: textSize(context).headline5!.copyWith(fontSize: 23.0),
                    ),
                  ),
                ],
              )
            ],
          ),
        ) ;
      },
    );
  }
}
