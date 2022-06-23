import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooddelivery/modules/register/selecting_photo_screen.dart';
import 'package:fooddelivery/modules/register/upload_photo_screen.dart';
import 'package:fooddelivery/shared/components/components.dart';
import 'package:fooddelivery/shared/components/custom_screen_with_naigation_back.dart';
import 'package:fooddelivery/shared/components/default_form_field.dart';
import 'package:fooddelivery/shared/constants.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class RegisterProcessScreen extends StatelessWidget {
  RegisterProcessScreen({Key? key}) : super(key: key);

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var mobileController = TextEditingController();

late String? firstName  = firstNameController.text;
late String? lastName  = lastNameController.text;
late String? mobile  = mobileController.text;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {},
    builder: (context, state) {
      var cubit = RegisterCubit.get(context);

     return Scaffold(
        body: SingleChildScrollView(
          child: CustomScreenWithNavigationBack(
            widget: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: <Widget>[
                  DefaultFormField(
                    label: 'First Name',
                    hintStyle: GoogleFonts.ptSans(
                        textStyle: textSize(context).bodyText2,
                        color: Colors.grey.withOpacity(0.3)),
                    type: TextInputType.text,
                    controller: firstNameController,
                  ),
                  const SizedBox(height: 20.0),
                  DefaultFormField(
                    label: 'Last Name',
                    hintStyle: GoogleFonts.ptSans(
                        textStyle: textSize(context).bodyText2,
                        color: Colors.grey.withOpacity(0.3)),
                    type: TextInputType.text,
                    controller: lastNameController,
                  ),
                  const SizedBox(height: 20.0),
                  DefaultFormField(
                    label: 'Mobile Number',
                    hintStyle: GoogleFonts.ptSans(
                        textStyle: textSize(context).bodyText2,
                        color: Colors.grey.withOpacity(0.3)),
                    type: TextInputType.text,
                    controller: mobileController,
                  ),
                ],
              ),
            ),
            title: 'Fill in your bio to get started',
            clickOnButtonNext: () {
              print(firstName);
              print(lastName);
              print(mobile);
              print('${  cubit.authModel?.keepMeSignIn}');
              print('${  cubit.authModel?.aNamewp}');
              print('${  cubit.authModel?.email}');
             cubit.addUserDataToDatabase(firstName , lastName , mobile);
             if(firstName!.isNotEmpty || lastName!.isNotEmpty || mobile!.isNotEmpty)
               {
                 cubit.addUserDataToDatabase(firstName , lastName , mobile);
                 navigateTo(context: context, widget: const SelectingPhotoScreen());
               }
            ;
            },
          ),
        ),
      );

    }
    );
  }
}
