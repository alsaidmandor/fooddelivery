import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooddelivery/modules/login/cubit/states.dart';
import 'package:fooddelivery/modules/register/register_sc.dart';
import 'package:fooddelivery/shared/Repository/auth/User_Authentication.dart';
import 'package:fooddelivery/shared/components/components.dart';
import 'package:fooddelivery/shared/components/default_button.dart';
import 'package:fooddelivery/shared/components/default_form_field.dart';
import 'package:fooddelivery/shared/components/default_text_button.dart';
import 'package:fooddelivery/shared/components/socila_button.dart';
import 'package:fooddelivery/shared/constants.dart';
import 'package:fooddelivery/shared/style/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cubit/cubit.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late String? email = emailController.text ;
  late String password = passwordController.text ;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(repository: UserAuthenticationRepository()),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            backgroundColor: white,
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
                              white,
                              white.withOpacity(0.2),
                            ],
                          ),
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
                                image: AssetImage('assets/images/logo.png'),
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
                                textStyle: textSize(context).button,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Text('Login To Your Account',
                      style: GoogleFonts.ptSans(
                        textStyle: textSize(context).headline5,
                      )),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        DefaultFormField(
                          label: 'Email',
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
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text('Or Continue With',
                      style: GoogleFonts.ptSans(
                        textStyle: textSize(context).caption,
                      )),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        SoicalButton(
                          text: 'Facebook',
                          function: () {
                            cubit.facebookSignIn();
                          },
                          isUpper: true,
                          radius: 15.0,
                          image: 'facebook.png',
                        ),
                        const SizedBox(width: 25.0),
                        SoicalButton(
                          text: 'google',
                          function: () {
                            cubit.googleSignIn();
                          },
                          isUpper: true,
                          radius: 15.0,
                          image: 'google.png',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  DefaultTextButton(
                    text: 'Forgot Your Password?',
                    isUpper: true,
                    function: () {},
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefaultButton(
                        text: ' Login',
                        width: 175.0,
                        height: 45,
                        function: () {
                          print('${email}') ;
                          print('${password}') ;

                        },
                        isUpper: false,
                      )
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  DefaultTextButton(
                    text: "Don't have any account ?",
                    isUpper: false,
                    function: () {
                      navigateTo( context: context, widget: RegisterScreen() , );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
