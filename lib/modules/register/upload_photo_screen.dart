import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooddelivery/modules/register/congrat_screen.dart';
import 'package:fooddelivery/modules/register/cubit/cubit.dart';
import 'package:fooddelivery/shared/components/components.dart';
import 'package:fooddelivery/shared/components/custom_screen_with_naigation_back.dart';
import 'package:fooddelivery/shared/style/colors.dart';

import 'cubit/states.dart';

class UploadPhotoScreen extends StatelessWidget {
   const UploadPhotoScreen({Key? key}) : super(key: key);

 
  
  @override
  Widget build(BuildContext context) {
    var cubit = RegisterCubit.get(context) ;

    Widget _widget ;
    
    if(cubit .imagePath == null)
      {
        _widget = Image.asset('assets/images/profile.png', fit: BoxFit.cover,cacheHeight: 210,cacheWidth: 200,);
      }
    else
      {
        _widget = Image.file(cubit.imagePath! ,  fit: BoxFit.cover,cacheHeight: 210,cacheWidth: 200,);
      }
    
    return BlocConsumer<RegisterCubit , RegisterStates>(
        listener: (context, state) {

        },
    builder: (context, state) {

      return Scaffold(
        body: CustomScreenWithNavigationBack(
          title: 'Upload Your Photo Profile',
          widget: Stack(
            children: [
              Container(
                width: 200.0,
                height: 210.0,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(22.0)),
                ),
                child: _widget,

              ),
              Positioned(
                top: 10.0,
                right: 10.0,
                child: GestureDetector(
                  onTap: () {
                    cubit.removePathImage();
                    if(state ==RegisterRemoveIMagePathState())
                    {
                      _widget = Image.asset('assets/images/profile.png', fit: BoxFit.cover,);
                    }
                  },
                  child: Container(
                    height: 30.0,
                    width: 30.0,
                    decoration: const BoxDecoration(
                        color: white4,
                        borderRadius: BorderRadius.all(Radius.circular(45.0))
                    ),
                    child: const Icon(Icons.close, color: white,),
                  ),
                ),
              )
            ],
          ),
          clickOnButtonNext: () {
            print('${  cubit.authModel?.keepMeSignIn}');
            print('${  cubit.authModel?.aNamewp}');
            print('${  cubit.authModel?.email}');
            print('${  cubit.authModel?.password}');
            print('${  cubit.authModel?.firstName}');
            print('${  cubit.authModel?.lastName}');
            print('${  cubit.authModel?.phone}');
            navigateTo(context: context, widget: const CongratulationsScreen());
          },
        ),
      );
    }
    );
  }
}
