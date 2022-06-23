import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooddelivery/modules/register/cubit/cubit.dart';
import 'package:fooddelivery/modules/register/cubit/states.dart';
import 'package:fooddelivery/modules/register/upload_photo_screen.dart';
import 'package:fooddelivery/shared/components/components.dart';
import 'package:fooddelivery/shared/components/custom_screen_with_naigation_back.dart';
import 'package:fooddelivery/shared/constants.dart';
import 'package:fooddelivery/shared/style/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectingPhotoScreen extends StatelessWidget {
  const SelectingPhotoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = RegisterCubit.get(context) ;
    return BlocConsumer<RegisterCubit , RegisterStates>(
      listener: (context, state) {

      },
      builder: (context, state) {

        return   Scaffold(
          backgroundColor: white4,
          body: SingleChildScrollView(
            child: CustomScreenWithNavigationBack(
              title: 'Upload Your Photo Profile',
              widget: Padding(
                padding: const EdgeInsets.symmetric( horizontal: 20.0),
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        cubit.getImageFromGallery() ;
                      },
                      child: Container(
                        height: 129,
                        decoration: const BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.all(Radius.circular(22.0))
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/gallery.png'),
                              const SizedBox(height: 5.0,),
                              Text('From Gallery' , style: GoogleFonts.ptSans(
                                  textStyle: textSize(context).bodyText2,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                      ),
                    ),
                    const   SizedBox(height: 15.0,),
                    GestureDetector(
                      onTap: (){
                        cubit.getImageFromCamera() ;
                      },
                      child: Container(
                        height: 129,
                        decoration: const BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.all(Radius.circular(22.0))
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/camera.png'),
                              const SizedBox(height: 5.0,),
                              Text('Take Photo' , style: GoogleFonts.ptSans(
                                  textStyle: textSize(context).bodyText2,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              clickOnButtonNext: () {
                navigateTo(context: context, widget: const UploadPhotoScreen());
              },
            ),
          ),
        ) ;
      },

    );
  }
}
