import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fooddelivery/models/auth.dart';
import 'package:fooddelivery/modules/login/login_sc.dart';
import 'package:fooddelivery/modules/register/register_process.dart';
import 'package:fooddelivery/shared/Repository/auth/User_Authentication.dart';
import 'package:fooddelivery/shared/components/components.dart';
import 'package:fooddelivery/shared/components/default_button.dart';
import 'package:fooddelivery/shared/components/default_form_field.dart';
import 'package:fooddelivery/shared/components/default_text_button.dart';
import 'package:fooddelivery/shared/constants.dart';
import 'package:fooddelivery/shared/style/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  TextEditingController aNamWController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  late String? kName = aNamWController.text ;
  late String? email = emailController.text ;
  late String? password = passwordController.text ;
  bool? isKeepSignIn = false ;
  
  // AuthModel model = AuthModel(email: email, password: password, phone: phone, address: address)

  var auth = FirebaseAuth.instance ;
  var facebookAuth = FacebookAuth.instance ;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
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
                                Theme.of(context).scaffoldBackgroundColor,
                                Theme.of(context)
                                    .scaffoldBackgroundColor
                                    .withOpacity(0.1),
                              ]),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/pattern.png'),
                            fit: BoxFit.cover,
                          )),
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Flexible(
                                child: Image(
                                  image:
                                      AssetImage('assets/images/logo.png'),
                                  height: 140.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'FoodNinja',
                                style: GoogleFonts.viga(
                                    textStyle: textSize(context)
                                        .headline3
                                        ?.copyWith(color: green)),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                'Deliever Favorite Food',
                                style: GoogleFonts.inter(
                                    textStyle: textSize(context).button),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  Text('Sign Up For Free',
                      style: GoogleFonts.ptSans(
                        textStyle: textSize(context).headline5,
                      )),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        DefaultFormField(
                          label: 'Anamwp . . |',
                          prefix: IconlyBold.profile,
                          type: TextInputType.text,
                          controller: aNamWController,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        DefaultFormField(
                          label: 'Email',
                          prefix: IconlyBold.message,
                          type: TextInputType.emailAddress,
                          controller: emailController,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        DefaultFormField(
                          label: 'password',
                          type: TextInputType.visiblePassword,
                          controller: passwordController,
                          prefix: IconlyBold.lock,
                          suffix: cubit.suffix,
                          isPassword: cubit.isPassword,
                          suffixPressed: () {
                            RegisterCubit.get(context)
                                .changePasswordVisibility();
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            RoundCheckBox(
                              onTap: (selected) {
                                print(selected);
                                isKeepSignIn = selected! ;
                              },
                              border: Border.all(
                                width: 1,
                                color: black4,
                              ),
                              uncheckedColor: Colors.transparent,
                              checkedWidget: const Icon(
                                Icons.check,
                                size: 15.0,
                                color: white,
                              ),
                              size: 22,
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              'Keep Me Signed In',
                              style: GoogleFonts.ptSans(
                                  textStyle: textSize(context).caption,
                                  color: textSize(context)
                                      .caption
                                      ?.color
                                      ?.withOpacity(0.4)),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            RoundCheckBox(
                              onTap: (selected) {
                                print(selected);
                              },
                              border: Border.all(
                                width: 1,
                                color: black4,
                              ),
                              uncheckedColor: Colors.transparent,
                              checkedWidget: const Icon(
                                Icons.check,
                                size: 15.0,
                                color: white,
                              ),
                              size: 22,
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              'Email Me About Special Pricing',
                              style: GoogleFonts.ptSans(
                                textStyle: textSize(context).caption,
                                color: textSize(context)
                                    .caption
                                    ?.color
                                    ?.withOpacity(0.4),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefaultButton(
                        text: 'Create Account',
                        width: 175.0,
                        height: 45,
                        function: () {
                          // if(email!.isNotEmpty || password!.isNotEmpty || isKeepSignIn.toString().isNotEmpty || kName!.isNotEmpty )
                          // {
                          //   cubit.userRegister(kName , email , password,isKeepSignIn);
                          //   navigateTo(context: context, widget: RegisterProcessScreen());
                          //
                          // }
                          if(aNamWController.text.isNotEmpty || emailController.text.isNotEmpty || passwordController.text.isNotEmpty )
                            {
                              print('lllllllllll') ;
                              cubit.userRegister(kName , email , password,isKeepSignIn);
                              navigateTo(context: context, widget: RegisterProcessScreen());
                            }
                          else{
                            print('kkkkkkkk') ;
                          }


                        },
                        isUpper: false,
                      )
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  DefaultTextButton(
                    text: 'already have an account?',
                    isUpper: false,
                    function: () {
                      navigateTo(context: context, widget:  LoginScreen());
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
